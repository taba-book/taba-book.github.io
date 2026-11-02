using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManagerPage : System.Web.UI.Page
{
    public string msg = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"].ToString() == "no")
        {
            msg = "<div class='messageBox messageAlert'>";
            msg += "אינכם מנהלים, אין לכם הרשאה להיכנס לדף ניהול.";
            msg += "<br />";
            msg += "<a href='LoginAdmin.aspx'>כניסת מנהל</a> · <a href='Default.aspx'>חזרה לדף הבית</a>";
            msg += "</div>";
        }
        else
        {
            msg += "<div class='managerMenuBar'>";
            msg += "<a href='ShowTable.aspx' class='managerMenuBarBtn'>הצגת טבלה</a>";
            msg += "<a href='DeleteUser.aspx' class='managerMenuBarBtn'>מחיקת משתמש</a><br />";
            msg += "<a href='SimpleQuery.aspx' class='managerMenuBarBtn'>שאילתה פשוטה</a>";
            msg += "<a href='ComplexQuery.aspx' class='managerMenuBarBtn'>שאילתה מורכבת</a>";
            msg += "</div>";
        }
    }
}