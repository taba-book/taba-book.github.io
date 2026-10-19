<%@ Page Language="C#" MasterPageFile="~/MasterPage.master"
    CodeFile="bookOfDay.aspx.cs" Inherits="bookOfDay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .today { margin: 0 auto; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>ספר היום</h2>
    <table class="today">
        <tr>
            <td><img src="pics/cover_mystery.png" id="cover" width="90" alt="כריכה"
                     onmouseover="stopTimer()" onmouseout="startTimer()"
                     onclick="nextBook()" /></td>
            <td>
                <h3 id="genre">ספרי מתח</h3>
                <p id="about">סיפור עם תעלומה שנפתרת בסוף.</p>
            </td>
        </tr>
    </table>

    <script>
        let i = 0;
        let t;

        function setBook(src, name, about) {
            document.getElementById("cover").src = src;
            document.getElementById("genre").innerHTML = name;
            document.getElementById("about").innerHTML = about;
        }

        function nextBook() {
            i++;
            switch (i % 4) {
                case 0:
                    setBook("pics/cover_mystery.png", "ספרי מתח",
                        "סיפור עם תעלומה שנפתרת בסוף.");
                    break;
                case 1:
                    setBook("pics/cover_science.png", "ספרי מדע",
                        "ספרים שמסבירים איך פועל העולם.");
                    break;
                case 2:
                    setBook("pics/cover_adventure.png", "ספרי הרפתקאות",
                        "מסע, סכנה, וגיבור שלא מוותר.");
                    break;
                case 3:
                    setBook("pics/cover_poetry.png", "ספרי שירה",
                        "מילים מעטות שאומרות הרבה.");
                    break;
            }
        }

        function startTimer() {
            clearInterval(t);
            t = setInterval(nextBook, 3000);
        }

        function stopTimer() {
            clearInterval(t);
        }

        startTimer();
    </script>
</asp:Content>
