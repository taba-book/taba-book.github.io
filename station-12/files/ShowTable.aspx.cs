using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShowTable : System.Web.UI.Page
{
    public string st = "";
    public string msg = "";
    public string sqlSelect = "";
    public string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        string fileName = "usersDB.mdf";
        string tableName = "usersTbl";

        sqlSelect = $"SELECT * FROM {tableName}";
        DataTable table = Helper.ExecuteDataTable(fileName, sqlSelect);

        int length = table.Rows.Count;
        if (length == 0)
            msg = "אין נרשמים";
        else
        {
            st = "<tr>";
            st += "<th style='text-align: center; width: 80px;'>שם משתמש</th>";
            st += "<th style='text-align: center; width: 60px;'>שם פרטי</th>";
            st += "<th style='text-align: center; width: 80px;'>שם משפחה</th>";
            st += "<th style='text-align: center; width: 140px;'>דוא\"ל</th>";
            st += "<th style='text-align: center;'>שנת לידה</th>";
            st += "<th style='text-align: center;'>מגדר</th>";
            st += "<th style='text-align: center; width: 100px;'>טלפון</th>";
            st += "<th style='text-align: center; width: 100px;'>יישוב</th>";
            st += "<th style='text-align: center;'>מחשבים</th>";
            st += "<th style='text-align: center;'>מוזיקה</th>";
            st += "<th style='text-align: center;'>טלוויזיה</th>";
            st += "<th style='text-align: center;'>ספורט</th>";
            st += "<th style='text-align: center;'>רשתות חברתיות</th>";
            st += "</tr>";

            for (int i = 0; i < length; i++)
            {
                st += "<tr>";
                st += $"<td style='text-align: center;'>{table.Rows[i]["uName"]}</td>";
                st += $"<td>{table.Rows[i]["fName"]}</td>";
                st += $"<td>{table.Rows[i]["lName"]}</td>";
                st += $"<td style='width: 60px; text-align: left;'>{table.Rows[i]["email"]}</td>";
                st += $"<td style='text-align: center;'>{table.Rows[i]["yearBorn"]}</td>";
                st += $"<td style='text-align: center; width: 80px;'>{table.Rows[i]["gender"]}</td>";
                st += $"<td style='text-align: center; width: 100px;'>{table.Rows[i]["prefix"]}-{table.Rows[i]["phone"]}</td>";
                st += $"<td style='width: 100px;'>{table.Rows[i]["city"]}</td>";
                st += $"<td style='text-align: center;'>{table.Rows[i]["hob1"]}</td>";
                st += $"<td style='text-align: center;'>{table.Rows[i]["hob2"]}</td>";
                st += $"<td style='text-align: center;'>{table.Rows[i]["hob3"]}</td>";
                st += $"<td style='text-align: center;'>{table.Rows[i]["hob4"]}</td>";
                st += $"<td style='text-align: center;'>{table.Rows[i]["hob5"]}</td>";
                st += "</tr>";
            }
            msg = $"נרשמו: {length} אנשים";
            st = "<table class='list'>" + st + "</table>";
            title = "<h1>טבלת משתמשים</h1>";
        }
    }
}