<%@ Page Language="C#" MasterPageFile="~/MasterPage.master"
    CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .errMsg {
            background-color: #FFFFFF;
            color: #A00000;
            font-weight: bold;
            border: 1px solid #767676;
            border-radius: 3px;
            padding: 2px 8px;
            font-size: 14px;
            visibility: hidden;
            display: inline-block;
            width: 310px;
        }
    </style>
    <script>
        function checkForm() {
            let fName = document.getElementById("fName").value;
            if (fName.length < 2) {
                document.getElementById("mFName").innerHTML = "השם הפרטי חייב להכיל 2 תווים לפחות";
                document.getElementById("mFName").style.visibility = "visible";
                return false;
            }
            else
                document.getElementById("mFName").style.visibility = "hidden";

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
                <td>שם פרטי:</td>
                <td>
                    <input type="text" name="fName" id="fName" />
                    <span id="mFName" class="errMsg"></span>
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
