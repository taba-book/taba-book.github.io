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
        //---- יצירת גלילה לשנות לידה -----
        int selectedYear = DateTime.Now.Year - 16;
        int from = selectedYear - 3;
        int to = selectedYear + 3;
        for (int y = from; y <= to; y++)
        {
            if (y == selectedYear)
                yearOptions += $"<option value='{y}' selected>{y}</option>";
            else
                yearOptions += $"<option value='{y}'>{y}</option>";
        }

        if (Request.Form["submit"] != null)
        {
            string uName = Request.Form["uName"].Trim();
            string fName = Request.Form["fName"].Trim();
            string lName = Request.Form["lName"].Trim();
            string email = Request.Form["email"].Trim();
            string gender = Request.Form["gender"];
            string yearBorn = Request.Form["yearBorn"].Trim();
            string prefix = Request.Form["prefix"].Trim();
            string phone = Request.Form["phone"].Trim();
            string city = Request.Form["city"].Trim();
            string hobbies = Request.Form["hobby"];
            string pw = Request.Form["pw"].Trim();

            char hob1 = 'F';
            char hob2 = 'F';
            char hob3 = 'F';
            char hob4 = 'F';
            char hob5 = 'F';

            if (hobbies != null)
            {
                if (hobbies.Contains('1')) hob1 = 'T';
                if (hobbies.Contains('2')) hob2 = 'T';
                if (hobbies.Contains('3')) hob3 = 'T';
                if (hobbies.Contains('4')) hob4 = 'T';
                if (hobbies.Contains('5')) hob5 = 'T';
            }

            //טבלת מעקב לנתונים שהתקבלו כהכנה לשמירה במס"ד
            st = "<table>";
            st += "<tr><th colspan='2'>הפרטים שהתקבלו</th></tr>";
            st += $"<tr><td>שם משתמש:</td><td>{uName}</td></tr>";
            st += $"<tr><td>שם פרטי:</td><td>{fName}</td></tr>";
            st += $"<tr><td>שם משפחה:</td><td>{lName}</td></tr>";
            st += $"<tr><td>דואר אלקטרוני:</td><td>{email}</td></tr>";
            st += $"<tr><td>מגדר:</td><td>{gender}</td></tr>";
            st += $"<tr><td>שנת לידה:</td><td>{yearBorn}</td></tr>";
            st += $"<tr><td>טלפון:</td><td>{prefix}-{phone}</td></tr>";
            st += $"<tr><td>יישוב:</td><td>{city}</td></tr>";
            st += $"<tr><td>תחביבים:</td><td>";
            string sep = "";
            if (hob1 == 'T') { st += sep + "מחשבים"; sep = ", "; }
            if (hob2 == 'T') { st += sep + "מוזיקה"; sep = ", "; }
            if (hob3 == 'T') { st += sep + "טלוויזיה"; sep = ", "; }
            if (hob4 == 'T') { st += sep + "ספורט"; sep = ", "; }
            if (hob5 == 'T') { st += sep + "רשתות חברתיות"; sep = ", "; }
            st += $"</td></tr>";
            st += $"<tr><td>סיסמה:</td><td>{pw}</td></tr>";
            st += "</table>";
        }
    }
}