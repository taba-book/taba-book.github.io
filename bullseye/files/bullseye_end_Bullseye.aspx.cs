using System;

public partial class Bullseye : System.Web.UI.Page
{
    // המחרוזת שתודפס בתוך הטבלה ב-ASPX
    public string tableRows = "";

    // אובייקט אקראי אחד קבוע למחלקה
    private static Random rnd = new Random();

    public string denyMsg = "";
    public string disp = "block";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uName"].ToString() == "אורח")
        {
            denyMsg = "<div class='messageBox messageAlert'>";
            denyMsg += "הדף שביקשתם פתוח למשתמשים רשומים בלבד.";
            denyMsg += "<br />";
            denyMsg += "<a href='Login.aspx'>התחברות</a> · <a href='Register.aspx'>הרשמה</a>";
            denyMsg += "</div>";
            disp = "none";
            return;
        }

        // אם עדיין לא נשמר מספר סודי - מגרילים
        if (Session["secretNumber"] == null)
            Session["secretNumber"] = CreateRandomNumber();

        // אם עדיין לא נשמרו מהלכי משחק - מתחילים ממחרוזת ריקה
        if (Session["gameData"] == null)
            Session["gameData"] = "";

        // אם עדיין לא נשמר מצב המשחק - מתחילים ממסך הפתיחה
        if (Session["gameStarted"] == null)
            Session["gameStarted"] = false;

        // בונים את שורות הטבלה לפי הנתונים ששמורים ב-Session
        tableRows = BuildTableRows();

        // מציגים את הפאנל המתאים
        UpdatePanels();

        // הודעת פתיחה רק בטעינה ראשונה של הדף
        if (!IsPostBack)
        {
            if ((bool)Session["gameStarted"] == true)
                lblMsg.Text = "הכניסו ניחוש בן 4 ספרות";
            else
                lblMsg.Text = "";

            lblMsg.CssClass = "";
        }
    }

    protected void btnStartGame_Click(object sender, EventArgs e)
    {
        Session["gameStarted"] = true;
        UpdatePanels();

        lblMsg.Text = "הכניסו ניחוש בן 4 ספרות";
        lblMsg.CssClass = "";
    }

    protected void btnCheck_Click(object sender, EventArgs e)
    {
        string guess = txtGuess.Text.Trim();
        string secret = Session["secretNumber"].ToString();

        // בדיקה: חייבים בדיוק 4 תווים
        if (guess.Length != 4)
        {
            lblMsg.Text = "יש להכניס בדיוק 4 ספרות";
            lblMsg.CssClass = "errorMsg";
            return;
        }

        // בדיקה: כל התווים חייבים להיות ספרות
        for (int i = 0; i < 4; i++)
        {
            if (guess[i] < '0' || guess[i] > '9')
            {
                lblMsg.Text = "מותר להכניס ספרות בלבד";
                lblMsg.CssClass = "errorMsg";
                return;
            }
        }

        int bull = 0;
        int hit = 0;

        bool[] usedSecret = new bool[4];
        bool[] usedGuess = new bool[4];

        // שלב א' - בודקים בול
        for (int i = 0; i < 4; i++)
        {
            if (guess[i] == secret[i])
            {
                bull++;
                usedSecret[i] = true;
                usedGuess[i] = true;
            }
        }

        // שלב ב' - בודקים פגיעה
        for (int i = 0; i < 4; i++)
        {
            if (usedGuess[i] == false)
            {
                for (int j = 0; j < 4; j++)
                {
                    if (usedSecret[j] == false && guess[i] == secret[j])
                    {
                        hit++;
                        usedSecret[j] = true;
                        usedGuess[i] = true;
                        break;
                    }
                }
            }
        }

        // מוסיפים את המהלך החדש למחרוזת הנתונים
        // פורמט של כל מהלך:
        // ניחוש|בול|פגיעה~
        string move = guess + "|" + bull + "|" + hit + "~";
        Session["gameData"] = Session["gameData"].ToString() + move;

        // בונים מחדש את שורות הטבלה
        tableRows = BuildTableRows();

        // הודעה למשתמש
        if (bull == 4)
        {
            lblMsg.Text = "כל הכבוד! ניחשתם נכון את המספר";
            lblMsg.CssClass = "winMsg";
        }
        else
        {
            lblMsg.Text = "הניחוש נבדק. אפשר לנסות שוב";
            lblMsg.CssClass = "";
        }

        txtGuess.Text = "";
    }

    protected void btnNewGame_Click(object sender, EventArgs e)
    {
        // מאפסים הכול
        Session["secretNumber"] = CreateRandomNumber();
        Session["gameData"] = "";
        Session["gameStarted"] = false;

        tableRows = BuildTableRows();

        txtGuess.Text = "";
        lblMsg.Text = "";
        lblMsg.CssClass = "";

        UpdatePanels();
    }

    // פעולה שמחליטה איזה פאנל יופיע
    private void UpdatePanels()
    {
        bool started = (bool)Session["gameStarted"];

        pnlStart.Visible = !started;
        pnlGame.Visible = started;
    }

    // פעולה שמגרילה מספר בן 4 ספרות
    private string CreateRandomNumber()
    {
        string num = "";

        for (int i = 0; i < 4; i++)
            num += rnd.Next(0, 10);

        return num;
    }

    // פעולה שבונה את שורות הטבלה
    private string BuildTableRows()
    {
        string rows = "";
        string data = Session["gameData"].ToString();

        // אם עדיין אין ניחושים
        if (data == "")
        {
            for (int i = 0; i < 6; i++)
            {
                rows += "<tr>";
                rows += "<td>-</td>";
                rows += "<td>-</td>";
                rows += "<td>-</td>";
                rows += "</tr>";
            }

            return rows;
        }

        string[] moves = data.Split('~');
        int count = 0;

        // קודם בונים שורות לפי הניחושים שבאמת היו
        for (int i = 0; i < moves.Length; i++)
        {
            if (moves[i] != "")
            {
                string[] parts = moves[i].Split('|');

                rows += "<tr>";
                rows += "<td>" + parts[0] + "</td>";
                rows += "<td>" + parts[1] + "</td>";
                rows += "<td>" + parts[2] + "</td>";
                rows += "</tr>";

                count++;
            }
        }

        // אם יש פחות מ-6 ניחושים, משלימים שורות עם "-"
        while (count < 6)
        {
            rows += "<tr>";
            rows += "<td>-</td>";
            rows += "<td>-</td>";
            rows += "<td>-</td>";
            rows += "</tr>";

            count++;
        }

        return rows;
    }
}