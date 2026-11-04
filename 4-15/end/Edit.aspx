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
    </style>
</head>
<body>
    <h1>עדכון פרטים</h1>
    <form method="post" runat="server">
        <table>
            <tr>
                <td>שם משתמש:</td>
                <td><input type="text" name="uName" value="<%= uName %>"
                    disabled="disabled" /></td>
            </tr>
            <tr>
                <td>שם פרטי:</td>
                <td><input type="text" name="fName" value="<%= fName %>" /></td>
            </tr>
            <tr>
                <td>שם משפחה:</td>
                <td><input type="text" name="lName" value="<%= lName %>" /></td>
            </tr>
            <tr>
                <td>דואר:</td>
                <td><input type="text" name="eMail" value="<%= eMail %>" /></td>
            </tr>
            <tr>
                <td>מגדר:</td>
                <td>
                    <input type="radio" name="gender" value="זכר" <%= maleChecked %> />זכר
                    <input type="radio" name="gender" value="נקבה" <%= femaleChecked %> />נקבה
                </td>
            </tr>
            <tr>
                <td>עיר:</td>
                <td><select name="city"><%= cityOptions %></select></td>
            </tr>
            <tr>
                <td>סיסמה:</td>
                <td><input type="password" name="pass" value="<%= pass %>" /></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" name="submit" value="עדכון" /></td>
            </tr>
        </table>
    </form>

    <h2><%= msg %></h2>
    <h3 dir="ltr"><%= Helper.FixDirection(sqlSelect) %></h3>
    <h3 dir="ltr"><%= Helper.FixDirection(sqlUpdate) %></h3>
</body>
</html>
