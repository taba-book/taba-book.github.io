<%@ Page Title="התחברות" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        h1, h2, h3 {
            text-align: center;
        }

        .loginTable {
            margin: 0 auto;
            border-collapse: collapse;
        }

        .loginTable td {
            padding: 2px 3px;
        }

        .label {
            text-align: right;
        }

        .field {
            text-align: left;
        }

        .field input {
            width: 180px;
        }

        .btnCell {
            text-align: left;
        }

        .btnCell input {
            width: 100px;
            margin-top: 8px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form method="post" runat="server">

        <h1>כניסת משתמש</h1>

        <table class="loginTable">
            <tr>
                <td class="label">שם משתמש:</td>
                <td class="field">
                    <input type="text" name="uName" />
                </td>
            </tr>

            <tr>
                <td class="label">סיסמה:</td>
                <td class="field">
                    <input type="password" name="pw" />
                </td>
            </tr>

            <tr>
                <td colspan="2" class="btnCell">
                    <input type="submit" name="submit" value="התחברות" />
                </td>
            </tr>
        </table>
    </form>

    <br />
    <br />
    <br />
    <br />

    <h3><%= msg %></h3>
    <h2 dir="ltr"><%= Helper.FixDirection(sqlLogin) %></h2>

</asp:Content>
