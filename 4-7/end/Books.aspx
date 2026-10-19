<%@ Page Language="C#" AutoEventWireup="true"
         CodeFile="Books.aspx.cs" Inherits="Books" %>

<!DOCTYPE html>

<html lang="he" dir="rtl">
<head runat="server">
    <meta charset="utf-8" />
    <title>הספרייה</title>
    <link href="https://fonts.googleapis.com/css2?family=Assistant:wght@400;700"
          rel="stylesheet" />
    <style>
        body { font-family: Assistant, Arial, sans-serif; }
        table.list { border-collapse: collapse; margin: 0 auto; }
        table.list th, table.list td { border: 1px solid gray; padding: 2px 8px; }
    </style>
</head>
<body>
    <form method="post" runat="server">
        בחרו סוגה:
        <select name="genre">
            <option value="">כל הסוגות</option>
            <option value="מתח">מתח</option>
            <option value="רומן">רומן</option>
            <option value="מדע בדיוני">מדע בדיוני</option>
            <option value="עיון">עיון</option>
        </select>
        <input type="submit" name="submit" value="הצג" />
    </form>

    <%= st %>
</body>
</html>
