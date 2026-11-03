<%@ Page Title="בול פגיעה" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="Bullseye.aspx.cs" Inherits="Bullseye" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .mainBox {
            width: 600px;
            margin: 30px auto;
            padding: 25px;
            background-color: #eef5dd;
            border-radius: 12px;
            box-sizing: border-box;
        }

        h1 {
            text-align: center;
            margin-top: 0;
            margin-bottom: 25px;
        }

        .startPanel {
            text-align: center;
            padding: 20px 40px;
        }

        .startExplain {
            font-size: 18px;
            line-height: 1.5;
            margin-bottom: 20px;
        }

        .startBtn {
            width: 224px;
            font-size: 16px;
            padding: 6px 14px;
            cursor: pointer;
            border-radius: 8px;
            border: 1px solid #999;
            box-sizing: border-box;
        }

        .gamePanel {
            text-align: center;
        }

        .topBar {
            margin-bottom: 15px;
        }

        .guessBox {
            width: 224px;
            font-size: 16px;
            text-align: center;
            padding: 6px;
            border-radius: 8px;
            border: 1px solid #999;
            box-sizing: border-box;
            margin-bottom: 12px;
        }

        .btnRow {
            margin-bottom: 12px;
        }

            .btnRow input[type=submit] {
                width: 108px;
                font-size: 16px;
                padding: 6px 14px;
                cursor: pointer;
                border-radius: 8px;
                border: 1px solid #999;
                box-sizing: border-box;
            }

                .btnRow input[type=submit]:first-child {
                    margin-left: 8px;
                }

        .msg {
            text-align: center;
            font-size: 20px;
            font-weight: bold;
            min-height: 35px;
            margin-bottom: 18px;
        }

        .gameTable {
            width: 50%;
            margin: 0 auto;
            border-collapse: collapse;
            table-layout: fixed;
            background-color: white;
        }

            .gameTable th,
            .gameTable td {
                width: 33.33%;
                text-align: center;
                font-size: 16px;
                border-top: 1px solid #7f8c7a;
                border-bottom: 1px solid #7f8c7a;
                border-right: 0;
                border-left: 0;
            }

            .gameTable th {
                background-color: #dfead0;
                padding: 3px;
            }

            .gameTable td {
                padding: 5px;
            }

        .winMsg {
            color: green;
        }

        .errorMsg {
            color: darkred;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%= denyMsg %>
    <div style="display: <%= disp %>;">

        <form runat="server">

            <div class="mainBox">

                <h1>משחק בול פגיעה</h1>

                <asp:Panel ID="pnlStart" runat="server" CssClass="startPanel">
                    <div class="startExplain">
                        השרת מגריל מספר בן 4 ספרות, ואתם צריכים לנחש אותו.<br />
                        בול = ספרה נכונה במקום הנכון<br />
                        פגיעה = ספרה נכונה אבל במקום לא נכון
                    </div>

                    <asp:Button ID="btnStartGame" runat="server" Text="התחילו לשחק" CssClass="startBtn" OnClick="btnStartGame_Click" />
                </asp:Panel>

                <asp:Panel ID="pnlGame" runat="server" CssClass="gamePanel">

                    <div class="topBar">
                        <asp:TextBox ID="txtGuess" runat="server" MaxLength="4" CssClass="guessBox"></asp:TextBox>

                        <div class="btnRow">
                            <asp:Button ID="btnCheck" runat="server" Text="בדיקת ניחוש" OnClick="btnCheck_Click" />
                            <asp:Button ID="btnNewGame" runat="server" Text="משחק חדש" OnClick="btnNewGame_Click" />
                        </div>
                    </div>

                    <div class="msg">
                        <asp:Label ID="lblMsg" runat="server"></asp:Label>
                    </div>

                    <table class="gameTable">
                        <tr>
                            <th>הניחוש</th>
                            <th>מספר הבול</th>
                            <th>מספר הפגיעות</th>
                        </tr>

                        <%= tableRows %>
                    </table>

                </asp:Panel>

            </div>
        </form>
    </div>
</asp:Content>
