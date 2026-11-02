<%@ Page Title="דף ניהול" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="ManagerPage.aspx.cs" Inherits="ManagerPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        /* ------ עיצוב התפריט של דף מנהל - לא הברכה אלא שבמרכז המסך ------ */
        .managerMenuBar {
            text-align: center;
        }

        .managerMenuBarBtn {
            display: inline-block;
            background-color: #e1ebc8;
            font-weight: bold;
            color: #1F3A44;
            width: 108px;
            padding: 20px 10px;
            text-decoration: none;
            border-radius: 8px;
            margin: 5px;
        }

            .managerMenuBarBtn:hover {
                background-color: #c3d7b1;
            }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%= msg %>
</asp:Content>
