using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ComplexSearch : System.Web.UI.Page
{
    public string st = "";
    public string msg = "";
    public string sql = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Form["submit"] != null)
        {
            //--- חלק 2: מקבלים מהטופס ---
            string field1 = Request.Form["field1"];
            string value1 = Request.Form["value1"].Trim();
            string field2 = Request.Form["field2"];
            string value2 = Request.Form["value2"].Trim();
            string op = Request.Form["op"];

            //--- אם אחת מתיבות הטקסט ריקה ---
            if (value1 == "" || value2 == "")
                msg = "יש למלא את שני התנאים. לחיפוש לפי תנאי אחד: "
                    + "<a href='SimpleSearch.aspx'>חיפוש פשוט</a>";
            else
            {
                //--- התנאי הראשון ---
                string query1 = "";

                if (field1 == "genre")
                    query1 = $"{field1} = N'{value1}'";
                else if (field1 == "yearPub" || field1 == "inStock")
                    query1 = $"{field1} = {value1}";
                else if (field1 == "yearFrom")
                    query1 = $"yearPub >= {value1}";
                else if (field1 == "size")
                {
                    int val1 = int.Parse(value1);

                    switch (val1)
                    {
                        case 1: query1 = "pages < 250"; break;
                        case 2: query1 = "pages >= 250 AND pages <= 400"; break;
                        case 3: query1 = "pages > 400"; break;
                    }
                }
                else if (field1 == "title")
                    // מכיל
                    query1 = $"{field1} LIKE N'%{value1}%'";
                else
                    // מתחיל ב
                    query1 = $"{field1} LIKE N'{value1}%'";

                //--- התנאי השני ---
                string query2 = "";

                if (field2 == "genre")
                    query2 = $"{field2} = N'{value2}'";
                else if (field2 == "yearPub" || field2 == "inStock")
                    query2 = $"{field2} = {value2}";
                else if (field2 == "yearTo")
                    query2 = $"yearPub <= {value2}";
                else if (field2 == "size")
                {
                    int val2 = int.Parse(value2);

                    switch (val2)
                    {
                        case 1: query2 = "pages < 250"; break;
                        case 2: query2 = "pages >= 250 AND pages <= 400"; break;
                        case 3: query2 = "pages > 400"; break;
                    }
                }
                else if (field2 == "title")
                    // מכיל
                    query2 = $"{field2} LIKE N'%{value2}%'";
                else
                    // מתחיל ב
                    query2 = $"{field2} LIKE N'{value2}%'";

                //--- מחברים את שני התנאים ---
                if (op == "and")
                    sql = "SELECT * FROM booksTbl"
                        + $" WHERE {query1} AND {query2}";
                else
                    sql = "SELECT * FROM booksTbl"
                        + $" WHERE {query1} OR {query2}";
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
