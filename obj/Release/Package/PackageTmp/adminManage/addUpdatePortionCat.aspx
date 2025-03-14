﻿<%@ Page Title="" Language="C#" MasterPageFile="~/adminManage/main.Master" AutoEventWireup="true" CodeBehind="addUpdatePortionCat.aspx.cs" Inherits="eventsHall.adminManage.addUpdatePortionCat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainCnt" runat="server">
    <asp:HiddenField ID="HiddenCid" runat="server" />
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>הוסף - ערוך קטגוריית מנה</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">בית</a></li>
                        <li class="breadcrumb-item active">הוסף - ערוך קטגוריית מנה</li>
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
                            <h3 class="card-title">קטגוריית מנה:</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <div class="card-body">
                            <div class="form-group form-floating">
                                <asp:TextBox ID="txtCatName" runat="server" class="form-control Required" placeholder="הכנס שם קטגוריה"></asp:TextBox>
                                <label for="mainCnt_txtCatName">שם קטגוריית מנה</label>
                            </div>
                            <div class="form-group form-floating">
                                <asp:DropDownList ID="DDLparentCat" runat="server" class="form-control"></asp:DropDownList>
                                <label for="mainCnt_DDLparentCat">קטגוריית אב</label>
                            </div>
                            <!-- /.card-body -->

                            <div class="card-footer">
                                <asp:Button ID="btnSave" runat="server" class="btn btn-primary" Text="שמור" OnClick="btnSave_Click" />
                                <a href="portionCatList.aspx" class="btn btn-primary">לטבלת קטגוריות</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
