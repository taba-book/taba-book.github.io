using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DeleteRecord : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string uName = Request.QueryString["uName"];

        //--- שומר ראשון: בלי ערך בכתובת אין מה למחוק ---
        if (uName == null)
        {
            Session["homeMsg"] = "לא צוין משתמש למחיקה, ולכן הופניתם לדף הבית.";
            Response.Redirect("Default.aspx");
            return;
        }

        //--- שומר שני: רק מנהל, או גולש שמוחק את עצמו ---
        if (Session["admin"].ToString() == "no" && Session["uName"].ToString() != uName)
        {
            Session["homeMsg"] = "אין לכם הרשאה למחוק משתמש אחר, ולכן הופניתם לדף הבית.";
            Response.Redirect("Default.aspx");
            return;
        }

        string fileName = "usersDB.mdf";
        string tableName = "usersTbl";

        string sqlDelete = $"DELETE FROM {tableName} WHERE uName = '{uName}'";
        Helper.DoQuery(fileName, sqlDelete);

        if (Session["admin"].ToString() == "no")
        {
            // Session.Abandon מוחק את ה-Session, ולכן ההודעה עוברת בכתובת
            Session.Abandon();
            Response.Redirect("Default.aspx?deleted=yes");
        }
        else
        {
            Session["adminMsg"] = $"המשתמש {uName} נמחק.";
            Response.Redirect("DeleteUser.aspx");
        }
    }
}