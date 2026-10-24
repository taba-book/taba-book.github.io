<%@ Page Title="דף הבית" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .homePage {
            padding: 10px 25px 30px 25px;
            text-align: right;
        }

        .homeTitle {
            text-align: center;
            font-size: 34px;
            margin-bottom: 20px;
            color: #102A33;
        }

        .homeLead {
            text-align: center;
            font-size: 22px;
            margin-bottom: 35px;
            color: #2E4B55;
        }

        .homeSection {
            margin-bottom: 30px;
        }

        .homeSectionTitle {
            font-size: 25px;
            margin-bottom: 12px;
            color: #102A33;
        }

        .homeText {
            font-size: 20px;
            margin: 0 0 14px 0;
        }

        .homeSplit {
            width: 100%;
            margin: 35px 0;
        }

        .homeGap {
            width: 4%;
        }

        .homeBox {
            width: 48%;
            background-color: #eef5dd;
            padding: 16px 18px;
        }

        .homeBoxTitle {
            font-size: 22px;
            margin-top: 0;
            margin-bottom: 12px;
            color: #102A33;
        }

        .homeList {
            margin: 0;
            font-size: 19px;
        }

        .homeItem {
            margin-bottom: 8px;
        }

        .homeEnding {
            text-align: center;
            font-size: 21px;
            margin-top: 30px;
            color: #2E4B55;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="homePage">

        <h1 class="homeTitle">ברוכים הבאים לפינה שלי בעולם בעלי החיים</h1>

        <p class="homeLead">
            אם בעלי חיים מעניינים אתכם, מסקרנים אתכם,
            או שאתם פשוט אוהבים את העולם המיוחד שלהם,
            כנראה שהגעתם למקום הנכון.
        </p>

        <div class="homeSection">
            <h2 class="homeSectionTitle">קצת על האתר</h2>

            <p class="homeText">
                האתר הזה נבנה מתוך אהבה אמיתית לעולם בעלי החיים.
                לא בתור אתר "רשמי" או יבש, אלא יותר כמו מקום אישי
                שמרכז דברים שאני אוהב, קורא, כותב וחושב עליהם.
            </p>

            <p class="homeText">
                יש כאן תוכן שקשור לבעלי חיים, אבל גם צד קצת
                יותר אישי: מקום שאפשר לחזור אליו, לקרוא,
                להסתכל ולהשתתף.
            </p>
        </div>

        <div class="homeSection">
            <h2 class="homeSectionTitle">מה אפשר למצוא כאן?</h2>

            <p class="homeText">
                בדף בעלי החיים תוכלו למצוא את התוכן המרכזי
                של האתר. דף הבית נועד בעיקר לעשות סדר, להסביר
                מה הרעיון של האתר, ולתת לכם תמונה כללית על
                מה שמחכה כאן.
            </p>
        </div>

        <table class="homeSplit">
            <tr>
            <td class="homeBox">
                <h3 class="homeBoxTitle">לאורחים פתוח כרגע:</h3>
                <ul class="homeList">
                    <li class="homeItem">דף הבית</li>
                    <li class="homeItem">דף בעלי חיים</li>
                    <li class="homeItem">כניסת מנהל</li>
                </ul>
            </td>

            <td class="homeGap"></td>

            <td class="homeBox">
                <h3 class="homeBoxTitle">למשתמשים רשומים ייפתחו גם:</h3>
                <ul class="homeList">
                    <li class="homeItem">גלריה</li>
                    <li class="homeItem">סקרים</li>
                    <li class="homeItem">משחק בול פגיעה</li>
                    <li class="homeItem">יצירת דף לוח שיעורים לבית ספר</li>
                </ul>
            </td>
            </tr>
        </table>

        <p class="homeEnding">
            בקיצור, אם עולם בעלי החיים מדבר אליכם,<br />
            שווה להישאר כאן קצת.
        </p>

    </div>

</asp:Content>
