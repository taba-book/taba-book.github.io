<%@ Page Language="C#" AutoEventWireup="true"
         CodeFile="ComplexSearch.aspx.cs" Inherits="ComplexSearch" %>

<!DOCTYPE html>

<html lang="he" dir="rtl">
<head runat="server">
    <meta charset="utf-8" />
    <title>חיפוש ספרים בשני תנאים</title>
    <link href="https://fonts.googleapis.com/css2?family=Assistant:wght@400;700"
          rel="stylesheet" />
    <style>
        body { font-family: Assistant, Arial, sans-serif; }
        h1, h2 { text-align: center; }
        .queryBox { margin: 0 auto; }
        .queryBox td { padding: 4px; }
        table.list { border-collapse: collapse; margin: 0 auto; }
        table.list th, table.list td { border: 1px solid gray; padding: 2px 8px; }
    </style>
    <script>
    function detectField1() {
        const field = document.getElementById("field1").value;
        const queryDiv = document.getElementById("query1");

        if (field == "inStock") {
            queryDiv.innerHTML =
                "<input type='radio' name='value1' value='1' checked />כן" +
                "<input type='radio' name='value1' value='0' />לא";
        }
        else if (field == "yearPub" || field == "yearFrom") {
            const currYear = new Date().getFullYear();
            let yearStr = "<select name='value1'>";

            for (let i = currYear - 12; i <= currYear; i++) {
                yearStr += "<option value='" + i + "'>" + i + "</option>";
            }

            queryDiv.innerHTML = yearStr + "</select>";
        }
        else if (field == "genre") {
            let genres = ["מתח", "רומן", "מדע בדיוני", "עיון"];
            let genreStr = "<select name='value1'>";

            for (let i = 0; i < genres.length; i++) {
                genreStr += `<option value='${genres[i]}'>${genres[i]}</option>`;
            }

            queryDiv.innerHTML = genreStr + "</select>";
        }
        else if (field == "size") {
            let sizeStr = "<select name='value1'>";
            sizeStr += "<option value='1'>קצר: פחות מ-250 עמודים</option>";
            sizeStr += "<option value='2'>בינוני: 250 עד 400 עמודים</option>";
            sizeStr += "<option value='3'>ארוך: יותר מ-400 עמודים</option>";

            queryDiv.innerHTML = sizeStr + "</select>";
        }
        else {
            queryDiv.innerHTML = "<input type='text' name='value1' />";
        }
    }

    function detectField2() {
        const field = document.getElementById("field2").value;
        const queryDiv = document.getElementById("query2");

        if (field == "inStock") {
            queryDiv.innerHTML =
                "<input type='radio' name='value2' value='1' checked />כן" +
                "<input type='radio' name='value2' value='0' />לא";
        }
        else if (field == "yearPub" || field == "yearTo") {
            const currYear = new Date().getFullYear();
            let yearStr = "<select name='value2'>";

            for (let i = currYear - 12; i <= currYear; i++) {
                yearStr += "<option value='" + i + "'>" + i + "</option>";
            }

            queryDiv.innerHTML = yearStr + "</select>";
        }
        else if (field == "genre") {
            let genres = ["מתח", "רומן", "מדע בדיוני", "עיון"];
            let genreStr = "<select name='value2'>";

            for (let i = 0; i < genres.length; i++) {
                genreStr += `<option value='${genres[i]}'>${genres[i]}</option>`;
            }

            queryDiv.innerHTML = genreStr + "</select>";
        }
        else if (field == "size") {
            let sizeStr = "<select name='value2'>";
            sizeStr += "<option value='1'>קצר: פחות מ-250 עמודים</option>";
            sizeStr += "<option value='2'>בינוני: 250 עד 400 עמודים</option>";
            sizeStr += "<option value='3'>ארוך: יותר מ-400 עמודים</option>";

            queryDiv.innerHTML = sizeStr + "</select>";
        }
        else {
            queryDiv.innerHTML = "<input type='text' name='value2' />";
        }
    }
</script>
</head>
<body>
    <h1>חיפוש ספרים לפי שני תנאים</h1>
    <form method="post" runat="server">
        <table class="queryBox">
            <tr>
                <td>
                    <select name="field1" id="field1" onchange="detectField1();">
                        <option value="title">שם הספר</option>
                        <option value="author">מחבר</option>
                        <option value="genre">סוג</option>
                        <option value="yearPub">שנת הוצאה</option>
                        <option value="yearFrom">משנה</option>
                        <option value="inStock">במלאי</option>
                        <option value="size">אורך</option>
                    </select>
                </td>
                <td><div id="query1"></div></td>
            </tr>
            <tr>
                <td colspan="2" dir="ltr">
                    <input type="radio" name="op" value="and" checked />AND
                    <input type="radio" name="op" value="or" />OR
                </td>
            </tr>
            <tr>
                <td>
                    <select name="field2" id="field2" onchange="detectField2();">
                        <option value="title">שם הספר</option>
                        <option value="author">מחבר</option>
                        <option value="genre">סוג</option>
                        <option value="yearPub">שנת הוצאה</option>
                        <option value="yearTo">עד שנה</option>
                        <option value="inStock">במלאי</option>
                        <option value="size">אורך</option>
                    </select>
                </td>
                <td><div id="query2"></div></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" name="submit" value="חיפוש" />
                </td>
            </tr>
        </table>
    </form>

    <script>
        detectField1();
        detectField2();
    </script>

    <h2 dir="ltr"><%= Helper.FixDirection(sql) %></h2>
    <h2><%= msg %></h2>

    <%= st %>
</body>
</html>
