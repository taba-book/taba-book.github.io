<%@ Page Language="C#" MasterPageFile="~/MasterPage.master"
    CodeFile="gallery.aspx.cs" Inherits="gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        function show(src) {
            bigPic.src = src;
        }
    </script>
    <style>
        .gallery { margin: 0 auto; }
        .gallery, .gallery td { border: 1px solid #999; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="gallery">
        <tr>
            <td><img src="pics/cover_art.png" width="38" alt="אמנות"
                onmouseover="show('pics/cover_art.png')" /></td>
            <td><img src="pics/cover_music.png" width="38" alt="מוזיקה"
                onmouseover="show('pics/cover_music.png')" /></td>
            <td><img src="pics/cover_nature.png" width="38" alt="טבע"
                onmouseover="show('pics/cover_nature.png')" /></td>
            <td><img src="pics/cover_space.png" width="38" alt="חלל"
                onmouseover="show('pics/cover_space.png')" /></td>
        </tr>
        <tr>
            <td><img src="pics/cover_science.png" width="38" alt="מדע"
                onmouseover="show('pics/cover_science.png')" /></td>
            <td rowspan="2" colspan="2"><img src="pics/cover_art.png" id="bigPic"
                width="76" alt="כריכה" /></td>
            <td><img src="pics/cover_sports.png" width="38" alt="ספורט"
                onmouseover="show('pics/cover_sports.png')" /></td>
        </tr>
        <tr>
            <td><img src="pics/cover_poetry.png" width="38" alt="שירה"
                onmouseover="show('pics/cover_poetry.png')" /></td>
            <td><img src="pics/cover_history.png" width="38" alt="היסטוריה"
                onmouseover="show('pics/cover_history.png')" /></td>
        </tr>
        <tr>
            <td><img src="pics/cover_mystery.png" width="38" alt="מסתורין"
                onmouseover="show('pics/cover_mystery.png')" /></td>
            <td><img src="pics/cover_adventure.png" width="38" alt="הרפתקאות"
                onmouseover="show('pics/cover_adventure.png')" /></td>
            <td><img src="pics/cover_computers.png" width="38" alt="מחשבים"
                onmouseover="show('pics/cover_computers.png')" /></td>
            <td><img src="pics/cover_geography.png" width="38" alt="גאוגרפיה"
                onmouseover="show('pics/cover_geography.png')" /></td>
        </tr>
    </table>
</asp:Content>
