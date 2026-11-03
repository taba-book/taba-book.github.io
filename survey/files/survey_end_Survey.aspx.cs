using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Survey : System.Web.UI.Page
{
    public string summary = "";
    public string survey = "";
    public string surveyMsg = "";

    // --- תוספות שהדף מזריק לטבלת הבחירה אחרי הצבעה ---
    public string lockClass = "";              // surveyLocked
    public string lockAttr = "";               // disabled
    public string[] checkAttr = new string[4]; // checked לאפשרות שנבחרה
    public string[] rowAttr = new string[4];   // class לשורה שנבחרה

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uName"].ToString() == "אורח")
        {
            surveyMsg = "<div class='messageBox'>על מנת להצביע בסקר יש להתחבר לאתר</div>";
            return;
        }

        if (!(bool)Session["voted"])
        {
            if (!IsPostBack)
            {
                surveyMsg = "<div class='messageBox'>בחרו תשובה ולחצו על הצבעה</div>";
                return;
            }

            string ans = Request.Form["surveyAnswer"];

            if (ans == null)
            {
                surveyMsg = "<div class='messageBox'>לא נבחרה תשובה</div>";
                return;
            }

            Session["voted"] = true;
            Session["myAnswer"] = ans;

            Application.Lock();
            switch (ans)
            {
                case "1":
                    Application["q1"] = (int)Application["q1"] + 1;
                    break;
                case "2":
                    Application["q2"] = (int)Application["q2"] + 1;
                    break;
                case "3":
                    Application["q3"] = (int)Application["q3"] + 1;
                    break;
                case "4":
                    Application["q4"] = (int)Application["q4"] + 1;
                    break;
            }
            Application.UnLock();
        }

        // --- מכאן ואילך הגולש הצביע, ואין הבדל בין הצבעה חדשה לישנה ---
        BuildGraph();
        LockOptions();
    }

    // --- בניית טבלת התוצאות מתוך המונים ---
    private void BuildGraph()
    {
        // --- העברת סך הקולות של אפשרות למערך ---
        int[] sumVotes = new int[4];

        sumVotes[0] = (int)Application["q1"];
        sumVotes[1] = (int)Application["q2"];
        sumVotes[2] = (int)Application["q3"];
        sumVotes[3] = (int)Application["q4"];

        // --- בניית מערך אחוזים לכל אפשרות ---
        int totalVotes = sumVotes[0] + sumVotes[1] + sumVotes[2] + sumVotes[3];

        int[] percents = new int[4];

        if (totalVotes > 0)
        {
            // מחשבים 3 ראשונים רגיל
            percents[0] = sumVotes[0] * 100 / totalVotes;
            percents[1] = sumVotes[1] * 100 / totalVotes;
            percents[2] = sumVotes[2] * 100 / totalVotes;

            // האחרון = השלמה ל-100%
            percents[3] = 100 - (percents[0] + percents[1] + percents[2]);
        }

        // אפשרות בלי קולות: אפס אחוזים, ולכן גם בלי פס
        for (int i = 0; i < percents.Length; i++)
            if (sumVotes[i] == 0)
                percents[i] = 0;

        // --- לבדיקת נכונות בזמן תכנות נציג בערכים מוחלטים ---
        summary = $"<span class='sumLetter'>א</span> = {sumVotes[0]}";
        summary += $" | <span class='sumLetter'>ב</span> = {sumVotes[1]}";
        summary += $" | <span class='sumLetter'>ג</span> = {sumVotes[2]}";
        summary += $" | <span class='sumLetter'>ד</span> = {sumVotes[3]}";

        // --- קביעת גודל הגרף לכל אפשרות: כל אחוז = 5 פיקסלים, ולכן 100% = 500px ---
        int scale = 5;
        double[] barWidths = new double[4];
        for (int i = 0; i < barWidths.Length; i++)
            barWidths[i] = percents[i] * scale;

        // --- בניית הגרף ---
        survey = "<table class='graphTable' dir='ltr'>";

        survey += "<tr class='fixedRow'>";
        survey += "<td colspan='2' class='graphTitle'>תוצאות הסקר</td>";
        survey += "</tr>";

        survey += "<tr class='fixedRow'>";
        survey += "<td class='barCell'><div class='barBox'>";
        survey += $"<span class='barText'>{percents[0]}% &nbsp;</span>";
        survey += $"<div class='barFillRed' style='width:{barWidths[0]}px;'></div>";
        survey += "</div></td>";
        survey += "<td class='letterCell'>א</td>";
        survey += "</tr>";

        survey += "<tr class='fixedRow'>";
        survey += "<td class='barCell'><div class='barBox'>";
        survey += $"<span class='barText'>{percents[1]}% &nbsp;</span>";
        survey += $"<div class='barFillYellow' style='width:{barWidths[1]}px;'></div>";
        survey += "</div></td>";
        survey += "<td class='letterCell'>ב</td>";
        survey += "</tr>";

        survey += "<tr class='fixedRow'>";
        survey += "<td class='barCell'><div class='barBox'>";
        survey += $"<span class='barText'>{percents[2]}% &nbsp;</span>";
        survey += $"<div class='barFillGreen' style='width:{barWidths[2]}px;'></div>";
        survey += "</div></td>";
        survey += "<td class='letterCell'>ג</td>";
        survey += "</tr>";

        survey += "<tr class='fixedRow'>";
        survey += "<td class='barCell'><div class='barBox'>";
        survey += $"<span class='barText'>{percents[3]}% &nbsp;</span>";
        survey += $"<div class='barFillBlue' style='width:{barWidths[3]}px;'></div>";
        survey += "</div></td>";
        survey += "<td class='letterCell'>ד</td>";
        survey += "</tr>";

        survey += "<tr class='fixedRow'>";
        survey += $"<td colspan='2' class='graphSummary'>{summary}</td>";
        survey += "</tr>";
        
        survey += "</table>";
    }

    // --- נעילת טבלת הבחירה, וההודעה המסכמת ---
    private void LockOptions()
    {
        string[] letters = { "א", "ב", "ג", "ד" };
        string[] animals = { "אריה", "עיט", "לווייתן", "פיל" };

        int chosen = int.Parse(Session["myAnswer"].ToString()) - 1;

        lockClass = "surveyLocked";
        lockAttr = "disabled";

        for (int i = 0; i < 4; i++)
        {
            checkAttr[i] = "";
            rowAttr[i] = "";
        }

        checkAttr[chosen] = "checked";
        rowAttr[chosen] = "class='rowChosen'";

        surveyMsg = "<div class='messageBox'>";
        surveyMsg += $"בחרתם באפשרות {letters[chosen]} ({animals[chosen]}).";
        surveyMsg += "<br />ההצבעה שלכם נספרה ומופיעה בתוצאות שמשמאל.";
        surveyMsg += "<br />אפשר להצביע פעם אחת בלבד. תודה רבה!";
        surveyMsg += "</div>";
    }
}