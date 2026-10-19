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
        // בדף הבית: מציגים את ההודעה פעם אחת, ומרוקנים
        if (Session["homeMsg"].ToString() != "")
        {
            st = $"<p>{Session["homeMsg"]}</p>";
            Session["homeMsg"] = "";
        }

        if (Session["admin"].ToString() == "yes")
        {
            st += "<h2>שלום מנהל</h2>";
            st += "<p><a href='Manage.aspx'>ניהול החברים</a></p>";
        }
        else
            st += $"<h2>שלום {Session["user"]}</h2>";
    }
}
