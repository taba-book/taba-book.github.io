using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Delete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string uName = Request.QueryString["uName"];

        //--- שומר ראשון: בלי שם בכתובת, אין מה למחוק ---
        if (uName == null)
        {
            Session["homeMsg"] = "לא צוין חבר למחיקה, ולכן הופניתם לדף הבית.";
            Response.Redirect("Default.aspx");
            return;
        }

        //--- שומר שני: רק מנהל, או חבר שמוחק את עצמו ---
        if (Session["admin"].ToString() == "no" && Session["uName"].ToString() != uName)
        {
            Session["homeMsg"] = "אין לכם הרשאה למחוק חבר אחר, ולכן הופניתם לדף הבית.";
            Response.Redirect("Default.aspx");
            return;
        }

        //--- המחיקה ---
        string sql = $"DELETE FROM usersTbl WHERE uName = N'{uName}'";
        Helper.DoQuery("practiceDB.mdf", sql);

        //--- לאן ממשיכים ---
        if (Session["admin"].ToString() == "no")
        {
            Session.Abandon();
            Response.Redirect("Default.aspx?deleted=yes");
        }
        else
        {
            Session["adminMsg"] = $"החבר {uName} נמחק.";
            Response.Redirect("Manage.aspx");
        }
    }
}
