<%@ Page Language="C#" MasterPageFile="~/MasterPage.master"
    CodeFile="clock.aspx.cs" Inherits="clock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .clock { font-weight: bold; font-size: 19px; text-align: center; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="clock" id="myTime"></div>

    <script>
        function myTimer() {
            let d = new Date();
            let t = d.toLocaleTimeString("he-IL");
            document.getElementById("myTime").innerHTML = t;
        }

        myTimer();
        setInterval(myTimer, 1000);
    </script>
</asp:Content>
