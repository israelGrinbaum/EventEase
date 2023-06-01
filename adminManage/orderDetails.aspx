<%@ Page Title="" Language="C#" MasterPageFile="~/adminManage/main.Master" AutoEventWireup="true" CodeBehind="orderDetails.aspx.cs" Inherits="eventsHall.adminManage.orderDetails" %>

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
                            <h3 class="card-title">הזמנה
                                <asp:Literal ID="ltlOid" runat="server"></asp:Literal>
                                <a id="addOD" runat="server" href="#" class="btn btn-primary">הוסף פריט להזמנה</a></h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <div class="container">
                                <div class="row">
                                    <ol class="list-group list-group-horizontal" style="margin-bottom:20px">
                                        <li class="col-md-2 list-group-item d-flex justify-content-between align-items-start">
                                            <div class="ms-2 me-auto">
                                                <div class="fw-bold">שם המזמין</div>
                                                <asp:Literal ID="ltlUname" runat="server"></asp:Literal>
                                            </div>

                                        </li>
                                        <li class="col-md-2 list-group-item d-flex justify-content-between align-items-start">
                                            <div class="ms-2 me-auto">
                                                <div class="fw-bold">תאריך אירוע</div>
                                                <asp:Literal ID="ltlEventDate" runat="server"></asp:Literal>
                                            </div>

                                        </li>
                                        <li class="col-md-2 list-group-item d-flex justify-content-between align-items-start">
                                            <div class="ms-2 me-auto">
                                                <div class="fw-bold">כמות משתתפים</div>
                                                <asp:Literal ID="ltlSomePeople" runat="server"></asp:Literal>
                                            </div>

                                        </li>
                                        <li class="col-md-2 list-group-item d-flex justify-content-between align-items-start">
                                            <div class="ms-2 me-auto">
                                                <div class="fw-bold">סוג אירוע</div>
                                                <asp:Literal ID="ltlEventType" runat="server"></asp:Literal>
                                            </div>

                                        </li>
                                        <li class="col-md-2 list-group-item d-flex justify-content-between align-items-start">
                                            <div class="ms-2 me-auto">
                                                <div class="fw-bold">אולם</div>
                                                <asp:Literal ID="ltlHall" runat="server"></asp:Literal>
                                            </div>

                                        </li>
                                        <li class="col-md-2 list-group-item d-flex justify-content-between align-items-start">
                                            <div class="ms-2 me-auto">
                                                <div class="fw-bold">הערות</div>
                                                <asp:Literal ID="ltlNotes" runat="server"></asp:Literal>
                                            </div>

                                        </li>
                                    </ol>

                                </div>
                            </div>
                            <table id="example1" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>קוד פרטי הזמנה</th>
                                        <th>מוצר / מנה</th>
                                        <th>כמות</th>
                                        <th>מחיר ליח'</th>
                                        <th>קטגוריית מוצר</th>
                                        <th>ערוך</th>
                                        <th>מחק</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="RPTOrderDetails" runat="server" OnItemDataBound="RPTOrderDetails_ItemDataBound">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%# Eval("ODid") %></td>
                                                <td><asp:Literal ID="ltlPid" runat="server"></asp:Literal></td>
                                                <td><%# Eval("amount") %></td>
                                                <td><%# Eval("price") %></td>
                                                <td><asp:Literal ID="ltlPortionCatId" runat="server"></asp:Literal></td>
                                                <td>
                                                    <a href="addUpdateOrderDetail.aspx?ODid=<%# Eval("ODid") %>&Oid=<%# Eval("Oid") %>" class="btn btn-primary">
                                                        <i class="fa-solid fa-pen-to-square"></i>
                                                    </a>
                                                </td>
                                                <td>
                                                    <a href="#" class="btn btn-danger" onclick="if(confirm('האם אתה בטוח?')) window.location='addUpdateOrderDetail.aspx?ODid=<%# Eval("ODid") %>&op=del'">
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
