<%@ Page Title="גירית מצויה" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="Badger.aspx.cs" Inherits="Badger" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        h1 {
            color: darkred;
            text-align: center;
        }

        h2 {
            color: darkgreen;
        }

        p {
            font-size: 15pt;
            color: navy;
        }

        img {
            height: 120px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>גירית מצויה</h1>

    <img src="pics/badger3.png" alt="גירית מצויה" style="float: right; margin-left: 15px;" />

    <div style="text-align: right;">
        <p>
            הגירית המצויה (בשם המדעי Meles meles) היא יונק נפוץ מהסוג גירית (Meles), ממשפחת הסמוריים. היא המוכרת מכל הגיריות והגדולה בסוג שלה: גדולה מהגירית האסייתית, מהגירית היפנית, וכנראה גם מהגירית הקווקזית. בעבר נחשבו כולן לתת-מינים שלה. זו טורפת בגודל בינוני שחיה על הקרקע, ברוב אירופה ובאזורים רבים באסיה. פעם חשבו שהיא חיה גם בארץ ישראל, אבל היום הגירית של הארץ נחשבת למין נפרד: הגירית הקווקזית.
        </p>

        <h2>מאפיינים</h2>

        <p>
            הגירית ארוכה כ-90 סנטימטרים, מהם 20 סנטימטרים של זנב, ומשקלה בממוצע כ-10 קילוגרם. המשקל יכול להשתנות מאוד: באזורים הצפוניים שבהם היא חיה, הגיריות צוברות שומן בסתיו, והוא עוזר להן לעבור את החורף. ברוסיה יש גיריות ששוקלות בסתיו אפילו 32 קילוגרם, והשומן מאפשר להן לישון במחילות עד שישה חודשים, בחורף הרוסי הקר. הפרווה הצפופה שלה אפורה בגב ושחורה בשאר הגוף, ועל הפנים המוארכות יש פסים שחורים ולבנים. האוזניים קטנות ועגולות, והרגליים קצרות ועבות. אצל תת-המין Meles meles anaguma הסימנים בפנים נמצאים רק סביב העיניים.
        </p>

        <p>
            הגירית אוכלת כל, ופעילה בלילה. הגיריות שומרות על שטח משלהן, אבל לפעמים חיות בקבוצה של עד 12. הגירית אוכלת שורשים, פירות, ביצים של עופות, יונקים קטנים, צפרדעים וחרקים. היא חיה בין 3 ל-12 שנים, ובשבי עד 16. הגיריות חיות בזוגות. באביב הנקבה ממליטה 2 עד 4 גורים. הגורים נולדים עיוורים, ונשארים במאורה חודשים, עד שהם יכולים לחפש מזון בעצמם.
        </p>

        <h2>תת-מינים</h2>

        <p>
            לגירית המצויה יש כמה תת-מינים: Meles meles meles במערב אירופה, Meles meles marianensis בספרד ובפורטוגל, Meles meles heptneri בערבה האירואסייתית, עד הדלתה של הוולגה, ו-Meles meles milleri בנורווגיה. הגירית הקווקזית (Meles canescens), שחיה במערב אסיה ובכלל זה בישראל, נחשבה בעבר לתת-מין של הגירית המצויה, אבל היום היא נחשבת למין נפרד.
        </p>
    </div>
    <div style="text-align: center; clear: both;">
        <a href="Animals.aspx">
            <img src="pics/topIcon.png" alt="" style="margin-top: 20px; height: 60px;" />
        </a>
    </div>

</asp:Content>
