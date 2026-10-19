<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" CodeFile="Register.aspx.cs" Inherits="Register" %>

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

            let phone = document.getElementById("phone").value;
            if (phone.length != 7) {
                document.getElementById("mPhone").innerHTML = "מספר הטלפון חייב להכיל בדיוק 7 ספרות";
                document.getElementById("mPhone").style.visibility = "visible";
                return false;
            }
            else if (!isAllDigits(phone)) {
                document.getElementById("mPhone").innerHTML = "מספר הטלפון חייב להכיל ספרות בלבד";
                document.getElementById("mPhone").style.visibility = "visible";
                return false;
            }
            else
                document.getElementById("mPhone").style.visibility = "hidden";

            let hobbies = document.getElementsByName("hobby");
            let hobChecked = false;

            for (let i = 0; i < hobbies.length; i++) {
                if (hobbies[i].checked == true)
                    hobChecked = true;
            }

            if (hobChecked == false) {
                document.getElementById("mHobby").innerHTML = "יש לבחור לפחות תחביב אחד";
                document.getElementById("mHobby").style.visibility = "visible";
                return false;
            }

            return true;
        }

        function isAllDigits(str) {   // האם כל תווי המחרוזת הם ספרות
            let len = str.length;
            let ch;
            for (let i = 0; i < len; i++) {
                ch = str[i];
                if (ch < '0' || ch > '9')
                    return false;
            }
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
                <td>מגדר:</td>
                <td>
                    <input type="radio" name="gender" value="זכר" checked />זכר
                    <input type="radio" name="gender" value="נקבה" />נקבה
                </td>
            </tr>
            <tr>
                <td>טלפון:</td>
                <td>
                    <input type="text" name="phone" id="phone" size="7" maxlength="7" />
                    -
                    <select name="prefix" id="prefix">
                        <option value=""></option>
                        <option value="050">050</option>
                        <option value="052">052</option>
                        <option value="053">053</option>
                    </select>
                    <span id="mPhone" class="errMsg"></span>
                </td>
            </tr>
            <tr>
                <td>תחביבים:</td>
                <td>
                    <input type="checkbox" name="hobby" value="1" checked />מחשבים
                    <input type="checkbox" name="hobby" value="2" />מוזיקה
                    <input type="checkbox" name="hobby" value="3" />טלוויזיה
                    <input type="checkbox" name="hobby" value="4" />ספורט
                    <input type="checkbox" name="hobby" value="5" />רשתות חברתיות
                    <span id="mHobby" class="errMsg"></span>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="about">ספרו על עצמכם:</label><br />
                    <textarea id="about" rows="4" cols="34"
                              placeholder="עד 200 תווים"></textarea>
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
