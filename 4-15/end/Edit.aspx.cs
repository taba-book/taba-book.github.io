using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Edit : System.Web.UI.Page
{
    public string msg = "";
    public string sqlSelect = "", sqlUpdate = "";
    public string uName = "", fName = "", lName = "", eMail = "", gender = "", city = "",
        pass = "";
    public string maleChecked = "", femaleChecked = "";
    public string cityOptions = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        //--- שלב 1: רק חבר מחובר יכול לעדכן ---
        if (Session["uName"].ToString() == "אורח" || Session["admin"].ToString() == "yes")
        {
            Session["homeMsg"] = "הדף שביקשתם פתוח לחברים רשומים בלבד, ולכן הופניתם לדף הבית.";
            Response.Redirect("Default.aspx");
            return;
        }

        uName = Session["uName"].ToString();

        //--- שלב 2: שולפים את הפרטים שלו מהמסד ---
        sqlSelect = $"SELECT * FROM usersTbl WHERE uName = N'{uName}'";
        DataTable table = Helper.ExecuteDataTable("practiceDB.mdf", sqlSelect);

        fName = table.Rows[0]["fName"].ToString();
        lName = table.Rows[0]["lName"].ToString();
        eMail = table.Rows[0]["eMail"].ToString();
        gender = table.Rows[0]["gender"].ToString();
        city = table.Rows[0]["city"].ToString();
        pass = table.Rows[0]["pass"].ToString();

        //--- שלב 4: הגולש לחץ "עדכון" ---
        if (IsPostBack)
        {
            fName = Request.Form["fName"].Trim();
            lName = Request.Form["lName"].Trim();
            eMail = Request.Form["eMail"].Trim();
            city = Request.Form["city"];
            pass = Request.Form["pass"].Trim();

            gender = Request.Form["gender"];
            if (gender == null)
                gender = "";

            sqlUpdate = "UPDATE usersTbl SET";
            sqlUpdate += $" fName = N'{fName}',";
            sqlUpdate += $" lName = N'{lName}',";
            sqlUpdate += $" eMail = N'{eMail}',";
            sqlUpdate += $" gender = N'{gender}',";
            sqlUpdate += $" city = N'{city}',";
            sqlUpdate += $" pass = N'{pass}'";
            sqlUpdate += $" WHERE uName = N'{uName}'";

            Helper.DoQuery("practiceDB.mdf", sqlUpdate);
            msg = "הפרטים עודכנו בהצלחה";
        }

        //--- שלב 3: מכינים את הטופס, מהערכים שבמשתנים ---
        if (gender == "זכר")
            maleChecked = "checked";
        else if (gender == "נקבה")
            femaleChecked = "checked";

        string[] cities = { "חיפה", "תל אביב", "ירושלים", "באר שבע" };

        for (int i = 0; i < cities.Length; i++)
        {
            if (cities[i] == city)
                cityOptions += $"<option value='{cities[i]}' selected>{cities[i]}</option>";
            else
                cityOptions += $"<option value='{cities[i]}'>{cities[i]}</option>";
        }
    }
}
