<%@ Page Title="" Language="C#" MasterPageFile="~/userWebsite/main.Master" AutoEventWireup="true" CodeBehind="orderDetail.aspx.cs" Inherits="eventsHall.userWebsite.orderDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="nav" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="maincnt" runat="server">
    <asp:HiddenField ID="HiddenODid" runat="server" />
    <asp:HiddenField ID="HiddenOid" runat="server" />
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>פירוט הזמנה</h1>
                </div>
                <div class="col-sm-6" style="direction: rtl;">
                    <ol class="breadcrumb slider-rtl float-sm-right" style="direction: rtl;">
                        <li class="breadcrumb-item"><a href="#">בית</a></li>
                        <li class="breadcrumb-item active"><a href="#" class="disabled">פירוט הזמנה</a></li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </section>
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <!-- left column -->
                <div class="col-md-2">
                </div>
                <div class="col-md-8">
                    <!-- general form elements -->
                    <asp:Repeater ID="rptPortions" runat="server" OnItemDataBound="RPTproducts_ItemDataBound">
                        <ItemTemplate>
                            <div class="tab card card-primary">
                                <div class="card-header">
                                    <h3 class="text-primary" style="display: inline"><%# Eval("catName") %> </h3>
                                    <a id="updateOrder" runat="server" href="addUpdateOrderDetail.aspx" class="btn btn-primary" style="display: inline">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                    </a>
                                </div>
                                <!-- /.card-header -->
                                <!-- form start -->
                                <div class="card-body">
                                    <div class="form-group">
                                        <div class="row">
                                            <asp:Literal ID="noPortions" runat="server"></asp:Literal>
                                            <asp:Repeater ID="RPTproducts" runat="server">
                                                <ItemTemplate>
                                                    <div class="col-md-3">
                                                        <div class="card" style="padding: 7.5px 7.5px 7.5px 7.5px;">
                                                            <img src="/uploads/pics/portions/<%# Eval("picName") %>" class="card-img-top" alt="...">
                                                            <div class="card-body">
                                                                <h4 class="card-title"><%# Eval("Pname") %> </h4>
                                                                <p class="card-text text-"><%# Eval("price") %> ₪</p>
                                                                <p class="card-text"><%# Eval("Pdesc") %></p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </ItemTemplate>

                    </asp:Repeater>
                    <%--                    <div style="overflow: auto;">
                        <div style="float: right;">
                            <button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
                            <button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
                        </div>
                    </div>--%>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
