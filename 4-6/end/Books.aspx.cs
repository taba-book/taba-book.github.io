using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Books : System.Web.UI.Page
{
    public string st = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        string sql = "SELECT bCode, title, author, genre FROM booksTbl";
        DataTable table = Helper.ExecuteDataTable("practiceDB.mdf", sql);

        st = "<h1>הספרים בספרייה</h1>";
        st += "<table class='list'>";
        st += "<tr><th>קוד</th><th>שם הספר</th>";
        st += "<th>מחבר</th><th>סוגה</th></tr>";

        for (int i = 0; i < table.Rows.Count; i++)
        {
            string bCode = table.Rows[i]["bCode"].ToString();
            string title = table.Rows[i]["title"].ToString();
            string author = table.Rows[i]["author"].ToString();
            string genre = table.Rows[i]["genre"].ToString();

            st += $"<tr><td>{bCode}</td><td>{title}</td>";
            st += $"<td>{author}</td><td>{genre}</td></tr>";
        }

        st += "</table>";
    }
}
