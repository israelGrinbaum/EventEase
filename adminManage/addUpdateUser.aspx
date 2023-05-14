<%@ Page Title="" Language="C#" MasterPageFile="~/adminManage/main.Master" AutoEventWireup="true" CodeBehind="addUpdateUser.aspx.cs" Inherits="eventsHall.adminManage.addUpdateUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainCnt" runat="server">
        <asp:HiddenField ID="HiddenUid" runat="server" />
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>הוסף - ערוך משתמש</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">בית</a></li>
              <li class="breadcrumb-item active"> הוסף - ערוך משתמש</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
        <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-6">
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title"> משתמש:</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
                <div class="card-body">
                  <div class="form-group">
                      <label >שם</label>
                      <asp:TextBox ID="txtName" runat="server" class="form-control" placeholder="הכנס שם"></asp:TextBox>
                  </div>
                  <div class="form-group">
                      <label >אימייל</label>
                      <asp:TextBox ID="txtemail" runat="server" class="form-control" placeholder="הכנס אימייל"></asp:TextBox>
                  </div>
                  <div class="form-group">
                      <label >טלפון</label>
                      <asp:TextBox ID="txtphone" runat="server" class="form-control" placeholder="הכנס טלפון"></asp:TextBox>
                  </div>
                  <div class="form-group">
                      <label >הרשאה</label>
                      <asp:DropDownList ID="DDLpermmision" runat="server" class="form-control"></asp:DropDownList>
                  </div>

                <div class="card-footer">
                    <asp:Button ID="btnSave" runat="server" class="btn btn-primary" Text="שמור" OnClick="btnSave_Click"/>
                    <a href="usersList.aspx" class="btn btn-primary">לטבלת משתמשים</a>
                </div>
            </div>
        </div>
    </div>
    </div>
</section>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
