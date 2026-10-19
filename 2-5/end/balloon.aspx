<%@ Page Language="C#" MasterPageFile="~/MasterPage.master"
    CodeFile="balloon.aspx.cs" Inherits="balloon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .stage { text-align: center; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="stage">
        <img id="ball" src="pics/balloon.png" alt="בלון" width="120" />
    </div>

    <script>
        let ballA = "pics/balloon.png";     // תמונת הבלון
        let ballB = "pics/balloonPop.png";  // תמונת הפיצוץ
        let size = 120, newSize = size;     // גודל התחלתי · נוכחי
        let i = 1;                          // מונה המחזורים

        function show(imgSrc, imgWidth) {
            let ball = document.getElementById("ball");
            ball.src = imgSrc;
            ball.width = imgWidth;
        }

        function changeImg() {
            let picSrc;
            if (i % 10 == 0) {
                picSrc = ballB;             // תמונת הפיצוץ
                newSize = size;             // חזרה לגודל התחלתי
            } else {
                picSrc = ballA;             // תמונת הבלון
                newSize += 10;              // הגדלה ב-10
            }
            show(picSrc, newSize);
            i++;
        }

        setInterval(changeImg, 200);
    </script>
</asp:Content>
