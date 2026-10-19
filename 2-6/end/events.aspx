<%@ Page Language="C#" MasterPageFile="~/MasterPage.master"
    CodeFile="events.aspx.cs" Inherits="events" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        function showPic(width) {
            books.width = width;
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <img src="pics/books.png" id="books" width="200" alt="ספרים"
         onmouseover="showPic(400)"
         onmouseout="showPic(200)" />
</asp:Content>
