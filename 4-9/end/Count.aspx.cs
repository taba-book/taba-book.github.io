using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Count : System.Web.UI.Page
{
    public string st = "";
    int count = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        count++;
        st = $"<h2>מספר הכניסות לדף: {count}</h2>";
    }
}
