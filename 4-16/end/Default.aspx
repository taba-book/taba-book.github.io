<%@ Page Language="C#" MasterPageFile="~/MasterPage.master"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        h1 { color: red; text-align: center; }
        h2 { color: navy; }
    </style>
    <script>
        function confirmDelete() {
            const userToDelete = "<%= Session["uName"] %>";
            const confirmation = confirm("בטוחים שרוצים למחוק את החשבון שלכם?");
            if (confirmation)
                document.location.href = "Delete.aspx?uName=" + userToDelete;
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%= st %>
</asp:Content>
