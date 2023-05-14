<%@ Page Title="" Language="C#" MasterPageFile="~/adminManage/main.Master" AutoEventWireup="true" CodeBehind="messages.aspx.cs" Inherits="eventsHall.adminManage.messages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <link rel="stylesheet" href="/adminManage/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
      <link rel="stylesheet" href="/adminManage/fontawesome/fontawesome-free-6.2.1-web/css/all.min.css">
      <link rel="stylesheet" href="/adminManage/fontawesome/fontawesome-free-6.2.1-web/css/brands.css">
      <link rel="stylesheet" href="/adminManage/fontawesome/fontawesome-free-6.2.1-web/css/solid.css">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainCnt" runat="server">

        <section class="content">
          <div class="container-fluid">
            <div class="row">
              <div class="col-12">
                <div class="card">
                    <div class="card-header primary">
                        <h3 class="card-title">הודעות מערכת</h3>
                    </div>
                    <!-- /.card-header -->


                    <div class="card-body">
                        <div class="row">
                          <div class="col-md-6">
                            <div class="card card-outline card-danger">
                              <div class="card-header">
                                <h3 class="card-title">
                                    <asp:Literal ID="ltlMsgHeader" runat="server" Text="הודעה"></asp:Literal>
                                </h3>

                                <div class="card-tools">
                                  <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
                                  </button>
                                </div>
                                <!-- /.card-tools -->
                              </div>
                              <!-- /.card-header -->
                              <div class="card-body danger">
                                <asp:Literal ID="ltlMsgBody" runat="server" ></asp:Literal>
                              </div>
                              <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                          </div>
                          <!-- /.col -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
