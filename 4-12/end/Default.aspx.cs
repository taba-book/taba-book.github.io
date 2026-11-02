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
        int visits = (int)Application["visits"];
        int online = (int)Application["online"];

        st = $"<h2>שלום {Session["userFName"]}</h2>";
        if (Session["uName"].ToString() == "אורח")
            st += "<p><a href='Login.aspx'>כניסה</a></p>";
        else
            st += "<p><a href='Logout.aspx'>יציאה</a></p>";
        st += $"<p>ביקרו באתר עד כה {visits} גולשים.</p>";
        st += $"<p>מחוברים כרגע: {online}.</p>";
    }
}
