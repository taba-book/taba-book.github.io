using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LoginAdmin : System.Web.UI.Page
{
    public string st = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Form["submit"] != null)
        {
            string mName = Request.Form["mName"];
            string pass = Request.Form["pass"];

            string sql = $"SELECT * FROM managerTbl WHERE mName = N'{mName}'"
                         + $" AND pass = N'{pass}'";

            if (Helper.IsExist("practiceDB.mdf", sql))
            {
                Session["admin"] = "yes";
                Response.Redirect("Default.aspx");
            }
            else
                st = "<p>שם המנהל או הסיסמה שגויים.</p>";
        }
    }
}
