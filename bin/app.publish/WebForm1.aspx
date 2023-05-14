<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="eventsHall.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            אל: <asp:TextBox ID="txtTo"  runat="server"></asp:TextBox><br />
            נושא: <asp:TextBox ID="txtSubject" runat="server"></asp:TextBox><br />
            גוף: <asp:TextBox ID="txtBody" runat="server"></asp:TextBox><br />
            <asp:Button ID="send" Text="send" runat="server" OnClick="send_Click" />
        </div>
    </form>
</body>
</html>
