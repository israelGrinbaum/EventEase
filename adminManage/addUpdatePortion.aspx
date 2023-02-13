<%@ Page Title="" Language="C#" MasterPageFile="~/adminManage/main.Master" AutoEventWireup="true" CodeBehind="addUpdatePortion.aspx.cs" Inherits="eventsHall.adminManage.addUpdatePortion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <!-- Select2 -->
      <link rel="stylesheet" href="/adminManage/plugins/select2/css/select2.min.css">
      <link rel="stylesheet" href="/adminManage/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
      <!-- Bootstrap4 Duallistbox -->
      <link rel="stylesheet" href="/adminManage/plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainCnt" runat="server">
    <asp:HiddenField ID="HiddenPid" runat="server" />
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>הוסף - ערוך מנה</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">בית</a></li>
              <li class="breadcrumb-item active"> הוסף - ערוך מנה</li>
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
                <h3 class="card-title"> מנה:</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
                <div class="card-body">
                  <div class="form-group">
                      <label >שם מנה</label>
                      <asp:TextBox ID="txtPName" runat="server" class="form-control" placeholder="הכנס שם מנה"></asp:TextBox>
                  </div>
                  <div class="form-group">
                      <label >תיאור מנה</label>
                      <asp:TextBox ID="txtPdesc" runat="server" class="form-control" placeholder="הכנס תיאור מנה"></asp:TextBox>
                  </div>
                  <div class="form-group">
                      <label >מחיר</label>
                      <asp:TextBox ID="txtPrice" runat="server" class="form-control" placeholder="הכנס מחיר מנה"></asp:TextBox>
                  </div>
                  <div class="form-group">
                      <label >תמונה</label>
                      <asp:Image ID="pic" runat="server" />
                  </div>
                  <div class="form-group">
                      <label >העלאת תמונה</label>
                      <asp:FileUpload ID="picUpload" runat="server" class="form-control"/>
                  </div>
                  <div class="form-group">
                        <div class="form-group">
                          <label>קטגורייה</label>
                          <asp:DropDownList ID="DDLCats" runat="server" class="form-control select2bs4" style="width: 100%;"></asp:DropDownList>
                          <!--<select class="form-control select2bs4" style="width: 100%;">
                            <option selected="selected">Alabama</option>
                            <option>Alaska</option>
                            <option>California</option>
                            <option>Delaware</option>
                            <option>Tennessee</option>
                            <option>Texas</option>
                            <option>Washington</option>
                          </select>-->
                        </div>
                  </div>


                  <div class="form-group">
                    <label >קטגוריית אב</label>
                    <asp:DropDownList ID="DDLparentCat" runat="server" class="form-control"></asp:DropDownList>
                  </div>
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                    <asp:Button ID="btnSave" runat="server" class="btn btn-primary" Text="שמור" OnClick="btnSave_Click"/>
                    <a href="portionCatList.aspx" class="btn btn-primary">לטבלת קטגוריות</a>
                </div>
            </div>
        </div>
    </div>
    </div>
</section>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <!-- Select2 -->
    <script src="/adminManage/plugins/select2/js/select2.full.min.js"></script>

    <script>
  $(function () {
    //Initialize Select2 Elements
    $('.select2bs4').select2({
      theme: 'bootstrap4'
    })
  })
</script>

</asp:Content>
