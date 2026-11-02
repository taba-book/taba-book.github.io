using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LoginAdmin : System.Web.UI.Page
{
    public string msg = "";
    public string sqlManager = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Form["submit"] != null)
        {
            string mName = Request.Form["mName"].Trim();
            string mPw = Request.Form["mPw"].Trim();

            string fileName = "usersDB.mdf";
            string tableName = "managerTbl";

            sqlManager = $"SELECT * FROM {tableName} WHERE (mName = '{mName}' AND pw = '{mPw}')";

            DataTable table = Helper.ExecuteDataTable(fileName, sqlManager);

            int length = table.Rows.Count;
            if (length == 0)
            {
                msg = "שם המנהל או הסיסמה שגויים.";
            }
            else
            {
                Session["uName"] = "מנהל";
                Session["userFName"] = "מנהל";
                Session["admin"] = "yes";
                Response.Redirect("Default.aspx");
            }
        }
    }
}