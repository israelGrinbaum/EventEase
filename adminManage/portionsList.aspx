﻿<%@ Page Title="" Language="C#" MasterPageFile="~/adminManage/main.Master" AutoEventWireup="true" CodeBehind="portionsList.aspx.cs" Inherits="eventsHall.adminManage.portionsList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="DataTables/datatables.min.css" />
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/adminManage/fontawesome/fontawesome-free-6.2.1-web/css/all.min.css">
    <link rel="stylesheet" href="/adminManage/fontawesome/fontawesome-free-6.2.1-web/css/brands.css">
    <link rel="stylesheet" href="/adminManage/fontawesome/fontawesome-free-6.2.1-web/css/solid.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="/adminManage/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="/adminManage/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/adminManage/dist/css/adminlte.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainCnt" runat="server">
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header primary col-md-6">
                            <h3 class="card-title">מנות <a href="addUpdatePortion.aspx" class="btn btn-primary">הוסף מנה</a></h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <table id="example1" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>קוד מנה</th>
                                        <th>שם מנה</th>
                                        <th>תיאור</th>
                                        <th>מחיר</th>
                                        <th>תמונה</th>
                                        <th>שם קטגורייה</th>
                                        <th>ערוך</th>
                                        <th>מחק</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="RPTPortions" runat="server" OnItemDataBound="RPTPortions_ItemDataBound">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%# Eval("Pid") %></td>
                                                <td><%# Eval("Pname") %></td>
                                                <td><%# Eval("Pdesc") %></td>
                                                <td><%# Eval("price") %></td>
                                                <td>
                                                    <image width="150px" src="/uploads/pics/portions/<%# Eval("picName") %>" alt="לא ניתן להציג את התמונה"></image>
                                                </td>
                                                <td>
                                                    <asp:Literal ID="ltlCat" runat="server"></asp:Literal></td>
                                                <td>
                                                    <a href="addUpdatePortion.aspx?Pid=<%# Eval("Pid") %>" class="btn btn-primary">
                                                        <i class="fa-solid fa-pen-to-square"></i>
                                                    </a>
                                                </td>
                                                <td>
                                                    <a href="#" class="btn btn-danger" onclick="if(confirm('האם אתה בטוח?')) window.location='addUpdatePortion.aspx?Pid=<%# Eval("Pid") %>&op=del'">
                                                        <i class="fa-solid fa-trash-alt"></i>
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
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <!-- jQuery -->
    <script src="/adminManage/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="/adminManage/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- DataTables -->
    <script src="/adminManage/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="/adminManage/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
    <script src="/adminManage/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
    <script src="/adminManage/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
    <script type="text/javascript" src="/adminManage/DataTables/datatables.min.js"></script>
    <!-- AdminLTE App -->
    <script src="/adminManage/dist/js/adminlte.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="/adminManage/dist/js/demo.js"></script>
    <!-- page script -->
    <%--    <script>
        $(document).ready(function () {
            $('#example1').DataTable();
        }); 
    </script>--%>
    <script>
        $(function () {
            $("#example1").DataTable({
                //"dom": 'Qfrtip',
                //"dom": 'Pfrtip',
                "responsive": true,
                "autoWidth": false,
            });
            $('#example2').DataTable({
                "paging": true,
                "lengthChange": false,
                "searching": false,
                "ordering": true,
                "info": true,
                "autoWidth": false,
                "responsive": true,
            });
        });
</script>

</asp:Content>
