using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Timetable : System.Web.UI.Page
{
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
        }
    }
}