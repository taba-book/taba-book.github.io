<%@ Page Language="C#" AutoEventWireup="true"
         CodeFile="Edit.aspx.cs" Inherits="Edit" %>

<!DOCTYPE html>

<html lang="he" dir="rtl">
<head runat="server">
    <meta charset="utf-8" />
    <title>עדכון פרטים</title>
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
        עיר:
        <input type="text" name="city" />
        <br />
        דואר:
        <input type="text" name="eMail" />
        <br />
        <input type="submit" name="submit" value="עדכון" />
    </form>

    <%= st %>
</body>
</html>
