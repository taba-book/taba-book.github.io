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
        if (Session["user"] == null)
        {
            st = "<h2>שלום אורח</h2>";
            st += "<p>כדי להיכנס למועדון עליכם להתחבר.</p>";
        }
        else
        {
            string user = Session["user"].ToString();
            st = $"<h2>שלום {user}, טוב לראות אותך שוב</h2>";
            st += "<p>אתם מחוברים כרגע למועדון.</p>";
        }
    }
}
