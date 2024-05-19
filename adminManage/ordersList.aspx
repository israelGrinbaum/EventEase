<%@ Page Title="" Language="C#" MasterPageFile="~/adminManage/main.Master" AutoEventWireup="true" CodeBehind="ordersList.aspx.cs" Inherits="eventsHall.adminManage.ordersList" %>

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
    <style>
/*        HTML CSSResult Skip Results Iframe
        EDIT ON
        body {
            display: flex;
            justify-content: center;
            margin-top: 20px;
            color: #37559d;
        }

        a {
            color: #5165ff;
        }

        table {
            border-collapse: collapse;
        }

        td {
            border: 2px solid #ccd2ff;
            position: relative;
        }

        tr:hover,
        tr:focus-within {
            background: #f2f3ff;
            outline: none;
        }

        td > a:first-child {
            display: flex;
            padding: 18px;
            text-decoration: none;
            color: inherit;
            z-index: 0;
        }

        td > a:first-child:focus {
            outline: 0;
        }
*/
        td{
            width:fit-content;
            height:fit-content;
            padding:0;

        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainCnt" runat="server">
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
                                        <th>הדפסה</th>
                                        <th>קוד הזמנה</th>
                                        <th>לקוח</th>
                                        <th>תאריך אירוע</th>
                                        <th>כמות אנשים</th>
                                        <th>סוג אירוע</th>
                                        <th>מחיר</th>
                                        <th>תאריך יצירת הזמנה</th>
                                        <th>סטטוס הזמנה</th>
                                        <th>אולם</th>
                                        <th>הערות</th>
                                        <th>אישור הזמנה</th>
                                        <th>ערוך</th>
                                        <th>מחק</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="RPTOrders" runat="server" OnItemDataBound="RPTOrders_ItemDataBound">
                                        <ItemTemplate>

                                            <tr>
                                                <td style="position:relative;">
                                                    <a target="_blank" href="../templates/printOrderTemplet.aspx?Oid=<%# Eval("Oid") %>" class="btn btn-primary stretched-link">
                                                        <i class="fa-solid fa-print"></i>
                                                    </a>
                                                </td>

                                                <td style="position:relative;">
                                                    <a tabindex="-1" href="orderDetails.aspx?Oid=<%# Eval("Oid") %>" class="stretched-link">
                                                        <%# Eval("Oid") %>
                                                    </a>
                                                </td>
                                                <td style="position:relative;">
                                                    <a tabindex="-1" href="orderDetails.aspx?Oid=<%# Eval("Oid") %>" class="stretched-link">
                                                        <asp:Literal ID="Uid" runat="server"></asp:Literal>
                                                    </a>
                                                </td>
                                                <td style="position:relative;">
                                                    <a href="orderDetails.aspx?Oid=<%# Eval("Oid") %>" class="stretched-link">
                                                        <%# Eval("eventDate") %>
                                                    </a>
                                                </td>
                                                <td style="position:relative;">
                                                    <a href="orderDetails.aspx?Oid=<%# Eval("Oid") %>" class="stretched-link">
                                                        <%# Eval("somePeople") %>
                                                    </a>
                                                </td>
                                                <td style="position:relative;">
                                                    <a href="orderDetails.aspx?Oid=<%# Eval("Oid") %>" class="stretched-link">
                                                        <asp:Literal ID="eventTypeId" runat="server"></asp:Literal>
                                                    </a>
                                                </td>
                                                <td style="position:relative;">
                                                    <a href="orderDetails.aspx?Oid=<%# Eval("Oid") %>" class="stretched-link">
                                                        <asp:Literal ID="ltlCalculatedPrice" runat="server"></asp:Literal>
                                                    </a>
                                                </td>
                                                <td style="position:relative;">
                                                    <a href="orderDetails.aspx?Oid=<%# Eval("Oid") %>" class="stretched-link">
                                                        <%# Eval("createDate") %>
                                                    </a>
                                                </td>
                                                <td style="position:relative;">
                                                    <a href="orderDetails.aspx?Oid=<%# Eval("Oid") %>" class="stretched-link">
                                                        <%# Eval("orderStatus") %>
                                                    </a>
                                                </td>
                                                <td style="position:relative;">
                                                    <a href="orderDetails.aspx?Oid=<%# Eval("Oid") %>" class="stretched-link">
                                                        <asp:Literal ID="Hid" runat="server"></asp:Literal>
                                                    </a>
                                                </td>
                                                <td style="position:relative;">
                                                    <a href="orderDetails.aspx?Oid=<%# Eval("Oid") %>" class="stretched-link">
                                                        <%# Eval("notes") %>
                                                    </a>
                                                </td>
                                                <td style="position:relative;">
                                                    <asp:LinkButton id="OrderApprove" runat="server" OnCommand="OrderApprove_Click" class="btn btn-primary stretched-link">
                                                        <i class="fa-regular fa-circle-check"></i>
                                                    </asp:LinkButton>
                                                </td>
                                                <td style="position:relative;">
                                                    <a href="addUpdateOrder.aspx?Oid=<%# Eval("Oid") %>" class="btn btn-primary stretched-link">
                                                        <i class="fa-solid fa-pen-to-square"></i>
                                                    </a>
                                                </td>
                                                <td style="position:relative;">
                                                    <a href="#" class="btn btn-danger stretched-link" onclick="if(confirm('האם אתה בטוח?')) window.location='addUpdateOrder.aspx?Oid=<%# Eval("Oid") %>&op=del'">
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
