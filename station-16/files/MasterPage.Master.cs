using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    public string loginMsg = "";
    public string menuBar = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        //--- מחרוזת הברכה למשתמש ---
        loginMsg = "<div class='mpMenuSide'>";
        loginMsg += "<span style='font-weight: 600; font-size: 18px;'>שלום ";
        loginMsg += Session["userFName"].ToString();
        loginMsg += "</span><br/>";

        // --- תפריט אופקי ---
        menuBar = "<div class='mpMenuBar'>";
        menuBar += "<a href='Default.aspx' class='mpMenuBarBtn'>דף הבית</a>";
        menuBar += "<a href='Animals.aspx' class='mpMenuBarBtn'>בעלי חיים</a>";

        //--- הברכה והתפריט, לפי מי שמחובר ---

        //משתמש לא מחובר
        if (Session["uName"].ToString() == "אורח")
        {
            loginMsg += "<a href='Login.aspx' class='mpMenuSideBtn'>התחברות</a><br />";
            loginMsg += "<a href='Register.aspx' class='mpMenuSideBtn'>הרשמה</a>";
            loginMsg += "</div>";

            menuBar += "<a href='LoginAdmin.aspx' class='mpMenuBarBtn'>כניסת מנהל</a>";
            menuBar += "</div>";
        }
        //אם מנהל מחובר
        else if (Session["admin"].ToString() == "yes")
        {
            loginMsg += "<a href='ManagerPage.aspx' class='mpMenuSideBtn'>דף ניהול</a> <br />";
            loginMsg += "<a href='Logout.aspx' class='mpMenuSideBtn'>התנתקות</a>";
            loginMsg += "</div>";

            menuBar += "<a href='Gallery.aspx' class='mpMenuBarBtn'>גלריה</a>";
            menuBar += "<a href='Timetable.aspx' class='mpMenuBarBtn'>מערכת שעות</a>";
            menuBar += "</div>";
        }
        //אם משתמש רגיל מחובר
        else
        {
            loginMsg += "<a href='UpdateUser.aspx' class='mpMenuSideBtn'>עדכון פרטים</a> <br />";
            loginMsg += "<a href='#' onclick='confirmDelete(); return false;' class='mpMenuSideBtn'>מחיקת חשבון</a> <br />";
            loginMsg += "<a href='Logout.aspx' class='mpMenuSideBtn'>התנתקות</a>";
            loginMsg += "</div>";

            menuBar += "<a href='Gallery.aspx' class='mpMenuBarBtn'>גלריה</a>";
            menuBar += "<a href='Timetable.aspx' class='mpMenuBarBtn'>מערכת שעות</a>";
            menuBar += "<a href='LoginAdmin.aspx' class='mpMenuBarBtn'>כניסת מנהל</a>";
            menuBar += "</div>";
        }
    }
}