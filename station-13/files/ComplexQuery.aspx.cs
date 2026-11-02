using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ComplexQuery : System.Web.UI.Page
{
    public string st = "";
    public string msg = "";
    public string sql = "";
    public string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Form["submit"] != null)
        {
            //--- קבלת נתונים מהטופס ---
            string field1 = Request.Form["field1"].Trim();
            string field2 = Request.Form["field2"].Trim();
            string value1 = Request.Form["value1"].Trim();
            string value2 = Request.Form["value2"].Trim();
            string op = Request.Form["op"];

            if (value1 == "" || value2 == "")
                msg = "יש למלא את שני התנאים. לחיפוש לפי תנאי אחד: "
                    + "<a href='SimpleQuery.aspx'>חיפוש פשוט</a>";
            else
            {
                //--- בניית תבנית מתאימה לכל סוג שאילתה ---
                string query1 = "";
                if (field1 == "gender" || field1 == "prefix" || field1 == "city")
                    query1 = $"{field1} = N'{value1}'";
                else if (field1 == "yearBorn")
                    query1 = $"{field1} = {value1}";
                else if (field1 == "yearFrom")
                    query1 = $"yearBorn >= {value1}";
                else if (field1 == "hobby")
                {
                    // תחביב → מיפוי לשדות hob1..hob5
                    int val1 = int.Parse(value1);

                    switch (val1)
                    {
                        case 1: field1 = "hob1"; break;
                        case 2: field1 = "hob2"; break;
                        case 3: field1 = "hob3"; break;
                        case 4: field1 = "hob4"; break;
                        case 5: field1 = "hob5"; break;
                    }
                    query1 = $"{field1} = 'T'";
                }
                else if (field1 == "email")
                    // מכיל
                    query1 = $"{field1} LIKE '%{value1}%'";
                else
                    // מתחיל ב
                    query1 = $"{field1} LIKE N'{value1}%'";

                string query2 = "";
                if (field2 == "gender" || field2 == "prefix" || field2 == "city")
                    query2 = $"{field2} = N'{value2}'";
                else if (field2 == "yearBorn")
                    query2 = $"{field2} = {value2}";
                else if (field2 == "yearTo")
                    query2 = $"yearBorn <= {value2}";
                else if (field2 == "hobby")
                {
                    // תחביב → מיפוי לשדות hob1..hob5
                    int val2 = int.Parse(value2);

                    switch (val2)
                    {
                        case 1: field2 = "hob1"; break;
                        case 2: field2 = "hob2"; break;
                        case 3: field2 = "hob3"; break;
                        case 4: field2 = "hob4"; break;
                        case 5: field2 = "hob5"; break;
                    }
                    query2 = $"{field2} = 'T'";
                }
                else if (field2 == "email")
                    // מכיל
                    query2 = $"{field2} LIKE '%{value2}%'";
                else
                    // מתחיל ב
                    query2 = $"{field2} LIKE N'{value2}%'";

                //--- הרכבת והרצת השאילתות המלאות ---
                string sqlSelect;
                string fileName = "usersDB.mdf";
                string tableName = "usersTbl";

                if (op == "and")
                    sqlSelect = $"SELECT * FROM {tableName} WHERE {query1} AND {query2}";
                else
                    sqlSelect = $"SELECT * FROM {tableName} WHERE {query1} OR {query2}";

                sql = sqlSelect;

                DataTable table = Helper.ExecuteDataTable(fileName, sqlSelect);
                int length = table.Rows.Count;

                if (length == 0)
                    msg = "לא נמצאו רשומות מתאימות";
                else
                {
                    msg = "נמצאו " + length + " רשומות מתאימות";

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
                    st = "<table class='list'>" + st + "</table>";
                    title = "<h1>טבלת משתמשים</h1>";
                }
            }
        }
    }
}