<%@ Page Language="C#" MasterPageFile="~/MasterPage.master"
    CodeFile="Gallery.aspx.cs" Inherits="Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        function show(src) {
            bigPic.src = src;
        }
    </script>
    <style>
        .gallery { margin: 0 auto; }
        .gallery, .gallery td { border: 1px solid #999; }
        .gallery tr { height: 54px; }
        .gallery td { width: 40px; text-align: center; }
        .gallery img { max-width: 38px; max-height: 50px; }
        .gallery .big img { max-width: 80px; max-height: 108px; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="gallery">
        <tr>
            <td><img src="pics/cover_art.png" alt="אמנות"
                onmouseover="show('pics/cover_art.png')" /></td>
            <td><img src="pics/cover_music.png" alt="מוזיקה"
                onmouseover="show('pics/cover_music.png')" /></td>
            <td><img src="pics/cover_nature.png" alt="טבע"
                onmouseover="show('pics/cover_nature.png')" /></td>
            <td><img src="pics/cover_space.png" alt="חלל"
                onmouseover="show('pics/cover_space.png')" /></td>
        </tr>
        <tr>
            <td><img src="pics/cover_science.png" alt="מדע"
                onmouseover="show('pics/cover_science.png')" /></td>
            <td class="big" rowspan="2" colspan="2"><img src="pics/cover_art.png" id="bigPic"
                alt="כריכה" /></td>
            <td><img src="pics/cover_sports.png" alt="ספורט"
                onmouseover="show('pics/cover_sports.png')" /></td>
        </tr>
        <tr>
            <td><img src="pics/cover_poetry.png" alt="שירה"
                onmouseover="show('pics/cover_poetry.png')" /></td>
            <td><img src="pics/cover_history.png" alt="היסטוריה"
                onmouseover="show('pics/cover_history.png')" /></td>
        </tr>
        <tr>
            <td><img src="pics/cover_mystery.png" alt="מסתורין"
                onmouseover="show('pics/cover_mystery.png')" /></td>
            <td><img src="pics/cover_adventure.png" alt="הרפתקאות"
                onmouseover="show('pics/cover_adventure.png')" /></td>
            <td><img src="pics/cover_computers.png" alt="מחשבים"
                onmouseover="show('pics/cover_computers.png')" /></td>
            <td><img src="pics/cover_geography.png" alt="גאוגרפיה"
                onmouseover="show('pics/cover_geography.png')" /></td>
        </tr>
    </table>
</asp:Content>
