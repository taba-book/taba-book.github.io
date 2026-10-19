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
        if (Request.Form["submit"] != null)
        {
            string uName = Request.Form["uName"];
            string pass = Request.Form["pass"];

            string sql = $"SELECT * FROM usersTbl WHERE uName = N'{uName}'"
                         + $" AND pass = N'{pass}'";

            if (Helper.IsExist("practiceDB.mdf", sql))
            {
                Session["user"] = uName;
                Response.Redirect("Default.aspx");
            }
            else
                st = "<p>שם המשתמש או הסיסמה שגויים. נסו שוב.</p>";
        }
    }
}
