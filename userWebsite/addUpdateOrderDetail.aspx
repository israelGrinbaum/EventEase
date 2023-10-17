<%@ Page Title="" Language="C#" MasterPageFile="~/userWebsite/main.Master" AutoEventWireup="true" CodeBehind="addUpdateOrderDetail.aspx.cs" Inherits="eventsHall.userWebsite.addUpdateOrderDetail" %>
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
                    <h1>הוסף - ערוך פריט הזמנה</h1>
                </div>
                <div class="col-sm-6" style="direction: rtl;">
                    <ol class="breadcrumb slider-rtl float-sm-right" style="direction: rtl;">
                        <li class="breadcrumb-item"><a href="#">בית</a></li>
                        <li class="breadcrumb-item active"><a href="#" class="disabled">הוסף - ערוך פריט הזמנה</a></li>
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
                <div class="col-md-6">
                    <!-- general form elements -->
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">פריט הזמנה:</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <div class="card-body">
                            <div class="form-group">
                                <label>קוד הזמנה</label>
                                <asp:TextBox ID="txtOid" runat="server" class="form-control" placeholder="הכנס קוד הזמנה" disabled="true"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>קטגוריית פריט הזמנה</label>
                                <asp:DropDownList class="select2 form-control" data-placeholder="Select a State" Style="width: 100%;" ID="DDLODCatId" runat="server"></asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label>מנה</label>
                                <button id="btnProd" runat="server" style="text-align: right; color: #6c757d" type="button" class="form-control" data-bs-toggle="modal" data-bs-target="#exampleModal">לבחירת מנה</button>
                                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" dir="rtl">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content" style="align-items: start; align-content: start;">
                                            <div class="modal-header">
                                                <button id="btnCloseProd" type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body" style="width: 100%;">
                                                <div class="container">
                                                    <div id="portions" class="row">
                                                        <h3>בחר קטגוריה</h3>
<%--                                                        <asp:Repeater ID="RPTproducts" runat="server">
                                                            <ItemTemplate>
                                                                <div class="col-md-4">
                                                                    <div class="card" style="padding: 7.5px 7.5px 7.5px 7.5px">
                                                                        <img src="/uploads/pics/portions/<%# Eval("picName") %>" class="card-img-top" alt="...">
                                                                        <div class="card-body">
                                                                            <h4 class="card-title"><%# Eval("Pname") %> </h4>
                                                                            <p class="card-text text-"><%# Eval("price") %> ₪</p>
                                                                            <p class="card-text"><%# Eval("Pdesc") %></p>
                                                                            <a href="#" class="btn btn-info" onclick="selectProd(<%# Eval("Pid") %>,'<%# Eval("Pname") %>','<%# Eval("price") %>')" data-bs-dismiss="modal" aria-label="Close">בחר</a>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:Repeater>--%>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <input id="inputPid" runat="server" hidden />
                            </div>
                            <div class="form-group">
                                <label>כמות</label>
                                <asp:TextBox ID="txtAmount" runat="server" class="form-control" placeholder="הכנס כמות"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>מחיר</label>
                                <asp:TextBox ID="txtPrice" runat="server" class="form-control" placeholder="אוטומטי בבחירת מנה" disabled="true"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>קטגוריית פריט הזמנה</label>
                                <asp:ListBox ID="ListBox1" runat="server" class="form-control select2bs4" Style="width: 100%;"></asp:ListBox>

                            </div>

                            <div class="card-footer">
                                <asp:Button ID="btnSave" runat="server" class="btn btn-primary" Text="שמור" OnClick="btnSave_Click" />
                                <a id="orderLink" runat="server" href="#" onclick="window.location='orderDetails.aspx?Oid='+document.getElementById('mainCnt_txtOid').value" class="btn btn-primary">חזרה להזמנה</a>
                            </div>
                            <div onclick="selectProd(@#Pid#@,'@#Pname#@','@#price#@')"></div>
                        </div>
                    </div>
                </div>
            </div>
    </section>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
