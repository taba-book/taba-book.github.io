using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SimpleSearch : System.Web.UI.Page
{
    public string st = "";
    public string msg = "";
    public string sql = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Form["submit"] != null)
        {
            //--- חלק 2: מקבלים מהטופס ובונים את השאילתה ---
            string field = Request.Form["field"];
            string value = Request.Form["value"].Trim();

            if (value == "")
                msg = "הקלידו מה לחפש";
            else
            {
                if (field == "genre")
                    sql = "SELECT * FROM booksTbl"
                        + $" WHERE {field} = N'{value}'";
                else if (field == "yearPub" || field == "inStock")
                    sql = "SELECT * FROM booksTbl"
                        + $" WHERE {field} = {value}";
                else if (field == "size")
                {
                    int val = int.Parse(value);
                    string condition = "";

                    switch (val)
                    {
                        case 1: condition = "pages < 250"; break;
                        case 2: condition = "pages >= 250 AND pages <= 400"; break;
                        case 3: condition = "pages > 400"; break;
                    }
                    sql = "SELECT * FROM booksTbl"
                        + $" WHERE {condition}";
                }
                else if (field == "title")
                    // מכיל
                    sql = "SELECT * FROM booksTbl"
                        + $" WHERE {field} LIKE N'%{value}%'";
                else
                    // מתחיל ב
                    sql = "SELECT * FROM booksTbl"
                        + $" WHERE {field} LIKE N'{value}%'";

                //--- חלק 3: מריצים ומציגים ---
                DataTable table = Helper.ExecuteDataTable("practiceDB.mdf", sql);
                int length = table.Rows.Count;

                if (length == 0)
                    msg = "לא נמצאו ספרים מתאימים";
                else
                {
                    msg = $"נמצאו {length} ספרים";

                    st = "<table class='list'>";
                    st += "<tr><th>קוד</th><th>שם הספר</th><th>מחבר</th>";
                    st += "<th>סוג</th><th>שנה</th><th>עמודים</th>";
                    st += "<th>במלאי</th></tr>";

                    for (int i = 0; i < length; i++)
                    {
                        st += "<tr>";
                        st += $"<td>{table.Rows[i]["bCode"]}</td>";
                        st += $"<td>{table.Rows[i]["title"]}</td>";
                        st += $"<td>{table.Rows[i]["author"]}</td>";
                        st += $"<td>{table.Rows[i]["genre"]}</td>";
                        st += $"<td>{table.Rows[i]["yearPub"]}</td>";
                        st += $"<td>{table.Rows[i]["pages"]}</td>";
                        st += $"<td>{table.Rows[i]["inStock"]}</td>";
                        st += "</tr>";
                    }

                    st += "</table>";
                }
            }
        }
    }
}
