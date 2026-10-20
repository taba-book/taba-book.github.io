<%@ Page Language="C#" MasterPageFile="~/MasterPage.master"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        h1 { color: red; text-align: center; }
        h2 { color: navy; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>הספרייה שלי</h1>

    <h2>ספרי מתח</h2>
    <p>סיפור עם תעלומה שנפתרת בסוף.</p>

    <h2>ספרי מדע</h2>
    <p>ספרים שמסבירים איך פועל העולם.</p>

    <img src="pics/books.png" alt="ספרים"
         title="מדף הספרים" height="150" />
</asp:Content>
