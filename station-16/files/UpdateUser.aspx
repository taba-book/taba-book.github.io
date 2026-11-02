<%@ Page Title="עדכון פרטים" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="UpdateUser.aspx.cs" Inherits="UpdateUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        h1, h3 {
            text-align: center;
        }

        .registerTable {
            width: 700px;
            margin: 0 auto;
            border-collapse: collapse;
        }

        .label {
            font-weight: 500;
        }

        .hobbyTable {
            width: 400px;
            margin: 0 0 0 auto;
            border-collapse: collapse;
        }

        .field, .errMsg {
            font-size: 14px;
            border: 1px solid #767676;
            padding: 2px 8px;
        }

        .errMsg {
            background-color: #FFFFFF;
            color: #A00000;
            font-weight: bold;
            visibility: hidden;
            display: inline-block;
            width: 310px;
        }

    </style>

    <script>
        function containsBadChars(email) {
            const badChars = "$%^&*()-![]{}<>?/ ";
            const len = badChars.length;
            let i = 0, pos, ch;
            while (i < len) {
                ch = badChars[i];
                pos = email.indexOf(ch);
                if (pos != -1)
                    return true;
                i++;
            }
            return false;
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

            //-----@ בדיקות -----
            else if (atSign == -1)
                msg = 'סימן ה-@ לא קיים בכתובת';
            else if (atSign != email.lastIndexOf('@'))
                msg = 'סימן ה-@ מופיע בכתובת יותר מפעם אחת';
            else if (atSign == 0 || atSign == size - 1)
                msg = 'ה-@ לא יכול להיות בהתחלה או בסוף הכתובת';

            //----- @ בדיקות נקודה אחרי -----
            else if (dotSign == -1)
                msg = 'חייבת להיות נקודה אחרי סימן ה-@';
            else if (dotSign == atSign + 1)
                msg = 'הנקודה לא יכולה להופיע מיד אחרי סימן ה-@';
            else if (dotSign == size - 1)
                msg = 'הנקודה לא יכולה להיות התו האחרון של הכתובת';

            //----- בדיקת הסימן גרש או גרשיים -----
            else if (email.indexOf('"') != -1 || email.indexOf("'") != -1)
                msg = 'כתובת דוא"ל לא יכולה להכיל גרש או גרשיים';

            //----- בדיקת הסימן לוכסן -----
            else if (email.indexOf("\\") != -1)
                msg = 'כתובת דוא"ל לא יכולה להכיל לוכסן';

            //----- האם הכתובת מכילה אות בעברית -----
            else if (isHebrew(email))
                msg = 'כתובת דוא"ל לא יכולה להכיל עברית';

            //----- האם הכתובת מכילה תווים אסורים -----
            else if (containsBadChars(email))
                msg = 'אסור רווח או אחד התווים $%^&*()-![]{}<>?/';

            return msg;
        }

        function containsDigit(str) {   //---- האם המחרוזת מכילה ספרה ----
            let len = str.length;
            let ch;
            for (let i = 0; i < len; i++) {
                ch = str[i];
                if (ch >= '0' && ch <= '9')
                    return true;
            }
            return false;
        }

        function isAllDigits(str) {   //---- האם כל תווי המחרוזת הם ספרות ----
            let len = str.length;
            let ch;
            for (let i = 0; i < len; i++) {
                ch = str[i];
                if (ch < '0' || ch > '9')
                    return false;
            }
            return true;
        }

        function checkForm() {  //---- בדיקת תקינות השדות, לפי סדר הופעתם בטופס ----

            //----- 2. שם פרטי: 2 תווים לפחות -----
            let fName = document.getElementById("fName").value;
            if (fName.length < 2) {
                document.getElementById("mFName").innerHTML = "השם הפרטי חייב להכיל 2 תווים לפחות";
                document.getElementById("mFName").style.visibility = "visible";
                return false;
            }
            //----- 3. שם פרטי: ללא ספרות -----
            else if (containsDigit(fName)) {
                document.getElementById("mFName").innerHTML = "שם פרטי אינו יכול להכיל ספרות";
                document.getElementById("mFName").style.visibility = "visible";
                return false;
            }
            else
                document.getElementById("mFName").style.visibility = "hidden";

            //----- 4. שם משפחה: 2 תווים לפחות -----
            let lName = document.getElementById("lName").value;
            if (lName.length < 2) {
                document.getElementById("mLName").innerHTML = "שם המשפחה חייב להכיל 2 תווים לפחות";
                document.getElementById("mLName").style.visibility = "visible";
                return false;
            }
            //----- 5. שם משפחה: ללא ספרות -----
            else if (containsDigit(lName)) {
                document.getElementById("mLName").innerHTML = "שם משפחה אינו יכול להכיל ספרות";
                document.getElementById("mLName").style.visibility = "visible";
                return false;
            }
            else
                document.getElementById("mLName").style.visibility = "hidden";

            //----- 6. דוא"ל: לפי כללי checkEmail -----
            let email = document.getElementById("email").value;
            let msg = checkEmail(email);
            if (msg != "") {
                document.getElementById("mEmail").innerHTML = msg;
                document.getElementById("mEmail").style.visibility = "visible";
                return false;
            }
            else
                document.getElementById("mEmail").style.visibility = "hidden";

            //----- 7. טלפון: בדיוק 7 תווים -----
            let phone = document.getElementById("phone").value;
            if (phone.length != 7) {
                document.getElementById("mPhone").innerHTML = "מספר הטלפון חייב להכיל בדיוק 7 ספרות";
                document.getElementById("mPhone").style.visibility = "visible";
                return false;
            }
            //----- 8. טלפון: ספרות בלבד -----
            else if (!isAllDigits(phone)) {
                document.getElementById("mPhone").innerHTML = "מספר הטלפון חייב להכיל ספרות בלבד";
                document.getElementById("mPhone").style.visibility = "visible";
                return false;
            }
            else
                document.getElementById("mPhone").style.visibility = "hidden";

            //----- 9. סיסמה: אינה ריקה -----
            let password = document.getElementById("pw").value;
            let passwordV = document.getElementById("pwVerify").value;
            if (password.length == 0) {
                document.getElementById("mPw").innerHTML = "יש להזין סיסמה";
                document.getElementById("mPw").style.visibility = "visible";
                return false;
            }
            //----- 10. סיסמה: בין 6 ל-10 תווים -----
            if (password.length < 6 || password.length > 10) {
                document.getElementById("mPw").innerHTML = "הסיסמה חייבת להכיל בין 6 ל-10 תווים";
                document.getElementById("mPw").style.visibility = "visible";
                return false;
            }
            else
                document.getElementById("mPw").style.visibility = "hidden";

            //----- 11. אימות סיסמה: הוקלד -----
            if (passwordV.length == 0) {
                document.getElementById("mPwVerify").innerHTML = "יש להזין את הסיסמה בשנית";
                document.getElementById("mPwVerify").style.visibility = "visible";
                return false;
            }
            //----- 12. אימות סיסמה: זהה לסיסמה -----
            if (password != passwordV) {
                document.getElementById("mPwVerify").innerHTML = "הסיסמאות אינן תואמות";
                document.getElementById("mPwVerify").style.visibility = "visible";
                return false;
            }
            else
                document.getElementById("mPwVerify").style.visibility = "hidden";

            return true;
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>טופס עדכון פרטים</h1>
    <form method="post" runat="server" onsubmit="return checkForm();">
        <table class="registerTable">
            <tr>
                <td class="label">שם משתמש:</td>
                <td>
                    <input class="field" type="text" name="uName" disabled="disabled" value="<%= uName %>" />
                </td>
            </tr>
            <tr>
                <td class="label">שם פרטי:</td>
                <td>
                    <input class="field" type="text" id="fName" name="fName" value="<%= fName %>" />
                    <span id="mFName" class="errMsg"></span>
                </td>
            </tr>
            <tr>
                <td class="label">שם משפחה:</td>
                <td>
                    <input class="field" type="text" id="lName" name="lName" value="<%= lName %>" />
                    <span id="mLName" class="errMsg"></span>
                </td>
            </tr>
            <tr>
                <td class="label">כתובת דוא"ל:</td>
                <td>
                    <input class="field" type="text" id="email" name="email" value="<%= email %>" />
                    <span id="mEmail" class="errMsg"></span>
                </td>
            </tr>
            <tr>
                <td class="label">מגדר:</td>
                <td>
                    <input type="radio" name="gender" value="זכר" <%= maleChecked %> />
                    זכר
                    <input type="radio" name="gender" value="נקבה" <%= femaleChecked %> />
                    נקבה
                </td>
            </tr>
            <tr>
                <td class="label">שנת לידה:</td>
                <td>
                    <select name="yearBorn">
                        <%= yearOptions %>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="label">טלפון:</td>
                <td style="text-align: right;">
                    <input class="field" type="text" size="7" maxlength="7" name="phone" id="phone" style="text-align: left;" value="<%= phone %>" />
                    -
                    <select name="prefix"><%= prefixOptions %></select>
                    <span id="mPhone" class="errMsg"></span>
                </td>
            </tr>
            <tr>
                <td class="label">יישוב:</td>
                <td>
                    <select name="city"><%= cityOptions %></select>
                </td>
            </tr>
            <tr>
                <td class="label">תחביבים:</td>
                <td>
                    <table class="hobbyTable">
                        <tr>
                            <td>
                                <input type="checkbox" name="hobby" value="1" <%= hob1Checked %> />מחשבים
                            </td>
                            <td>
                                <input type="checkbox" name="hobby" value="2" <%= hob2Checked %> />מוזיקה
                            </td>
                            <td>
                                <input type="checkbox" name="hobby" value="3" <%= hob3Checked %> />טלוויזיה
                            </td>
                            <td>
                                <input type="checkbox" name="hobby" value="4" <%= hob4Checked %> />ספורט
                            </td>
                            <td>
                                <input type="checkbox" name="hobby" value="5" <%= hob5Checked %> />רשתות חברתיות
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="label">סיסמה:</td>
                <td>
                    <input class="field" type="password" id="pw" name="pw" size="10" value="<%= pw %>" placeholder="6 עד 10 תווים" />
                    <span id="mPw" class="errMsg"></span>
                </td>
            </tr>
            <tr>
                <td class="label">אימות סיסמה:</td>
                <td>
                    <input class="field" type="password" id="pwVerify" size="10" value="<%= pw %>" placeholder="שוב אותה סיסמה" />
                    <span id="mPwVerify" class="errMsg"></span>
                </td>
            </tr>

            <tr>
                <td></td>
                <td style="padding-top: 15px; text-align: center;">
                    <input type="submit" name="submit" value="עדכון" />
                </td>
            </tr>
        </table>
    </form>

    <h3 dir="ltr"><%= Helper.FixDirection(sqlSelect) %></h3>
    <h3 dir="ltr"><%= Helper.FixDirection(sqlUpdate) %></h3>
    <h3><%= msg %></h3>

</asp:Content>

