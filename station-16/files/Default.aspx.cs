using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    public string homeMsg = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        //--- הודעה לאורח שניסה להיכנס לדף המיועד למשתמשים רשומים ---
        if (Session["homeMsg"].ToString() != "")
        {
            homeMsg = "<div class='messageBox messageAlert'>" + Session["homeMsg"];
            if (Session["uName"].ToString() == "אורח")
            {
                homeMsg += "<br />";
                homeMsg += "<a href='Login.aspx'>התחברות</a> · <a href='Register.aspx'>הרשמה</a>";
            }
            homeMsg += "</div>";
            Session["homeMsg"] = "";  // איפוס, אחרת ההודעה תופיע בכל דף מכאן והלאה
        }

        //--- הודעה לגולש שמחק את החשבון שלו (מגיעה בכתובת, כי ה-Session נמחק) ---
        if (Request.QueryString["deleted"] == "yes")
            homeMsg = "<div class='messageBox'>החשבון שלכם נמחק, ונותקתם מהאתר.</div>";
    }
}