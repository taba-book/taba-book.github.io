using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage : System.Web.UI.Page
{
    public string st = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"].ToString() == "no")
            st = "<h2>אינכם מנהלים, אין לכם הרשאה להיכנס לדף ניהול</h2>";
        else
        {
            st = "<h2>ניהול החברים</h2>";

            DataTable table = Helper.ExecuteDataTable("practiceDB.mdf",
                                  "SELECT uName, fName FROM usersTbl");

            st += "<table class='list'>";
            st += "<tr><th>שם משתמש</th><th>שם פרטי</th></tr>";

            for (int i = 0; i < table.Rows.Count; i++)
            {
                string uName = table.Rows[i]["uName"].ToString();
                string fName = table.Rows[i]["fName"].ToString();

                st += $"<tr><td>{uName}</td><td>{fName}</td></tr>";
            }

            st += "</table>";
        }
    }
}
