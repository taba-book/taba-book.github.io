<%@ Page Language="C#" MasterPageFile="~/MasterPage.master"
    CodeFile="spinner.aspx.cs" Inherits="spinner" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <img src="pics/spinNG.png" id="pic" width="200" alt="סביבון" />

    <script>
        // שמות הקבצים של תמונות הסביבון
        let spin0 = "pics/spinNG.png";   // נס גדול
        let spin1 = "pics/spinGH.png";   // גדול היה
        let spin2 = "pics/spinHP.png";   // היה פה
        let spin3 = "pics/spinPN.png";   // פה נס

        // כל חצי שנייה הפעלה מחזורית של start
        setInterval(start, 500);

        let i = 1;

        function start() {
            let j = i % 4;   // שארית החלוקה ב-4
            switch (j) {
                case 0: pic.src = spin0; break;
                case 1: pic.src = spin1; break;
                case 2: pic.src = spin2; break;
                case 3: pic.src = spin3; break;
            }
            i++;
        }
    </script>
</asp:Content>
