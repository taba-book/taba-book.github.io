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
        .resultBox {
            margin-top: 20px;
        }
        .resultBox table {
            margin: 0 auto;
            border: 1px solid #999;
        }
        .resultBox th, .resultBox td {
            border: 1px solid #999;
            padding: 2px 10px;
        }
        form td { vertical-align: top; }
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

            let email = document.getElementById("email").value;
            let msg = checkEmail(email);
            if (msg != "") {
                document.getElementById("mEmail").innerHTML = msg;
                document.getElementById("mEmail").style.visibility = "visible";
                return false;
            }
            else
                document.getElementById("mEmail").style.visibility = "hidden";

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

            let password = document.getElementById("pw").value;
            let passwordV = document.getElementById("pwVerify").value;
            if (password.length == 0) {
                document.getElementById("mPw").innerHTML = "יש להזין סיסמה";
                document.getElementById("mPw").style.visibility = "visible";
                return false;
            }
            if (password.length < 6 || password.length > 10) {
                document.getElementById("mPw").innerHTML = "הסיסמה חייבת להכיל בין 6 ל-10 תווים";
                document.getElementById("mPw").style.visibility = "visible";
                return false;
            }
            else
                document.getElementById("mPw").style.visibility = "hidden";

            if (passwordV.length == 0) {
                document.getElementById("mPwVerify").innerHTML = "יש להזין את הסיסמה בשנית";
                document.getElementById("mPwVerify").style.visibility = "visible";
                return false;
            }
            if (password != passwordV) {
                document.getElementById("mPwVerify").innerHTML = "הסיסמאות אינן תואמות";
                document.getElementById("mPwVerify").style.visibility = "visible";
                return false;
            }
            else
                document.getElementById("mPwVerify").style.visibility = "hidden";

            return true;
        }

        function checkEmail(email) {    //---- בדיקת תקינות דוא"ל ----
            let size = email.length;
            let atSign = email.indexOf('@');
            let dotSign = email.indexOf('.', atSign + 1);
            let msg = "";

            //----- בדיקות בסיסיות -----
            if (size < 7)
                msg = 'כתובת דוא"ל קצרה מדי או לא קיימת';
            else if (size > 30)
                msg = 'כתובת דוא"ל יכולה להכיל עד 30 תווים';

            //----- נקודה בתחילת הכתובת -----
            else if (email[0] == '.')
                msg = 'הנקודה לא יכולה להיות התו הראשון בכתובת';

            //----- בדיקות סימן ה-@ -----
            else if (atSign == -1)
                msg = 'סימן ה-@ לא קיים בכתובת';
            else if (atSign != email.lastIndexOf('@'))
                msg = 'סימן ה-@ מופיע בכתובת יותר מפעם אחת';
            else if (atSign == 0 || atSign == size - 1)
                msg = 'סימן ה-@ לא יכול להופיע במקום הראשון או האחרון של הכתובת';

            //----- בדיקות הנקודה שאחרי ה-@ -----
            else if (dotSign == -1)
                msg = 'חייבת להיות נקודה אחרי סימן ה-@';
            else if (dotSign == atSign + 1)
                msg = 'הנקודה לא יכולה להופיע מיד אחרי סימן ה-@';
            else if (dotSign == size - 1)
                msg = 'הנקודה לא יכולה להיות התו האחרון של הכתובת';

            //----- גרש או גרשיים -----
            else if (email.indexOf('"') != -1 || email.indexOf("'") != -1)
                msg = 'כתובת דוא"ל לא יכולה להכיל גרש או גרשיים';

            //----- לוכסן -----
            else if (email.indexOf("\\") != -1)
                msg = 'כתובת דוא"ל לא יכולה להכיל לוכסן';

            //----- אות בעברית -----
            else if (isHebrew(email))
                msg = 'כתובת דוא"ל לא יכולה להכיל עברית';

            //----- תווים אסורים -----
            else if (containsBadChars(email))
                msg = 'לא ניתן להשתמש בתו רווח או בתווים  $%^&*()-![]{}<>?/ ';

            return msg;
        }

        function isHebrew(email) {
            let len = email.length;
            let ch;
            for (let i = 0; i < len; i++) {
                ch = email[i];
                if (ch >= 'א' && ch <= 'ת')
                    return true;
            }
            return false;
        }

        function containsBadChars(email) {
            let badChars = "$%^&*()-![]{}<>?/ ";
            let len = badChars.length;
            let ch;
            for (let i = 0; i < len; i++) {
                ch = badChars[i];
                if (email.indexOf(ch) != -1)
                    return true;
            }
            return false;
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
                <td>דואר אלקטרוני:</td>
                <td>
                    <input type="text" name="email" id="email" />
                    <span id="mEmail" class="errMsg"></span>
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
                    <br />
                    <span id="mHobby" class="errMsg"></span>
                </td>
            </tr>
            <tr>
                <td>סיסמה:</td>
                <td>
                    <input type="password" name="pw" id="pw" size="10" placeholder="6 עד 10 תווים" />
                    <span id="mPw" class="errMsg"></span>
                </td>
            </tr>
            <tr>
                <td>אימות סיסמה:</td>
                <td>
                    <input type="password" id="pwVerify" size="10" placeholder="שוב אותה סיסמה" />
                    <span id="mPwVerify" class="errMsg"></span>
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
    <div class="resultBox"><%= st %></div>
</asp:Content>
