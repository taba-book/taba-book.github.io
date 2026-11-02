<%@ Page Title="גלריית תמונות" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="Gallery.aspx.cs" Inherits="Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .galleryTable {
            margin: 0 auto;
        }

        .galleryTable td {
            padding: 0;
            vertical-align: top;
            text-align: center;
        }

        .galleryTitle {
            color: #1F3A44;
            text-align: center;
            margin-top: 20px;
        }

        .smallCell {
            width: 118px;
            height: 78px;
            border: 1px solid #4d5c4d;
        }

        .bigCell {
            width: 240px;
            height: 160px;
            border: 1px solid #4d5c4d;
        }

        .imgCell {
            max-width: 118px;
            max-height: 78px;
            vertical-align: middle;
        }

        .bigPicImg {
            max-width: 240px;
            max-height: 160px;
            vertical-align: middle;
        }
    </style>

    <script>
        function showPic(picSrc) {
            document.getElementById("bigPic").src = picSrc;
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%= denyMsg %>
    <div style="display: <%= disp %>;">

        <h1 class="galleryTitle">גלריית תמונות</h1>

        <table class="galleryTable">
            <tr>
                <td class="smallCell">
                    <img class="imgCell" src="pics/pic11.png" alt="תמונה 1 בגלריה" onmouseover="showPic('pics/pic11.png')" /></td>
                <td class="smallCell">
                    <img class="imgCell" src="pics/pic12.png" alt="תמונה 2 בגלריה" onmouseover="showPic('pics/pic12.png')" /></td>
                <td class="smallCell">
                    <img class="imgCell" src="pics/pic13.png" alt="תמונה 3 בגלריה" onmouseover="showPic('pics/pic13.png')" /></td>
                <td class="smallCell">
                    <img class="imgCell" src="pics/pic14.png" alt="תמונה 4 בגלריה" onmouseover="showPic('pics/pic14.png')" /></td>
            </tr>
            <tr>
                <td class="smallCell">
                    <img class="imgCell" src="pics/pic21.png" alt="תמונה 5 בגלריה" onmouseover="showPic('pics/pic21.png')" /></td>
                <td class="bigCell" rowspan="2" colspan="2">
                    <img class="bigPicImg" id="bigPic" src="pics/pic11.png" alt="התמונה המוגדלת" /></td>
                <td class="smallCell">
                    <img class="imgCell" src="pics/pic24.png" alt="תמונה 6 בגלריה" onmouseover="showPic('pics/pic24.png')" /></td>
            </tr>
            <tr>
                <td class="smallCell">
                    <img class="imgCell" src="pics/pic31.png" alt="תמונה 7 בגלריה" onmouseover="showPic('pics/pic31.png')" /></td>
                <td class="smallCell">
                    <img class="imgCell" src="pics/pic34.png" alt="תמונה 8 בגלריה" onmouseover="showPic('pics/pic34.png')" /></td>
            </tr>
            <tr>
                <td class="smallCell">
                    <img class="imgCell" src="pics/pic41.png" alt="תמונה 9 בגלריה" onmouseover="showPic('pics/pic41.png')" /></td>
                <td class="smallCell">
                    <img class="imgCell" src="pics/pic42.png" alt="תמונה 10 בגלריה" onmouseover="showPic('pics/pic42.png')" /></td>
                <td class="smallCell">
                    <img class="imgCell" src="pics/pic43.png" alt="תמונה 11 בגלריה" onmouseover="showPic('pics/pic43.png')" /></td>
                <td class="smallCell">
                    <img class="imgCell" src="pics/pic44.png" alt="תמונה 12 בגלריה" onmouseover="showPic('pics/pic44.png')" /></td>
            </tr>

        </table>

    </div>
</asp:Content>
