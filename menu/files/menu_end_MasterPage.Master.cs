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

        //--- תפריט אופקי: רשימה מקוננת ---
        menuBar = "<div class='mpMenuBar'><ul id='nav'>";
        menuBar += "<li><a href='Default.aspx'"
            + " class='mpMenuBarBtn'>דף הבית</a></li>";
        menuBar += "<li><a href='Animals.aspx'"
            + " class='mpMenuBarBtn'>בעלי חיים</a>";

        //--- התפריט הנפתח: שבעת דפי בעלי החיים ---
        menuBar += "<ul>";
        menuBar += "<li><a href='Lion.aspx'"
            + " class='mpMenuDropBtn'>אריה</a></li>";
        menuBar += "<li><a href='Elephant.aspx'"
            + " class='mpMenuDropBtn'>פיל</a></li>";
        menuBar += "<li><a href='Tiger.aspx'"
            + " class='mpMenuDropBtn'>נמר</a></li>";
        menuBar += "<li><a href='Camel.aspx'"
            + " class='mpMenuDropBtn'>גמל</a></li>";
        menuBar += "<li><a href='Badger.aspx'"
            + " class='mpMenuDropBtn'>גירית מצויה</a></li>";
        menuBar += "<li><a href='Eagle.aspx'"
            + " class='mpMenuDropBtn'>עיט</a></li>";
        menuBar += "<li><a href='FinWhale.aspx'"
            + " class='mpMenuDropBtn'>לווייתן מצוי</a></li>";
        menuBar += "</ul></li>";

        //--- הברכה והתפריט, לפי מי שמחובר ---

        //משתמש לא מחובר
        if (Session["uName"].ToString() == "אורח")
        {
            loginMsg += "<a href='Login.aspx' class='mpMenuSideBtn'>התחברות</a><br />";
            loginMsg += "<a href='Register.aspx' class='mpMenuSideBtn'>הרשמה</a>";
            loginMsg += "</div>";

            menuBar += "<li><a href='LoginAdmin.aspx'"
                + " class='mpMenuBarBtn'>כניסת מנהל</a></li>";
            menuBar += "</ul></div>";
        }
        //אם מנהל מחובר
        else if (Session["admin"].ToString() == "yes")
        {
            loginMsg += "<a href='ManagerPage.aspx' class='mpMenuSideBtn'>דף ניהול</a> <br />";
            loginMsg += "<a href='Logout.aspx' class='mpMenuSideBtn'>התנתקות</a>";
            loginMsg += "</div>";

            menuBar += "<li><a href='Bullseye.aspx'"
                + " class='mpMenuBarBtn'>בול פגיעה</a></li>";
            menuBar += "<li><a href='Gallery.aspx'"
                + " class='mpMenuBarBtn'>גלריה</a></li>";
            menuBar += "<li><a href='Survey.aspx'"
                + " class='mpMenuBarBtn'>סקר</a></li>";
            menuBar += "<li><a href='Timetable.aspx'"
                + " class='mpMenuBarBtn'>מערכת שעות</a></li>";
            menuBar += "</ul></div>";
        }
        //אם משתמש רגיל מחובר
        else
        {
            loginMsg += "<a href='UpdateUser.aspx' class='mpMenuSideBtn'>עדכון פרטים</a> <br />";
            loginMsg += "<a href='#' onclick='confirmDelete(); return false;' class='mpMenuSideBtn'>מחיקת חשבון</a> <br />";
            loginMsg += "<a href='Logout.aspx' class='mpMenuSideBtn'>התנתקות</a>";
            loginMsg += "</div>";

            menuBar += "<li><a href='Bullseye.aspx'"
                + " class='mpMenuBarBtn'>בול פגיעה</a></li>";
            menuBar += "<li><a href='Gallery.aspx'"
                + " class='mpMenuBarBtn'>גלריה</a></li>";
            menuBar += "<li><a href='Survey.aspx'"
                + " class='mpMenuBarBtn'>סקר</a></li>";
            menuBar += "<li><a href='Timetable.aspx'"
                + " class='mpMenuBarBtn'>מערכת שעות</a></li>";
            menuBar += "<li><a href='LoginAdmin.aspx'"
                + " class='mpMenuBarBtn'>כניסת מנהל</a></li>";
            menuBar += "</ul></div>";
        }
    }
}