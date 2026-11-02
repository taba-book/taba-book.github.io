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
    public string sql = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Form["submit"] != null)
        {
            string uName = Request.Form["uName"].Trim();
            string pass = Request.Form["pass"].Trim();

            sql = $"SELECT * FROM usersTbl WHERE uName = N'{uName}'"
                + $" AND pass = N'{pass}'";
            DataTable table = Helper.ExecuteDataTable("practiceDB.mdf", sql);

            if (table.Rows.Count == 0)
                st = "<p>שם המשתמש או הסיסמה שגויים. נסו שוב.</p>";
            else
            {
                Session["uName"] = table.Rows[0]["uName"].ToString();
                Session["userFName"] = table.Rows[0]["fName"].ToString();
                Response.Redirect("Default.aspx");
            }
        }
    }
}
