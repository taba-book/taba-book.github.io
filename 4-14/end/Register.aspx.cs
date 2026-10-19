using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    public string st = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Form["submit"] != null)
        {
            string uName = Request.Form["uName"];
            string pass = Request.Form["pass"];
            string fName = Request.Form["fName"];
            string lName = Request.Form["lName"];
            string city = Request.Form["city"];

            string check = $"SELECT * FROM usersTbl WHERE uName = N'{uName}'";

            if (Helper.IsExist("practiceDB.mdf", check))
                st = $"<p>שם המשתמש {uName} כבר תפוס. בחרו שם אחר.</p>";
            else
            {
                string sql = "INSERT INTO usersTbl (uName, pass, fName, lName, city)"
                             + $" VALUES (N'{uName}', N'{pass}', N'{fName}',"
                             + $" N'{lName}', N'{city}')";

                Helper.DoQuery("practiceDB.mdf", sql);
                st = "<p>ההרשמה הושלמה בהצלחה.</p>";
            }
        }
    }
}
