<%@ Page Title="בעלי חיים" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="Animals.aspx.cs" Inherits="Animals" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        h1 {
            color: #004d00;
            text-align: center;
        }

        h2, h4 {
            color: #004d00;
        }

        a,
        a:link,
        a:visited,
        a:active {
            font-weight: bold;
            color: #004d00;
        }

        p {
            font-size: 15pt;
            color: #2B2B2B;
        }

        div {
            text-align: center;
        }

        img {
            height: 120px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1 id="top">בעלי חיים</h1>

    <hr />
    <ul>
        <li>
            <a href="#a1">
                <h4>אריה</h4>
            </a>
        </li>

        <li>
            <a href="#a2">
                <h4>פיל</h4>
            </a>
        </li>

        <li>
            <a href="#a3">
                <h4>נמר</h4>
            </a>
        </li>

        <li>
            <a href="#a4">
                <h4>גמל</h4>
            </a>
        </li>

        <li>
            <a href="#a5">
                <h4>גירית מצויה</h4>
            </a>
        </li>

        <li>
            <a href="#a6">
                <h4>עיט</h4>
            </a>
        </li>

        <li>
            <a href="#a7">
                <h4>לווייתן מצוי</h4>
            </a>
        </li>
    </ul>
    <hr />

    <h2 id="a1">אריה</h2>
    <p>
        האריה (בשם המדעי Panthera leo) שייך למשפחת החתוליים, לסוג פנתר. הוא טורף גדול, ומבין החתולים הגדולים רק תת-המין הסיבירי של הטיגריס גדול ממנו.
    </p>
    <p>
        רוב האריות חיים היום באפריקה, ומעטים חיים גם במדינת גוג'ראט שבהודו. האריה צד אוכלי עשב, ואוכל גם פגרים. בטבע הוא חי 12 עד 18 שנה, ובשבי עד 30 שנה. בגלל הכוח והגבורה שמייחסים לו, קוראים לו "מלך החיות". לנקבה קוראים לביאה, לאריה צעיר קוראים כפיר, ובעברית יש לאריה גם שמות נוספים: ליש, שחל, שחץ ולביא.
    </p>

    <p style="text-align: right; font-size: 16pt;">
        <a href="Lion.aspx">קרא עוד...</a>
    </p>

    <div>
        <img src="pics/lion1.png" alt="אריה בוגר" title="אריה בוגר" />
        <img src="pics/lion2.png" style="height: 100px;" alt="כפיר, גור אריות" title="כפיר, גור אריות" />
        <img src="pics/lion3.png" alt="אריה בוגר" title="אריה בוגר" />
    </div>

    <div>
        <a href="#top">
            <img src="pics/topIcon.png" alt="" style="margin-top: 20px; height: 60px;" />
        </a>
    </div>

    <h2 id="a2">פיל</h2>
    <p>
        השם פיל מתאר שלושה מינים של יונקים: פיל הסוואנה האפריקני, פיל היער האפריקני והפיל האסייתי. אלה בעלי החיים הגדולים ביותר שחיים היום על היבשה, והמינים היחידים שנשארו ממשפחת הפיליים. בעבר היו במשפחה מינים נוספים, למשל הממותה, אבל הם לא נחשבים לפילים רגילים.
    </p>
    <p>
        החדק הוא הסימן המובהק של הפיל: בעזרתו הוא שותה, אוכל ומתרחץ. לפיל יש גם שני חטים של שנהב, ובגללם צדו אותו הרבה מאוד, והוא נפגע קשה. הפיל האסייתי ופיל הסוואנה האפריקני נמצאים היום בסכנת הכחדה, ופיל היער האפריקני בסכנת הכחדה חמורה.
    </p>
    <p>
        לקול שהפיל משמיע קוראים בעברית חִצצור.
    </p>

    <p style="text-align: right; font-size: 16pt;">
        <a href="Elephant.aspx">קרא עוד...</a>
    </p>

    <div>
        <img src="pics/elephant1.png" alt="פילה בוגרת" title="פילה בוגרת" />
        <img src="pics/elephant2.png" style="height: 100px;" alt="גור פיל" title="גור פיל" />
        <img src="pics/elephant3.png" alt="פיל בוגר" title="פיל בוגר" />
    </div>

    <div>
        <a href="#top">
            <img src="pics/topIcon.png" alt="" style="margin-top: 20px; height: 60px;" />
        </a>
    </div>

    <h2 id="a3">נמר</h2>
    <p>
        הנמר (בשם המדעי Panthera pardus) הוא טורף ממשפחת החתוליים, מהסוג פנתר. הוא אחד הקטנים בסוג הזה, ורק נמר השלג קטן ממנו.
    </p>
    <p>
        הנמר חי באפריקה ובדרום אסיה: בסוואנות, במדבריות, ביערות ובמורדות הרים. הוא נמצא בסכנת הכחדה. לאורך השנים ראו נמרים גם בישראל, אבל היום לא ברור אם נשארו כאן נמרים בטבע.
    </p>

    <p style="text-align: right; font-size: 16pt;">
        <a href="Tiger.aspx">קרא עוד...</a>
    </p>

    <div>
        <img src="pics/tiger1.png" alt="נמר בוגר" title="נמר בוגר" />
        <img src="pics/tiger2.png" style="height: 100px;" alt="גור נמר" title="גור נמר" />
        <img src="pics/tiger3.png" alt="נמר ברביצה" title="נמר ברביצה" />
    </div>

    <div>
        <a href="#top">
            <img src="pics/topIcon.png" alt="" style="margin-top: 20px; height: 60px;" />
        </a>
    </div>

    <h2 id="a4">גמל</h2>
    <p>
        הגמל (בשם המדעי Camelus) הוא בעל חיים מקבוצת מכפילי הפרסה, וגופו מותאם לחיים במדבר.
    </p>
    <p>
        לנקבת הגמל קוראים נָאקָה (את האות א' לא הוגים), ופעם אמרו גם "גמלה". לגמל צעיר קוראים בֶּכֶר. לגמל יש גם כינוי: "ספינת המדבר".
    </p>

    <p style="text-align: right; font-size: 16pt;">
        <a href="Camel.aspx">קרא עוד...</a>
    </p>

    <div>
        <img src="pics/camel1.png" alt="גמל דו-דבשתי" title="גמל דו-דבשתי" />
        <img src="pics/camel2.png" style="height: 100px;" alt="בכר, גור גמל" title="בכר, גור גמל" />
        <img src="pics/camel3.png" alt="גמל בוגר" title="גמל בוגר" />
    </div>

    <div>
        <a href="#top">
            <img src="pics/topIcon.png" alt="" style="margin-top: 20px; height: 60px;" />
        </a>
    </div>

    <h2 id="a5">גירית מצויה</h2>
    <p>
        הגירית המצויה (בשם המדעי Meles meles) היא יונק ממשפחת הסמוריים, והמוכרת מכל הגיריות. היא גם הגדולה בסוג שלה: גדולה מהגירית האסייתית, מהגירית היפנית, וכנראה גם מהגירית הקווקזית. בעבר נחשבו כולן לתת-מינים שלה.
    </p>
    <p>
        הגירית היא טורפת בגודל בינוני שחיה על הקרקע, ברוב אירופה ובאזורים רבים באסיה. פעם חשבו שהיא חיה גם בארץ ישראל, אבל היום יודעים שהגירית שחיה בארץ היא מין אחר: הגירית הקווקזית. מין נוסף במשפחה הוא גירית הדבש.
    </p>

    <p style="text-align: right; font-size: 16pt;">
        <a href="Badger.aspx">קרא עוד...</a>
    </p>

    <div>
        <img src="pics/badger3.png" style="height: 100px;" alt="גירית מצויה" title="גירית מצויה" />
        <img src="pics/badger2.png" style="height: 100px;" alt="גירית מצויה" title="גירית מצויה" />
        <img src="pics/badger1.png" style="height: 100px;" alt="גירית מצויה" title="גירית מצויה" />
    </div>

    <div>
        <a href="#top">
            <img src="pics/topIcon.png" alt="" style="margin-top: 20px; height: 60px;" />
        </a>
    </div>

    <h2 id="a6">עיט</h2>
    <p>
        עיט (באנגלית Eagle) הוא שם משותף לכמה סוגים של עופות דורסים ממשפחת הנציים. בספרות העברית קראו לו בעבר גם "נשר". הסוגים האלה אינם קבוצה אחת במיון המדעי, אבל יש גם תת-משפחה שנקראת עיטים.

        יש יותר מ-60 מינים של עיטים. רובם חיים באירופה, באסיה ובאפריקה, ומעטים חיים ביבשות אמריקה, וגם בגינאה החדשה ובאוקיאניה.
    </p>

    <p style="text-align: right; font-size: 16pt;">
        <a href="Eagle.aspx">קרא עוד...</a>
    </p>

    <div>
        <img src="pics/eagle3.png" alt="עיט לבן צוואר" title="עיט לבן צוואר" />
        <img src="pics/eagle2.png" alt="עיט מצוי" title="עיט מצוי" />
        <img src="pics/eagle1.png" alt="עיט מצוי" title="עיט מצוי" />
    </div>

    <div>
        <a href="#top">
            <img src="pics/topIcon.png" alt="" style="margin-top: 20px; height: 60px;" />
        </a>
    </div>

    <h2 id="a7">לווייתן מצוי</h2>
    <p>
        הלווייתן המצוי (נקרא גם רורקל, או רורקל ענק; בשם המדעי Balaenoptera physalus) הוא יונק ימי ממשפחת לווייתני הענק. הוא הלווייתן השני בגודלו, ובעל החיים השני בגודלו שחי היום, אחרי הלווייתן הכחול. בדרך כלל אורכו 18 עד 21 מטרים ומשקלו כ-70 טון, אבל הוא יכול להגיע כמעט ל-27 מטרים ול-120 טון. במאה ה-20 צדו אותו בכמויות גדולות, והיום הוא נמצא בסכנת הכחדה.
    </p>

    <p style="text-align: right; font-size: 16pt;">
        <a href="FinWhale.aspx">קרא עוד...</a>
    </p>

    <div>
        <img src="pics/finWhale1.png" style="width: 250px" alt="לווייתן מצוי" title="לווייתן מצוי" />
        <img src="pics/finWhale2.png" alt="גור לווייתן" title="גור לווייתן" />
    </div>

    <div>
        <a href="#top">
            <img src="pics/topIcon.png" alt="" style="margin-top: 20px; height: 60px;" />
        </a>
    </div>

</asp:Content>
