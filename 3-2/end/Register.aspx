<%@ Page Language="C#" MasterPageFile="~/MasterPage.master"
    CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        function checkForm() {
            return true;
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form method="post" runat="server" onsubmit="return checkForm();">
        <table>
            <tr>
                <td>שם משתמש:</td>
                <td>
                    <input type="text" name="uName" id="uName" size="40" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" name="submit" value="שליחה" />
                </td>
            </tr>
        </table>
    </form>
</asp:Content>
