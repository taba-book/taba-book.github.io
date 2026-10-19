using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Edit : System.Web.UI.Page
{
    public string st = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"].ToString() == "אורח")
        {
            Session["homeMsg"] = "הדף שביקשתם פתוח לחברים רשומים בלבד, ולכן הופניתם לדף הבית.";
            Response.Redirect("Default.aspx");
            return;
        }

        if (Request.Form["submit"] != null)
        {
            string user = Session["user"].ToString();
            string city = Request.Form["city"];
            string eMail = Request.Form["eMail"];

            string sql = "UPDATE usersTbl"
                         + $" SET city = N'{city}', eMail = N'{eMail}'"
                         + $" WHERE uName = N'{user}'";

            Helper.DoQuery("practiceDB.mdf", sql);
            st = "<p>הפרטים עודכנו בהצלחה.</p>";
        }
    }
}
