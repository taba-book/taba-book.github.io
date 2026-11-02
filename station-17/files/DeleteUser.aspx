<%@ Page Title="מחיקת משתמש" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="DeleteUser.aspx.cs" Inherits="DeleteUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        h1 {
            text-align: center;
        }

        h2 {
            text-align: center;
        }

        table.list { border-collapse: collapse; margin: 0 auto; }

        table.list th, table.list td { border: 1px solid gray; padding: 2px 8px; }

        table.list tr:hover { background-color: #f7ffe6; }
    </style>

    <script>
        //  פונקציית אישור מחיקה ע"י מנהל
        function confirmDeleteAdmin(userToDelete) {
            const confirmation = confirm("בטוחים שרוצים למחוק את המשתמש " + userToDelete + "?");
            if (confirmation)
                document.location.href = 'DeleteRecord.aspx?uName=' + userToDelete;
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%= title %>
    <%= doneMsg %>
    <h2 dir="ltr"><%= Helper.FixDirection(sqlSelect) %></h2>

    <%= st %>

    <%= denyMsg %>
    <h3><%= msg %></h3>

</asp:Content>
