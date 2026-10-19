using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    public string st = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        // כתיבה לזיכרון האישי של הגולש
        Session["user"] = "dana";
        Session["city"] = "חיפה";
    }
}
