using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    public string st = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        int visits = (int)Application["visits"];
        int online = (int)Application["online"];

        // בדף הבית: מציגים את ההודעה פעם אחת, ומרוקנים
        if (Session["homeMsg"].ToString() != "")
        {
            st = $"<p>{Session["homeMsg"]}</p>";
            Session["homeMsg"] = "";
        }

        if (Request.QueryString["deleted"] == "yes")
            st += "<p>החשבון שלכם נמחק, ונותקתם מהאתר.</p>";

        if (Session["admin"].ToString() == "yes")
        {
            st += "<h2>שלום מנהל</h2>";
            st += "<p><a href='Manage.aspx'>ניהול החברים</a></p>";
        }
        else
            st += $"<h2>שלום {Session["userFName"]}</h2>";

        if (Session["uName"].ToString() == "אורח")
            st += "<p><a href='Login.aspx'>כניסה</a></p>";
        else
            st += "<p><a href='Logout.aspx'>יציאה</a></p>";

        if (Session["uName"].ToString() != "אורח" && Session["admin"].ToString() == "no")
            st += "<p><a href=\"#\" onclick=\"confirmDelete(); return false;\">" +
                "מחיקת החשבון שלי</a></p>";
        st += $"<p>ביקרו באתר עד כה {visits} גולשים.</p>";
        st += $"<p>מחוברים כרגע: {online}.</p>";
    }
}
