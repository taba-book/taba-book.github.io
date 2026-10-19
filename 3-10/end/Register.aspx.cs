using System;
using System.Collections.Generic;
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
            string fName = Request.Form["fName"];
            string email = Request.Form["email"];

            st = "<table>";
            st += "<tr><th colspan='2'>הפרטים שהתקבלו</th></tr>";
            st += $"<tr><td>שם משתמש:</td><td>{uName}</td></tr>";
            st += $"<tr><td>שם פרטי:</td><td>{fName}</td></tr>";
            st += $"<tr><td>דואר אלקטרוני:</td><td>{email}</td></tr>";
            st += "</table>";
        }
    }
}
