using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UpdateUser : System.Web.UI.Page
{
    public string msg = "";
    public string sqlUpdate = "";
    public string sqlSelect = "";
    public string maleChecked = "", femaleChecked = "";
    public string hob1Checked = "", hob2Checked = "", hob3Checked = "", hob4Checked = "", hob5Checked = "";
    public string prefixOptions = "", cityOptions = "", yearOptions = "";
    public int yearBorn;
    public string uName, fName, lName, email, gender, prefix, phone, city, pw;
    public string hob1, hob2, hob3, hob4, hob5;
    protected void Page_Load(object sender, EventArgs e)
    {
        string fileName = "usersDB.mdf";
        string tableName = "usersTbl";
        uName = Session["uName"].ToString();
        if (uName == "אורח" || Session["admin"].ToString() == "yes")
        {
            Session["homeMsg"] = "הדף שביקשתם פתוח למשתמשים רשומים בלבד, ולכן הופניתם לדף הבית.";
            Response.Redirect("Default.aspx");
            return;
        }

        //--- שלב 2: שליפת פרטי המשתמש מטבלת הנתונים ---
        sqlSelect = $"SELECT * FROM {tableName} WHERE uName = '{uName}'";
        DataTable table = Helper.ExecuteDataTable(fileName, sqlSelect);

        //--- בדיקה האם שם המשתמש קיים במערכת ---
        int length = table.Rows.Count;
        if (length == 0)
            msg = "אינכם משתמשים רשומים במערכת";
        else
        {
            //--- שליפת פרטי המשתמש מהרשומה לפני עדכון ---
            fName = table.Rows[0]["fName"].ToString();
            lName = table.Rows[0]["lName"].ToString();
            email = table.Rows[0]["email"].ToString();
            gender = table.Rows[0]["gender"].ToString();
            yearBorn = (int)table.Rows[0]["yearBorn"];
            prefix = table.Rows[0]["prefix"].ToString();
            phone = table.Rows[0]["phone"].ToString();
            city = table.Rows[0]["city"].ToString();
            hob1 = table.Rows[0]["hob1"].ToString();
            hob2 = table.Rows[0]["hob2"].ToString();
            hob3 = table.Rows[0]["hob3"].ToString();
            hob4 = table.Rows[0]["hob4"].ToString();
            hob5 = table.Rows[0]["hob5"].ToString();
            pw = table.Rows[0]["pw"].ToString();
        }

        //--- שלב 4: הגולש לחץ "עדכון" ---
        //--- אחזור הפרטים המעודכנים מהטופס ---
        if (IsPostBack)
        {
            fName = Request.Form["fName"].Trim();
            lName = Request.Form["lName"].Trim();
            email = Request.Form["email"].Trim();
            gender = Request.Form["gender"];
            yearBorn = int.Parse(Request.Form["yearBorn"].Trim());
            prefix = Request.Form["prefix"].Trim();
            phone = Request.Form["phone"].Trim();
            city = Request.Form["city"].Trim();
            pw = Request.Form["pw"];
            if (pw == null)
            {
                pw = "";
            }
            pw = pw.Trim();

            //--- טיפול בתחביבים ---
            string hobby;

            if (Request.Form["hobby"] == null)
            {
                hobby = "";
            }
            else
            {
                hobby = Request.Form["hobby"].ToString();
            }

            hob1 = "F";
            hob2 = "F";
            hob3 = "F";
            hob4 = "F";
            hob5 = "F";

            //--- 5 - 1 בדיקה האם מחרוזת התחביבים מכילה את הערכים ---
            if (hobby.Contains('1')) hob1 = "T";
            if (hobby.Contains('2')) hob2 = "T";
            if (hobby.Contains('3')) hob3 = "T";
            if (hobby.Contains('4')) hob4 = "T";
            if (hobby.Contains('5')) hob5 = "T";

            if (pw.Length == 0)
            {
                msg = "יש להזין סיסמה";
            }
            else if (pw.Length < 6 || pw.Length > 10)
            {
                msg = "הסיסמה חייבת להכיל בין 6 ל-10 תווים";
            }
            else
            {
                //--- בניית שאילתת העדכון ---
                sqlUpdate = $"UPDATE {tableName} ";
                sqlUpdate += $"SET fName = N'{fName}', ";
                sqlUpdate += $"lName = N'{lName}', ";
                sqlUpdate += $"email = '{email}', ";
                sqlUpdate += $"gender = N'{gender}', ";
                sqlUpdate += $"yearBorn = {yearBorn}, ";
                sqlUpdate += $"prefix = '{prefix}', ";
                sqlUpdate += $"phone = '{phone}', ";
                sqlUpdate += $"city = N'{city}', ";

                sqlUpdate += $"hob1 = '{hob1}', ";
                sqlUpdate += $"hob2 = '{hob2}', ";
                sqlUpdate += $"hob3 = '{hob3}', ";
                sqlUpdate += $"hob4 = '{hob4}', ";
                sqlUpdate += $"hob5 = '{hob5}', ";

                sqlUpdate += $"pw = '{pw}' ";
                sqlUpdate += $"WHERE uName = '{uName}'";

                Helper.DoQuery(fileName, sqlUpdate);

                msg = "הפרטים עודכנו בהצלחה";
            }
        }

        //--- שלב 3: מכינים את הטופס, מהערכים שבמשתנים ---
        if (gender == "זכר")
            maleChecked = "checked";
        else if (gender == "נקבה")
            femaleChecked = "checked";

        if (hob1 == "T") hob1Checked = "checked";
        if (hob2 == "T") hob2Checked = "checked";
        if (hob3 == "T") hob3Checked = "checked";
        if (hob4 == "T") hob4Checked = "checked";
        if (hob5 == "T") hob5Checked = "checked";

        string[] prefixes = { "050", "052", "053", "054", "055", "057", "058", "02", "03", "04", "08", "09", "077" };

        for (int i = 0; i < prefixes.Length; i++)
        {
            if (prefixes[i] == prefix)
                prefixOptions += $"<option value='{prefixes[i]}' selected>{prefixes[i]}</option>";
            else
                prefixOptions += $"<option value='{prefixes[i]}'>{prefixes[i]}</option>";
        }

        string[] cities = { "מטולה", "נהרייה", "כרמיאל", "חיפה", "נתניה", "רמת-השרון", "רעננה", "תל-אביב-יפו", "חולון", "ראשון-לציון", "יהוד", "יבנה", "אשקלון", "שדרות", "באר שבע", "דימונה", "אילת" };

        for (int i = 0; i < cities.Length; i++)
        {
            if (cities[i] == city)
                cityOptions += $"<option value='{cities[i]}' selected>{cities[i]}</option>";
            else
                cityOptions += $"<option value='{cities[i]}'>{cities[i]}</option>";
        }

        //---- יצירת גלילה לשנות לידה -----
        int from = yearBorn - 3;
        int to = yearBorn + 3;
        for (int y = from; y <= to; y++)
        {
            if (y == yearBorn)
                yearOptions += $"<option value='{y}' selected>{y}</option>";
            else
                yearOptions += $"<option value='{y}'>{y}</option>";
        }
    }
}