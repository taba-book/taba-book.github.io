using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    public string loginMsg = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        //--- מחרוזת הברכה למשתמש ---
        loginMsg = "<div class='mpMenuSide'>";
        loginMsg += "<span style='font-weight: 600; font-size: 18px;'>שלום ";
        loginMsg += Session["userFName"].ToString();
        loginMsg += "</span><br/>";

        //--- הברכה והתפריט, לפי מי שמחובר ---

        //משתמש לא מחובר
        if (Session["uName"].ToString() == "אורח")
        {
            loginMsg += "<a href='Login.aspx' class='mpMenuSideBtn'>התחברות</a><br />";
            loginMsg += "<a href='Register.aspx' class='mpMenuSideBtn'>הרשמה</a>";
            loginMsg += "</div>";

        }
        //אם משתמש רגיל מחובר
        else
        {
            loginMsg += "<a href='Logout.aspx' class='mpMenuSideBtn'>התנתקות</a>";
            loginMsg += "</div>";

        }
    }
}