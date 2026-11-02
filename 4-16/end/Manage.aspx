<%@ Page Language="C#" AutoEventWireup="true"
         CodeFile="Manage.aspx.cs" Inherits="Manage" %>

<!DOCTYPE html>

<html lang="he" dir="rtl">
<head runat="server">
    <meta charset="utf-8" />
    <title>ניהול החברים</title>
    <link href="https://fonts.googleapis.com/css2?family=Assistant:wght@400;700"
          rel="stylesheet" />
    <style>
        body { font-family: Assistant, Arial, sans-serif; }
        table.list { border-collapse: collapse; margin: 0 auto; }
        table.list th, table.list td { border: 1px solid gray; padding: 2px 8px; }
    </style>
    <script>
        function confirmDeleteAdmin(userToDelete) {
            const confirmation = confirm("בטוחים שרוצים למחוק את החבר " + userToDelete + "?");
            if (confirmation)
                document.location.href = "Delete.aspx?uName=" + userToDelete;
        }
    </script>
</head>
<body>
    <%= st %>
</body>
</html>
