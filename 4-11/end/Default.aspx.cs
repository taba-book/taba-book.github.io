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

        st = "<h1>מועדון הקוראים</h1>";
        st += $"<p>ביקרו באתר עד כה {visits} גולשים.</p>";
        st += $"<p>מחוברים כרגע: {online}.</p>";
    }
}
