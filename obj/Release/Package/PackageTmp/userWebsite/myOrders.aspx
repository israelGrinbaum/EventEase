<%@ Page Title="" Language="C#" MasterPageFile="~/userWebsite/main.Master" AutoEventWireup="true" CodeBehind="myOrders.aspx.cs" Inherits="eventsHall.userWebsite.myOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/adminManage/fontawesome/fontawesome-free-6.2.1-web/css/all.min.css">
    <link rel="stylesheet" href="/adminManage/fontawesome/fontawesome-free-6.2.1-web/css/brands.css">
    <link rel="stylesheet" href="/adminManage/fontawesome/fontawesome-free-6.2.1-web/css/solid.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="nav" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="maincnt" runat="server">
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header primary col-md-12">
                            <h3 class="card-title">הזמנות <a href="addUpdateOrder.aspx" class="btn btn-primary">הוסף הזמנה</a></h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <table id="example1" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>קוד הזמנה</th>
                                        <th>קוד לקוח</th>
                                        <th>תאריך אירוע</th>
                                        <th>כמות אנשים</th>
                                        <th>סוג אירוע</th>
                                        <th>מחיר אירוע</th>
                                        <th>תאריך יצירת הזמנה</th>
                                        <th>קוד אולם</th>
                                        <th>הערות</th>
                                        <th>ערוך</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="RPTOrders" runat="server" OnItemDataBound="RPTOrders_ItemDataBound">
                                        <ItemTemplate>

                                            <tr>

                                                <td style="position: relative;">
                                                    <a tabindex="-1" href="orderDetail.aspx?Oid=<%# Eval("Oid") %>" class="stretched-link">
                                                        <%# Eval("Oid") %>
                                                    </a>
                                                </td>
                                                <td style="position: relative;">
                                                    <a tabindex="-1" href="orderDetail.aspx?Oid=<%# Eval("Oid") %>" class="stretched-link">
                                                        <asp:Literal ID="Uid" runat="server"></asp:Literal>
                                                    </a>
                                                </td>
                                                <td style="position: relative;">
                                                    <a href="orderDetail.aspx?Oid=<%# Eval("Oid") %>" class="stretched-link">
                                                        <%# Eval("eventDate") %>
                                                    </a>
                                                </td>
                                                <td style="position: relative;">
                                                    <a href="orderDetail.aspx?Oid=<%# Eval("Oid") %>" class="stretched-link">
                                                        <%# Eval("somePeople") %>
                                                    </a>
                                                </td>
                                                <td style="position: relative;">
                                                    <a href="orderDetail.aspx?Oid=<%# Eval("Oid") %>" class="stretched-link">
                                                        <asp:Literal ID="eventTypeId" runat="server"></asp:Literal>
                                                    </a>
                                                </td>
                                                <td style="position: relative;">
                                                    <a href="orderDetail.aspx?Oid=<%# Eval("Oid") %>" class="stretched-link">
                                                        <asp:Literal ID="ltlCalculatedPrice" runat="server"></asp:Literal>
                                                    </a>
                                                </td>
                                                <td style="position: relative;">
                                                    <a href="orderDetail.aspx?Oid=<%# Eval("Oid") %>" class="stretched-link">
                                                        <%# Eval("createDate") %>
                                                    </a>
                                                </td>
                                                <td style="position: relative;">
                                                    <a href="orderDetail.aspx?Oid=<%# Eval("Oid") %>" class="stretched-link">
                                                        <asp:Literal ID="Hid" runat="server"></asp:Literal>
                                                    </a>
                                                </td>
                                                <td style="position: relative;">
                                                    <a href="orderDetail.aspx?Oid=<%# Eval("Oid") %>" class="stretched-link">
                                                        <%# Eval("notes") %>
                                                    </a>
                                                </td>
                                                <td style="position: relative;">
                                                    <a href="addUpdateOrder.aspx?Oid=<%# Eval("Oid") %>" class="btn btn-primary stretched-link">
                                                        <i class="fa-solid fa-pen-to-square"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                        </ItemTemplate>

                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </section>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
