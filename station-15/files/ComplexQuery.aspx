<%@ Page Title="שאילתה מורכבת" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="ComplexQuery.aspx.cs" Inherits="ComplexQuery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        h1 {
            text-align: center;
        }

        h2 {
            text-align: center;
        }

        tr {
            height: 25px;
        }

        input {
            height: 18px;
        }

        .submitBtn {
            height: auto;
            padding: 4px 18px;
        }

        .wide {
            width: 100%;
            height: 23px;
        }

        .queryDiv {
            height: 29px;
        }

        .queryTable {
            margin: 0 auto;
            border-collapse: collapse;
        }

        .fieldCell {
            width: 125px;
        }

        .valueCell {
            width: 172px;
        }

        .centerCell {
            text-align: center;
        }

        table.list { border-collapse: collapse; margin: 0 auto; }

        table.list th, table.list td { border: 1px solid gray; padding: 2px 8px; }
    </style>
    <script>
        function detectField1() {
            const field1 = document.getElementById("field1").value;
            const queryDiv1 = document.getElementById("query1");

            if (field1 == "gender") {
                queryDiv1.innerHTML =
                    "<input type='radio' name='value1' value='זכר' checked />זכר" +
                    "<input type='radio' name='value1' value='נקבה' />נקבה"
                ;
            }
            else if (field1 == "yearBorn" || field1 == "yearFrom") {
                let yearStr = "<select class='wide' name='value1'>";
                const middleYear = new Date().getFullYear() - 16;

                for (let i = middleYear - 3; i <= middleYear + 3; i++) {
                    yearStr += "<option value='" + i + "'>" + i + "</option>";
                }

                queryDiv1.innerHTML = yearStr + "</select>";
            }
            else if (field1 == "prefix") {
                let prefixStr = "<select class='wide' name='value1'>";

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
                queryDiv1.innerHTML = prefixStr;
            }
            else if (field1 == "city") {

                let cities = [
                    "מטולה", "נהרייה", "כרמיאל", "חיפה", "נתניה", "רמת-השרון", "רעננה",
                    "תל-אביב-יפו", "חולון", "ראשון-לציון", "יהוד", "יבנה",
                    "אשקלון", "שדרות", "באר שבע", "דימונה", "אילת"
                ];

                let cityStr = "<select class='wide' name='value1'>";

                for (let i = 0; i < cities.length; i++)
                    cityStr += `<option value='${cities[i]}'>${cities[i]}</option>`;

                cityStr += "</select>";
                queryDiv1.innerHTML = cityStr;
            }
            else if (field1 == "hobby") {
                let hobbyStr = "<select class='wide' name='value1'>";

                hobbyStr += "<option value='1'>מחשבים</option>";
                hobbyStr += "<option value='2'>מוזיקה</option>";
                hobbyStr += "<option value='3'>טלוויזיה</option>";
                hobbyStr += "<option value='4'>ספורט</option>";
                hobbyStr += "<option value='5'>רשתות חברתיות</option>";

                hobbyStr += "</select>";
                queryDiv1.innerHTML = hobbyStr;
            }
            else {
                queryDiv1.innerHTML = "<input type='text' class='wide' name='value1' />";
            }
        }

        function detectField2() {
            const field2 = document.getElementById("field2").value;
            const queryDiv2 = document.getElementById("query2");

            if (field2 == "gender") {
                queryDiv2.innerHTML =
                    "<input type='radio' name='value2' value='זכר' checked />זכר" +
                    "<input type='radio' name='value2' value='נקבה' />נקבה"
                    ;
            }
            else if (field2 == "yearBorn" || field2 == "yearTo") {
                let yearStr = "<select class='wide' name='value2'>";
                const middleYear = new Date().getFullYear() - 16;

                for (let i = middleYear - 3; i <= middleYear + 3; i++) {
                    yearStr += "<option value='" + i + "'>" + i + "</option>";
                }

                queryDiv2.innerHTML = yearStr + "</select>";
            }
            else if (field2 == "prefix") {
                let prefixStr = "<select class='wide' name='value2'>";

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
                queryDiv2.innerHTML = prefixStr;
            }
            else if (field2 == "city") {

                let cities = [
                    "מטולה", "נהרייה", "כרמיאל", "חיפה", "נתניה", "רמת-השרון", "רעננה",
                    "תל-אביב-יפו", "חולון", "ראשון-לציון", "יהוד", "יבנה",
                    "אשקלון", "שדרות", "באר שבע", "דימונה", "אילת"
                ];

                let cityStr = "<select class='wide' name='value2'>";

                for (let i = 0; i < cities.length; i++)
                    cityStr += `<option value='${cities[i]}'>${cities[i]}</option>`;

                cityStr += "</select>";
                queryDiv2.innerHTML = cityStr;
            }
            else if (field2 == "hobby") {
                let hobbyStr = "<select class='wide' name='value2'>";

                hobbyStr += "<option value='1'>מחשבים</option>";
                hobbyStr += "<option value='2'>מוזיקה</option>";
                hobbyStr += "<option value='3'>טלוויזיה</option>";
                hobbyStr += "<option value='4'>ספורט</option>";
                hobbyStr += "<option value='5'>רשתות חברתיות</option>";

                hobbyStr += "</select>";
                queryDiv2.innerHTML = hobbyStr;
            }
            else {
                queryDiv2.innerHTML = "<input type='text' class='wide' name='value2' />";
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="display: <%= disp %>;">
        <h1>הצגת משתמשים רשומים לפי שני תנאים</h1>
        <form method="post" runat="server">
            <table class="queryTable">
                <tr>
                    <td class="fieldCell">
                        <select class="wide" name="field1" id="field1" onchange="detectField1();">
                            <option value="lName">שם משפחה</option>
                            <option value="fName">שם פרטי</option>
                            <option value="email">דוא"ל</option>
                            <option value="gender">מגדר</option>
                            <option value="yearBorn">שנת לידה</option>
                            <option value="yearFrom">משנה</option>
                            <option value="prefix">קידומת טלפון</option>
                            <option value="phone">טלפון</option>
                            <option value="city">יישוב</option>
                            <option value="hobby">תחביבים</option>
                        </select>
                    </td>
                    <td class="valueCell">
                        <div id="query1" class="queryDiv" style="text-align: center;"></div>
                    </td>
                </tr>

                <tr>
                    <td colspan="2" dir="ltr" class="centerCell">
                        <input type="radio" name="op" value="and" checked />AND
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="op" value="or" />OR
                    </td>
                </tr>

                <tr>
                    <td class="fieldCell">
                        <select class="wide" name="field2" id="field2" onchange="detectField2();">
                            <option value="lName">שם משפחה</option>
                            <option value="fName">שם פרטי</option>
                            <option value="email">דוא"ל</option>
                            <option value="gender">מגדר</option>
                            <option value="yearBorn">שנת לידה</option>
                            <option value="yearTo">עד שנה</option>
                            <option value="prefix">קידומת טלפון</option>
                            <option value="phone">טלפון</option>
                            <option value="city">יישוב</option>
                            <option value="hobby">תחביבים</option>
                        </select>
                    </td>
                    <td class="valueCell">
                        <div id="query2" class="queryDiv" style="text-align: center;"></div>
                    </td>
                </tr>

                <tr>
                    <td colspan="2" class="centerCell">
                        <input type="submit" class="submitBtn" name="submit" value="חיפוש" />
                    </td>
                </tr>
            </table>
        </form>

        <script>
            detectField1();  // יצירת שדה ערך ראשוני לשני התנאים, כמו ב-SimpleQuery
            detectField2();
        </script>
    </div>

    <%= title %>
   
    <h2 dir="ltr"><%= Helper.FixDirection(sql) %></h2>
    <%= denyMsg %>
    <h2><%= msg %></h2>

    <%= st %>

</asp:Content>
