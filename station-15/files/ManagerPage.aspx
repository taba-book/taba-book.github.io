<%@ Page Title="דף ניהול" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="ManagerPage.aspx.cs" Inherits="ManagerPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        /* ------ עיצוב התפריט של דף מנהל - לא הברכה אלא שבמרכז המסך ------ */
        .managerMenuBar {
            text-align: center;
        }

        .managerMenuBarBtn {
            color: #1F3A44;
            padding: 3px 6px;
            margin: 5px;
        }

    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%= msg %>
</asp:Content>
