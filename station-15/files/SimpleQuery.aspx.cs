using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SimpleQuery : System.Web.UI.Page
{
    public string st = "";
    public string msg = "";
    public string denyMsg = "";
    public string sql = "";
    public string title = "";
    public string disp = "block";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"].ToString() == "no")
        {
            denyMsg = "<div class='messageBox messageAlert'>";
            denyMsg += "אינכם מנהלים, אין לכם הרשאה להיכנס לדף ניהול.";
            denyMsg += "<br />";
            denyMsg += "<a href='LoginAdmin.aspx'>כניסת מנהל</a> · <a href='Default.aspx'>חזרה לדף הבית</a>";
            denyMsg += "</div>";
            disp = "none";
        }

        else if (Request.Form["submit"] != null)
        {
            //--- קבלת נתונים מהטופס ---
            string field = Request.Form["field"].Trim();
            string value = Request.Form["value"].Trim();

            if (value == "")
                msg = "הקלידו מה לחפש";
            else
            {
                //--- הגדרות ---
                string fileName = "usersDB.mdf";
                string tableName = "usersTbl";

                string sqlSelect;

                //--- בניית השאילתה ---
                if (field == "gender" || field == "prefix" || field == "city")
                    sqlSelect = $"SELECT * FROM {tableName} WHERE {field} = N'{value}'";

                else if (field == "yearBorn")
                    sqlSelect = $"SELECT * FROM {tableName} WHERE {field} = {value}";

                else if (field == "hobby")
                {
                    // תחביב → מיפוי לשדות hob1..hob5
                    int val = int.Parse(value);

                    switch (val)
                    {
                        case 1: field = "hob1"; break;
                        case 2: field = "hob2"; break;
                        case 3: field = "hob3"; break;
                        case 4: field = "hob4"; break;
                        case 5: field = "hob5"; break;
                    }
                    sqlSelect = $"SELECT * FROM {tableName} WHERE {field} = 'T'";
                }
                else if (field == "email")
                {
                    // מכיל
                    sqlSelect = $"SELECT * FROM {tableName} WHERE {field} LIKE '%{value}%'";
                }
                else
                {
                    // מתחיל ב
                    sqlSelect = $"SELECT * FROM {tableName} WHERE {field} LIKE N'{value}%'";
                }

                sql = sqlSelect;

                //--- הרצת השאילתה ---
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