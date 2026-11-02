<%@ Page Title="טבלת משתמשים" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="ShowTable.aspx.cs" Inherits="ShowTable" %>

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
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%= title %>
    <h2 dir="ltr"><%= Helper.FixDirection(sqlSelect) %></h2>

    <%= st %>

    <h3><%= msg %></h3>

</asp:Content>
