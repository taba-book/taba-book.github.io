<%@ Page Title="מערכת שעות" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="Timetable.aspx.cs" Inherits="Timetable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        h1 {
            text-align: center;
        }

        .scheduleTable, .cell {
            text-align: center;
            border-collapse: collapse;
            border: 1px solid #999;
        }

        .scheduleTable {
            margin: 0 auto;
        }

        .row {
            height: 38px;
        }

        .cell {
            width: 150px;
        }

        .head {
            background-color: #b0b0b0;
        }

        .hour {
            width: 70px;
            background-color: #dddddd;
        }

        .empty {
            background-color: white;
        }

        .math {
            background-color: #30ff00;
        }

        .madmach {
            background-color: #d6c2c2;
        }

        .english {
            background-color: #b3e4f5;
        }

        .ezrachut {
            background-color: #fa8afb;
        }

        .machshevet {
            background-color: #cff1df;
        }

        .tanach {
            background-color: #f09aa5;
        }

        .sport {
            background-color: yellow;
        }

        .chinuch {
            background-color: #fcea87;
        }

        .maagalim {
            background-color: #4efdfd;
        }

        .toshba {
            background-color: #3ac5f6;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h1>מערכת שעות</h1>

        <table class="scheduleTable">
            <tr class="row">
                <th class="cell head hour">שעות</th>
                <th class="cell head">יום א</th>
                <th class="cell head">יום ב</th>
                <th class="cell head">יום ג</th>
                <th class="cell head">יום ד</th>
                <th class="cell head">יום ה</th>
            </tr>

            <tr class="row">
                <td class="cell hour">1</td>
                <td rowspan="2" class="cell math">מתמטיקה</td>
                <td rowspan="2" class="cell english">אנגלית</td>
                <td class="cell chinuch">חינוך</td>
                <td class="cell sport">חינוך גופני</td>
                <td rowspan="3" class="cell madmach">מדעי המחשב</td>
            </tr>

            <tr class="row">
                <td class="cell hour">2</td>
                <td rowspan="2" class="cell toshba">תושב"ע</td>
                <td rowspan="2" class="cell ezrachut">אזרחות</td>
            </tr>

            <tr class="row">
                <td class="cell hour">3</td>
                <td rowspan="2" class="cell english">אנגלית</td>
                <td rowspan="2" class="cell math">מתמטיקה</td>
            </tr>

            <tr class="row">
                <td class="cell hour">4</td>
                <td rowspan="2" class="cell machshevet">מחשבת ישראל</td>
                <td class="cell maagalim">מעגלים</td>
                <td class="cell chinuch">חינוך</td>
            </tr>

            <tr class="row">
                <td class="cell hour">5</td>
                <td class="cell ezrachut">אזרחות</td>
                <td rowspan="2" class="cell tanach">תנ"ך</td>
                <td rowspan="3" class="cell madmach">מדעי המחשב</td>
                <td rowspan="2" class="cell math">מתמטיקה</td>
            </tr>

            <tr class="row">
                <td class="cell hour">6</td>
                <td rowspan="2" class="cell machshevet">מחשבת ישראל</td>
                <td class="cell maagalim">מעגלים</td>
            </tr>

            <tr class="row">
                <td class="cell hour">7</td>
                <td rowspan="2" class="cell toshba">תושב"ע</td>
                <td class="cell empty"></td>
                <td class="cell tanach">תנ"ך</td>
            </tr>

            <tr class="row">
                <td class="cell hour">8</td>
                <td class="cell sport">חינוך גופני</td>
                <td class="cell empty"></td>
                <td class="cell empty"></td>
                <td class="cell empty"></td>
            </tr>
        </table>
</asp:Content>
