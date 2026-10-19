<%@ Page Language="C#" MasterPageFile="~/MasterPage.master"
    CodeFile="hanukiya.aspx.cs" Inherits="hanukiya" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        function start() {
            let day = parseInt(prompt("איזה יום חנוכה?", 1));
            if (day == 1)
                pic.src = "pics/hanukiya1.png";
            else if (day == 2)
                pic.src = "pics/hanukiya2.png";
            else if (day == 3)
                pic.src = "pics/hanukiya3.png";
            else if (day == 4)
                pic.src = "pics/hanukiya4.png";
            else if (day == 5)
                pic.src = "pics/hanukiya5.png";
            else if (day == 6)
                pic.src = "pics/hanukiya6.png";
            else if (day == 7)
                pic.src = "pics/hanukiya7.png";
            else if (day == 8)
                pic.src = "pics/hanukiya8.png";
            else
                pic.src = "pics/hanukiya0.png";
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <img src="pics/hanukiya0.png" id="pic" width="200"
         alt="חנוכייה" onclick="start()" />
</asp:Content>
