<%@ Page Language="C#" AutoEventWireup="true"
         CodeFile="SimpleSearch.aspx.cs" Inherits="SimpleSearch" %>

<!DOCTYPE html>

<html lang="he" dir="rtl">
<head runat="server">
    <meta charset="utf-8" />
    <title>חיפוש ספרים</title>
    <link href="https://fonts.googleapis.com/css2?family=Assistant:wght@400;700"
          rel="stylesheet" />
    <style>
        body { font-family: Assistant, Arial, sans-serif; }
        h1, h2 { text-align: center; }
        .queryBox { width: 300px; margin: 0 auto; text-align: center; }
        table.list { border-collapse: collapse; margin: 0 auto; }
        table.list th, table.list td { border: 1px solid gray; padding: 2px 8px; }
    </style>
    <script>
        function detectField() {
            const field = document.getElementById("field").value;
            const queryDiv = document.getElementById("query");

            if (field == "inStock") {
                queryDiv.innerHTML =
                    "<input type='radio' name='value' value='1' checked />כן" +
                    "<input type='radio' name='value' value='0' />לא";
            }
            else if (field == "yearPub") {
                const currYear = new Date().getFullYear();
                let yearStr = "<select name='value'>";

                for (let i = currYear - 12; i <= currYear; i++) {
                    yearStr += "<option value='" + i + "'>" + i + "</option>";
                }

                queryDiv.innerHTML = yearStr + "</select>";
            }
            else if (field == "genre") {
                let genres = ["מתח", "רומן", "מדע בדיוני", "עיון"];
                let genreStr = "<select name='value'>";

                for (let i = 0; i < genres.length; i++) {
                    genreStr += `<option value='${genres[i]}'>${genres[i]}</option>`;
                }

                queryDiv.innerHTML = genreStr + "</select>";
            }
            else if (field == "size") {
                let sizeStr = "<select name='value'>";
                sizeStr += "<option value='1'>קצר: פחות מ-250 עמודים</option>";
                sizeStr += "<option value='2'>בינוני: 250 עד 400 עמודים</option>";
                sizeStr += "<option value='3'>ארוך: יותר מ-400 עמודים</option>";

                queryDiv.innerHTML = sizeStr + "</select>";
            }
            else {
                queryDiv.innerHTML = "<input type='text' name='value' />";
            }
        }
    </script>
</head>
<body>
    <h1>חיפוש ספרים לפי תנאי אחד</h1>
    <form method="post" runat="server">
        <div class="queryBox">
            <select name="field" id="field" onchange="detectField();">
                <option value="title">שם הספר</option>
                <option value="author">מחבר</option>
                <option value="genre">סוג</option>
                <option value="yearPub">שנת הוצאה</option>
                <option value="inStock">במלאי</option>
                <option value="size">אורך</option>
            </select>

            <div id="query"></div>
            <br />
            <input type="submit" name="submit" value="חיפוש" />
        </div>
    </form>

    <script>
        detectField();
    </script>

    <h2 dir="ltr"><%= Helper.FixDirection(sql) %></h2>
    <h2><%= msg %></h2>

    <%= st %>
</body>
</html>
