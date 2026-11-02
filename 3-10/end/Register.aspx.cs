using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    public string st = "";
    public string yearOptions = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        int selectedYear = DateTime.Now.Year - 16;
        int from = selectedYear - 3;
        int to = selectedYear + 3;
        for (int y = from; y <= to; y++)
        {
            if (y == selectedYear)
                yearOptions +=
                    $"<option value='{y}' selected>{y}</option>";
            else
                yearOptions +=
                    $"<option value='{y}'>{y}</option>";
        }

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
