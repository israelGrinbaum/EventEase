<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="eventsHall.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:repeater ID="rptFakeProds" runat="server">
                <HeaderTemplate>
                    <table border="1">
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("id") %></td>
                        <td><%# Eval("title") %></td>
                        <td><%# Eval("price") %></td>
                        <td><%# Eval("category") %></td>
                        <td><%# Eval("description") %></td>
                        <td><image width="100%" src="<%# Eval("image") %>"></image></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:repeater>
        </div>
    </form>
</body>
</html>
