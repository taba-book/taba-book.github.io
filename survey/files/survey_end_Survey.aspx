<%@ Page Title="סקר" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="Survey.aspx.cs" Inherits="Survey" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .layoutTable {
            width: fit-content;
            margin: 40px auto;
        }


        .leftCell {
            text-align: center;
            vertical-align: middle;
        }

        .rightCell {
            text-align: center;
            vertical-align: middle;
        }

        .surveyTable {
            width: 220px;
            margin: 0 auto;
            text-align: center;
            border: 1px solid #999;
        }

        .graphTable {
            width: 620px;
            margin: 0 15px 0 0;
            text-align: center;
            border: 1px solid #999;
        }


            .surveyTable th,
            .surveyTable td,
            .graphTable td {
                text-align: center;
                vertical-align: middle;
                height: 31px;
                padding: 0;
                border: 1px solid #999;
            }

        .fixedRow {
            height: 30px;
        }

        .optionText {
            width: 150px;
            text-align: center;
            vertical-align: middle;
        }

        .optLetter {
            font-weight: bold;
        }

        .surveyLocked td.optionText {
            color: #8a9aa0;
        }

            .surveyLocked tr.rowChosen td {
                background-color: #e1ebc8;
            }

            .surveyLocked tr.rowChosen td.optionText {
                color: #1F3A44;
                font-weight: bold;
            }

        .radioCell {
            width: 50px;
            text-align: center;
            vertical-align: middle;
        }

        .buttonCell {
            text-align: center;
            vertical-align: middle;
        }

        .graphTitle {
            font-weight: bold;
            text-align: center;
            vertical-align: middle;
        }

        .surveyTable th,
        .graphTable td.graphTitle {
            height: 36px;
        }

        .graphSummary {
            direction: rtl;
            text-align: center;
            vertical-align: middle;
        }

        .sumLetter {
            font-weight: bold;
        }

        .letterCell {
            width: 30px;
            text-align: center;
            vertical-align: middle;
            font-weight: bold;
        }

        .graphTable td.barCell {
            width: 570px;
            text-align: right;
            vertical-align: middle;
        }

        .barBox {
            width: 100%;
            height: 28px;
            text-align: right;
            white-space: nowrap;
        }

        .barText {
            display: inline-block;
            height: 28px;
            line-height: 28px;
            vertical-align: middle;
            margin-left: 6px;
        }

        .barFillRed,
        .barFillYellow,
        .barFillGreen,
        .barFillBlue {
            height: 28px;
            display: inline-block;
            margin: 0;
            vertical-align: middle;
        }

        .barFillRed {
            background-color: red;
        }

        .barFillYellow {
            background-color: yellow;
        }

        .barFillGreen {
            background-color: green;
        }

        .barFillBlue {
            background-color: blue;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form runat="server">
        <table class="layoutTable">
            <tr>
                <td class="rightCell">
                    <table class="surveyTable <%= lockClass %>">
                        <tr>
                            <th colspan="2">איזה מבעלי החיים באתר הייתם בוחרים לראות מקרוב?</th>
                        </tr>

                        <tr <%= rowAttr[0] %>>
                            <td class="optionText"><span class="optLetter">א</span> · אריה</td>
                            <td class="radioCell">
                                <input type="radio" name="surveyAnswer" value="1" <%= checkAttr[0] %> <%= lockAttr %> />
                            </td>
                        </tr>

                        <tr <%= rowAttr[1] %>>
                            <td class="optionText"><span class="optLetter">ב</span> · עיט</td>
                            <td class="radioCell">
                                <input type="radio" name="surveyAnswer" value="2" <%= checkAttr[1] %> <%= lockAttr %> />
                            </td>
                        </tr>

                        <tr <%= rowAttr[2] %>>
                            <td class="optionText"><span class="optLetter">ג</span> · לווייתן</td>
                            <td class="radioCell">
                                <input type="radio" name="surveyAnswer" value="3" <%= checkAttr[2] %> <%= lockAttr %> />
                            </td>
                        </tr>

                        <tr <%= rowAttr[3] %>>
                            <td class="optionText"><span class="optLetter">ד</span> · פיל</td>
                            <td class="radioCell">
                                <input type="radio" name="surveyAnswer" value="4" <%= checkAttr[3] %> <%= lockAttr %> />
                            </td>
                        </tr>

                        <tr>
                            <td colspan="2" class="buttonCell">
                                <input type="submit" name="submit" value="הצבעה" <%= lockAttr %> />
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="leftCell">
                    <%= survey %>
                </td>
            </tr>
        </table>

        <%= surveyMsg %>

    </form>
</asp:Content>
