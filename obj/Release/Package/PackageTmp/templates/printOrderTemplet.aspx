<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="printOrderTemplet.aspx.cs" Inherits="eventsHall.templates.printOrderTemplet" %>

<!DOCTYPE html>
<html lang="he" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        p {
            margin-bottom: -5px;
        }

        table, tr, td {
            width: 100%;
            border-width: 2px;
            border-color: black;
        }

        table {
            margin-top: 8px;
        }
        .portion{
            padding-right:50px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <asp:HiddenField ID="hiddenOid" runat="server" />
        <p>בס"ד</p>
        <div class="container">
            <div class="row">
                <div style="width: 100%; text-align: left;">
                    <image src="..\uploads\pics\logo\grinbaum.png" width="250px"></image>
                </div>
                <div style="text-align: center;" class="col-md-12">
                    <h5 style=""><u><b>תפריט
                    <asp:Literal ID="ltlEventType" runat="server"></asp:Literal></b></u></h5>
                    <b style="margin-bottom: 5px;">שם המזמין:</b>
                    <u>
                        <asp:Literal ID="ltlUname" runat="server"></asp:Literal></u>
                    <b style="margin-bottom: 5px;">פלאפון:</b>
                    <u>
                        <asp:Literal ID="ltlPhone" runat="server"></asp:Literal></u>
                    <br>
                    <b style="margin-bottom: 5px;">תאריך האירוע:</b>
                    <u>
                        <asp:Literal ID="ltlEventDate" runat="server"></asp:Literal></u>
                    <b style="margin-bottom: 5px;">כתובת האירוע:</b>
                    <u>
                        <asp:Literal ID="ltlEventAddres" runat="server"></asp:Literal></u>

                </div>
                <div id="allPortions" class="row">
                    <asp:Repeater ID="RPTPortionCatID" runat="server" OnItemDataBound="RPTPortionCatID_ItemDataBound">
                        <ItemTemplate>
                                <p class="portion"><b><%# Eval("catName") %>:</b></p>
                                <asp:Repeater ID="RPTOrderDetails" runat="server" OnItemDataBound="RPTOrderDetails_ItemDataBound">
                                    <ItemTemplate>
                                        <p class="portion">
                                            <asp:Literal ID="ltlPid" runat="server"></asp:Literal></p>
                                    </ItemTemplate>
                                </asp:Repeater>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

<%--                <div class="col-sm-6" style="padding-right: 50px;">
                    <p><b>סלטים:</b></p>
                    <p>תפו"א</p>
                    <p>
                        חצילים במיונז
                <p>
                    חצילים מטוגנים
                <p>וולדורף</p>
                    <p>מלפפון חמוץ</p>
                    <p>טחינה</p>
                    <p>חומוס וטחינה</p>
                    <p>גזר חי</p>
                </div>
                <div class="col-sm-6" style="padding-right: 75px;">
                    <p><b>סלטים:</b></p>
                    <p>תפו"א</p>
                    <p>
                        חצילים במיונז
                <p>
                    חצילים מטוגנים
                <p>וולדורף</p>
                    <p>מלפפון חמוץ</p>
                    <p>טחינה</p>
                    <p>חומוס וטחינה</p>
                    <p>גזר חי</p>
                </div>--%>
                <div class="col-sm-12">
                    <table>
                        <tr>
                            <td>צבע מפות:______, מפיונים:______,</br>כמות מנות: גברים -______, נשים -______.</br>הערות:________________________.</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </form>
    <script>
        window.addEventListener("load", () => {
            window.print();
            window.onfocus = function () { setTimeout(function () { window.close(); }, 500); }
        });

    </script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script>
        $(
            function () {
                let portions = $(".portion");
                console.log(portions);
                let indexOfMiddleBold;
                for (let i = Math.floor(portions.length / 2); i < portions.length; i++) {
                    if (portions[i].getElementsByTagName('b').length > 0) {
                        indexOfMiddleBold = i;
                        break;
                    }
                }
                console.log(indexOfMiddleBold);
                portions.slice(0,indexOfMiddleBold).wrapAll('<div class="col-sm-6">');
                portions.slice(indexOfMiddleBold).wrapAll('<div class="col-sm-6">');
            }
        );
    </script>
</body>
</html>
