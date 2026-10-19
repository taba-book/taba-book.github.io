using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Users : System.Web.UI.Page
{
    public string st = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        int count = 5;
        st = "<h1>ברוכים הבאים למועדון</h1>";
        st += $"<p>כרגע רשומים במועדון {count} חברים.</p>";
    }
}
