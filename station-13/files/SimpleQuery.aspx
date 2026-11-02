<%@ Page Title="שאילתה פשוטה" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="SimpleQuery.aspx.cs" Inherits="SimpleQuery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        h1 {
            text-align: center;
        }

        h2 {
            text-align: center;
        }

        .queryBox {
            width: 300px;
            margin: 0 auto;
            text-align: center;
        }

        .queryField {
            display: block;
            margin: 10px auto;
        }

        .queryDiv {
            height: 31px;
        }

        .queryButton {
            padding: 4px 18px;
        }

        table.list { border-collapse: collapse; margin: 0 auto; }

        table.list th, table.list td { border: 1px solid gray; padding: 2px 8px; }
    </style>
    <script>
        function detectField() {
            const field = document.getElementById("field").value;
            const queryDiv = document.getElementById("query");

            if (field == "gender") {
                queryDiv.innerHTML =
                    "<input type='radio' name='value' value='זכר' checked />זכר" +
                    "<input type='radio' name='value' value='נקבה' />נקבה"
                ;
            }
            else if (field == "yearBorn") {
                let yearStr = "<select class='queryField' name='value'>";
                const middleYear = new Date().getFullYear() - 16;

                for (let i = middleYear - 3; i <= middleYear + 3; i++) {
                    yearStr += "<option value='" + i + "'>" + i + "</option>\n";
                }

                queryDiv.innerHTML = yearStr + "</select>";
            }
            else if (field == "prefix") {
                let prefixStr = "<select class='queryField' name='value'>";

                prefixStr += "<option value='050'>050</option>";
                prefixStr += "<option value='052'>052</option>";
                prefixStr += "<option value='053'>053</option>";
                prefixStr += "<option value='054'>054</option>";
                prefixStr += "<option value='055'>055</option>";
                prefixStr += "<option value='057'>057</option>";
                prefixStr += "<option value='058'>058</option>";
                prefixStr += "<option value='02'>02</option>";
                prefixStr += "<option value='03'>03</option>";
                prefixStr += "<option value='04'>04</option>";
                prefixStr += "<option value='08'>08</option>";
                prefixStr += "<option value='09'>09</option>";
                prefixStr += "<option value='077'>077</option>";

                prefixStr += "</select>";
                queryDiv.innerHTML = prefixStr;
            }
            else if (field == "city") {

                let cities = [
                    "מטולה", "נהרייה", "כרמיאל", "חיפה", "נתניה", "רמת-השרון", "רעננה",
                    "תל-אביב-יפו", "חולון", "ראשון-לציון", "יהוד", "יבנה",
                    "אשקלון", "שדרות", "באר שבע", "דימונה", "אילת"
                ];

                let cityStr = "<select class='queryField' name='value'>";

                for (let i = 0; i < cities.length; i++)
                    cityStr += `<option value='${cities[i]}'>${cities[i]}</option>`;

                cityStr += "</select>";
                queryDiv.innerHTML = cityStr;
            }

            else if (field == "hobby") {
                let hobbyStr = "<select class='queryField' name='value'>";

                hobbyStr += "<option value='1'>מחשבים</option>";
                hobbyStr += "<option value='2'>מוזיקה</option>";
                hobbyStr += "<option value='3'>טלוויזיה</option>";
                hobbyStr += "<option value='4'>ספורט</option>";
                hobbyStr += "<option value='5'>רשתות חברתיות</option>";

                hobbyStr += "</select>";
                queryDiv.innerHTML = hobbyStr;
            }
            else {
                queryDiv.innerHTML = "<input type='text' class='queryField' name='value' />";
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <h1>הצגת נתונים לפי תנאי אחד</h1>
        <form method="post" runat="server">
            <div class="queryBox">
                <select class="queryField" name="field" id="field" onchange="detectField();">
                    <option value="lName">שם משפחה</option>
                    <option value="fName">שם פרטי</option>
                    <option value="email">דוא"ל</option>
                    <option value="gender">מגדר</option>
                    <option value="yearBorn">שנת לידה</option>
                    <option value="prefix">קידומת טלפון</option>
                    <option value="phone">טלפון</option>
                    <option value="city">יישוב</option>
                    <option value="hobby">תחביבים</option>
                </select>

                <div id="query" class="queryDiv"></div>
                <br />
                <input type="submit" class="queryField queryButton" name="submit" value="חיפוש" />
            </div>
        </form>

        <script>
            detectField();  // יצירת שדה ערך ראשוני, כך שהטופס לעולם אינו נשלח בלי שדה חיפוש
        </script>

    <%= title %>
   
    <h2 dir="ltr"><%= Helper.FixDirection(sql) %></h2>
    <h2><%= msg %></h2>

    <%= st %>
</asp:Content>
