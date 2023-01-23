<%@ Page Title="" Language="C#" MasterPageFile="~/eventsHall.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="eventsHall.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainCnt" runat="server">


    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <asp:Label ID="nameMsg" runat="server"/>
                שם מלא:<asp:TextBox ID="TxtName" runat="server"/><br />
            </div>
            <div class="col-md-6">
                <asp:Label ID="emailMsg" runat="server"/>
                אימייל:<asp:TextBox ID="TxtEmail" TextMode="Email" runat="server"/><br />
            </div>
            <div class="col-md-6">
                <asp:Label ID="phoneMsg" runat="server"/>
                טלפון:<asp:TextBox ID="TxtPhone" TextMode="Phone" runat="server"/><br />
            </div>
            <div class="col-md-6">
                <asp:Label ID="passMsg" runat="server"/>
                סיסמא:<asp:TextBox ID="TxtPass" TextMode="Password" runat="server"/><br />
            </div>
            <div class="col-md-6">
                <asp:Label ID="pass2Msg" runat="server"/>
                אימות סיסמא:<asp:TextBox ID="TxtPass2" TextMode="Password" runat="server"/><br />
            </div>
            <div class="col-md-6">
                <asp:Button ID="BtnReg" runat="server" Text="הירשם" OnClick="BtnReg_Click" />
            </div>


        </div>
    </div>




</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footerCnt" runat="server">
</asp:Content>
