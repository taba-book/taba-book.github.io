using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Delete : System.Web.UI.Page
{
    public string st = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        // בדף פעולה: מחיקה, עדכון, כל דף שמבצע ומעביר הלאה
        if (Session["admin"].ToString() == "no")
        {
            Session["homeMsg"] = "הדף שביקשתם מיועד למנהל בלבד, ולכן הופניתם לדף הבית.";
            Response.Redirect("Default.aspx");
            return;
        }
    }
}
