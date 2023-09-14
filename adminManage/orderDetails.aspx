<%@ Page Title="" Language="C#" MasterPageFile="~/adminManage/main.Master" AutoEventWireup="true" CodeBehind="orderDetails.aspx.cs" Inherits="eventsHall.adminManage.orderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="DataTables/datatables.min.css" />
    <!-- Select2 -->
    <link rel="stylesheet" href="/adminManage/plugins/select2/css/select2.min.css">
    <link rel="stylesheet" href="/adminManage/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">

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
        .list-group-item {
            padding: 0.75rem 0.50rem 0.75rem 0.50rem;
        }

        .ms-2 {
            width: 100%;
            margin-left: 8px !important;
        }

        .select2-dropdown {
            direction: rtl !important;
        }
    </style>
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
                                    <div class="list-group list-group-horizontal" style="margin-bottom: 20px">
                                        <div class="col-md-2 list-group-item d-flex justify-content-between align-items-start">
                                            <div class="ms-2 me-auto">
                                                <div class="fw-bold">שם המזמין</div>
                                                <asp:DropDownList class="select2 form-control" data-placeholder="Select a State" Style="width: 100%;" ID="DDLUid" runat="server"></asp:DropDownList>
                                            </div>

                                        </div>
                                        <div class="col-md-2 list-group-item d-flex justify-content-between align-items-start">
                                            <div class="ms-2 me-auto">
                                                <div class="fw-bold">תאריך אירוע</div>
                                                <div class="input-group date" id="datetimepicker1" data-target-input="nearest">
                                                    <asp:TextBox ID="txtEventDate" runat="server" class="form-control datetimepicker-input" data-toggle="datetimepicker" data-target="#datetimepicker1" placeholder="הכנס תאריך אירוע"></asp:TextBox>
                                                    <%--                                                    <input type="text" class="form-control datetimepicker-input"  />--%>
                                                    <%--                                                    <div class="input-group-append" data-target="#datetimepicker1" data-toggle="datetimepicker">
                                                        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                                    </div>--%>
                                                </div>

                                            </div>

                                        </div>
                                        <div class="col-md-2 list-group-item d-flex justify-content-between align-items-start">
                                            <div class="ms-2 me-auto">
                                                <div class="fw-bold">כמות משתתפים</div>
                                                <asp:TextBox ID="txtSomePeople" runat="server" class="form-control" placeholder="הכנס כמות אנשים"></asp:TextBox>
                                            </div>

                                        </div>
                                        <div class="col-md-2 list-group-item d-flex justify-content-between align-items-start">
                                            <div class="ms-2 me-auto">
                                                <div class="fw-bold">סוג אירוע</div>
                                                <asp:DropDownList class="select2 form-control" data-placeholder="Select a State" Style="width: 100%;" ID="DDLEventType" runat="server"></asp:DropDownList>
                                            </div>

                                        </div>
                                        <div class="col-md-2 list-group-item d-flex justify-content-between align-items-start">
                                            <div class="ms-2 me-auto">
                                                <div class="fw-bold">אולם</div>
                                                <asp:DropDownList class="select2 form-control" data-placeholder="Select a State" Style="width: 100%;" ID="DDLHid" runat="server"></asp:DropDownList>
                                            </div>

                                        </div>
                                        <div class="col-md-2 list-group-item d-flex justify-content-between align-items-start">
                                            <div class="ms-2 me-auto">
                                                <div class="fw-bold">הערות</div>
                                                <asp:TextBox TextMode="MultiLine" ID="txtNotes" runat="server" class="form-control" placeholder="הכנס הערות"></asp:TextBox>
                                            </div>

                                        </div>
                                    </div>
                                    <%--                                    <div class="form-group">
                                        <div class="input-group date" id="datetimepicker1" data-target-input="nearest">
                                            <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker1" />
                                            <div class="input-group-append" data-target="#datetimepicker1" data-toggle="datetimepicker">
                                                <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                            </div>
                                        </div>
                                    </div>--%>
                                </div>
                            </div>
                            <table id="example1" class="table table-bordered hover">
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
                                    <asp:Repeater ID="RPTPortionCatID" runat="server" OnItemDataBound="RPTPortionCatID_ItemDataBound">
                                        <ItemTemplate>
                                            <tr class="bg-body-secondary text-bold">
                                                <td id="CatTd" runat="server" colspan="7"><%# Eval("catName") %>:</td>
                                                <td hidden="hidden"></td>
                                                <td hidden="hidden"></td>
                                                <td hidden="hidden"></td>
                                                <td hidden="hidden"></td>
                                                <td hidden="hidden"></td>
                                                <td hidden="hidden"></td>
                                            </tr>
                                            <asp:Repeater ID="RPTOrderDetails" runat="server" OnItemDataBound="RPTOrderDetails_ItemDataBound">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td><%# Eval("ODid") %></td>
                                                        <td>
                                                            <asp:Literal ID="ltlPid" runat="server"></asp:Literal>
                                                        </td>
                                                        <td><%# Eval("amount") %></td>
                                                        <td><%# Eval("price") %></td>
                                                        <td>
                                                            <asp:Literal ID="ltlPortionCatId" runat="server"></asp:Literal>
                                                        </td>
                                                        <td>
                                                            <a href="addUpdateOrderDetail.aspx?ODid=<%# Eval("ODid") %>&Oid=<%# Eval("Oid") %>" class="btn btn-primary">
                                                                <i class="fa-solid fa-pen-to-square"></i>
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a href="#" class="btn btn-danger" onclick="if(confirm('האם אתה בטוח?')) window.location='addUpdateOrderDetail.aspx?ODid=<%# Eval("ODid") %>&op=del&Oid=<%# Eval("Oid") %>'">
                                                                <i class="fa-solid fa-trash-alt"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>

                                            </asp:Repeater>

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
    <script src="/adminManage/plugins/select2/js/select2.full.min.js"></script>
    <script src="plugins/moment/moment-with-locales.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#datetimepicker1').datetimepicker();
        });
    </script>
    <script>
        $(function () {
            $('.select2').select2()

            //Initialize Select2 Elements
            $('.select2bs4').select2({
                theme: 'bootstrap4'
            })
            $('.select2-selection').addClass('form-control')
            $('.select2-selection').removeClass('select2-selection select2-selection--single')
            $('.paginate_button current').addClass('btn btn primery')

        })
    </script>
    <script>
        $(function () {
            console.log("abc");
            var table = document.getElementById("example1");
            for (var i = 0; i < table.rows.length; i++) {
                if (table.rows[i].cells[4] !== table.rows[i + 1].cells[4]) {
                    //    var row = table.insertRow(i + 1);
                    //    var cell = row.insertCell(0);
                    //    cell.innerhtml = "123" + i;
                }
                console.log(table.rows[i].cells[4]);
                for (var j = 0, col; col = table.rows[i].cells[j]; j++) {

                }
            }
        });
    </script>

    <script>
        $(function () {
            $("#example1").DataTable({
                //"dom": 'Qfrtip',
                //"dom": 'Pfrtip',
                "responsive": true,
                "autoWidth": false,
                "ordering": false,
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
