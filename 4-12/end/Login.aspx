<%@ Page Language="C#" AutoEventWireup="true"
         CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html lang="he" dir="rtl">
<head runat="server">
    <meta charset="utf-8" />
    <title>כניסה למועדון</title>
    <link href="https://fonts.googleapis.com/css2?family=Assistant:wght@400;700"
          rel="stylesheet" />
    <style>
        body { font-family: Assistant, Arial, sans-serif; }
        table.list { border-collapse: collapse; margin: 0 auto; }
        table.list th, table.list td { border: 1px solid gray; padding: 2px 8px; }
    </style>
</head>
<body>
    <form name="frm1" method="post" runat="server">
        שם משתמש:
        <input type="text" name="uName" />
        <br />
        סיסמה:
        <input type="password" name="pass" />
        <br />
        <input type="submit" name="submit" value="כניסה" />
    </form>

    <%= st %>
</body>
</html>
