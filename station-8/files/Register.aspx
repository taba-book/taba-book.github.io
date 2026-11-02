<%@ Page Title="הרשמה" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        h1 {
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

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>טופס רישום</h1>
    <form method="post" runat="server">
        <table class="registerTable">
            <tr>
                <td class="label">שם משתמש:</td>
                <td>
                    <input class="field" type="text" id="uName" name="uName" />
                </td>
            </tr>
            <tr>
                <td class="label">שם פרטי:</td>
                <td>
                    <input class="field" type="text" id="fName" name="fName" />
                </td>
            </tr>
            <tr>
                <td class="label">שם משפחה:</td>
                <td>
                    <input class="field" type="text" id="lName" name="lName" />
                </td>
            </tr>
            <tr>
                <td class="label">כתובת דוא"ל:</td>
                <td>
                    <input class="field" type="text" id="email" name="email" />
                </td>
            </tr>
            <tr>
                <td class="label">מגדר:</td>
                <td>
                    <input type="radio" name="gender" value="זכר" checked />
                    זכר
                    <input type="radio" name="gender" value="נקבה" />
                    נקבה
                </td>
            </tr>
            <tr>
                <td class="label">שנת לידה:</td>
                <td>
                    <select name="yearBorn">
                        <option value='2007'>2007</option>
                        <option value='2008'>2008</option>
                        <option value='2009'>2009</option>
                        <option value='2010' selected>2010</option>
                        <option value='2011'>2011</option>
                        <option value='2012'>2012</option>
                        <option value='2013'>2013</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="label">טלפון:</td>
                <td style="text-align: right;">
                    <input class="field" type="text" size="7" maxlength="7" name="phone" id="phone" style="text-align: left;" />
                    -
                    <select name="prefix">
                        <option value="050">050</option>
                        <option value="052">052</option>
                        <option value="053">053</option>
                        <option value="054">054</option>
                        <option value="055">055</option>
                        <option value="057">057</option>
                        <option value="058">058</option>
                        <option value="02">02</option>
                        <option value="03">03</option>
                        <option value="04">04</option>
                        <option value="08">08</option>
                        <option value="09">09</option>
                        <option value="077">077</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="label">יישוב:</td>
                <td>
                    <select name="city">
                        <option value="מטולה">מטולה</option>
                        <option value="נהרייה">נהרייה</option>
                        <option value="כרמיאל">כרמיאל</option>
                        <option value="חיפה">חיפה</option>
                        <option value="נתניה">נתניה</option>
                        <option value="רמת-השרון">רמת-השרון</option>
                        <option value="רעננה">רעננה</option>
                        <option value="תל-אביב-יפו">תל-אביב-יפו</option>
                        <option value="חולון">חולון</option>
                        <option value="ראשון-לציון">ראשון-לציון</option>
                        <option value="יהוד" selected>יהוד</option>
                        <option value="יבנה">יבנה</option>
                        <option value="אשקלון">אשקלון</option>
                        <option value="שדרות">שדרות</option>
                        <option value="באר שבע">באר שבע</option>
                        <option value="דימונה">דימונה</option>
                        <option value="אילת">אילת</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="label">תחביבים:</td>
                <td>
                    <table class="hobbyTable">
                        <tr>
                            <td>
                                <input type="checkbox" name="hobby" value="1" checked />מחשבים</td>
                            <td>
                                <input type="checkbox" name="hobby" value="2" />מוזיקה</td>
                            <td>
                                <input type="checkbox" name="hobby" value="3" />טלוויזיה</td>
                            <td>
                                <input type="checkbox" name="hobby" value="4" />ספורט</td>
                            <td>
                                <input type="checkbox" name="hobby" value="5" />רשתות חברתיות</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="label">סיסמה:</td>
                <td>
                    <input class="field" type="password" id="pw" name="pw" size="10" placeholder="6 עד 10 תווים" />
                </td>
            </tr>
            <tr>
                <td class="label">אימות סיסמה:</td>
                <td>
                    <input class="field" type="password" id="pwVerify" size="10" placeholder="שוב אותה סיסמה" />
                </td>
            </tr>

            <tr>
                <td></td>
                <td style="padding-top: 15px; text-align: center;">
                    <input type="submit" name="submit" value="שליחה" />
                </td>
            </tr>
        </table>
    </form>

</asp:Content>
