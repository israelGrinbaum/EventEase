<%@ Page Title="" Language="C#" MasterPageFile="~/adminManage/main.Master" AutoEventWireup="true" CodeBehind="hallsList.aspx.cs" Inherits="eventsHall.adminManage.hallsList" %>

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
        .my-container {
            position: relative;
            width: 200px;
        }

        .image {
            opacity: 1;
            display: block;
            width: 100%;
            height: auto;
            transition: .5s ease;
            backface-visibility: hidden;
        }

        .middle {
            transition: .5s ease;
            opacity: 0;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            -ms-transform: translate(-50%, -50%);
            text-align: center;
        }

        .my-container:hover .image {
            opacity: 0.7;
        }

        .my-container:hover .middle {
            opacity: 1;
        }

        .text {
            color: white;
            font-size: 16px;
            padding: 8px 16px;
        }

        .show {
            display: contents;
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
                            <h3 class="card-title">אולמות <a href="addUpdateHall.aspx" class="btn btn-primary">הוסף אולם</a>  <a href="portionCatList.aspx?format=excel" class="btn btn-success"><i class="fa-solid fa-file-excel"></i></a></h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <div id="pics" style="position: relative; width: 100%; background-color: aquamarine; height: auto; opacity: 1; ">
                                
                  <asp:Repeater ID="RPTpics" runat="server" OnItemDataBound="RPTpics_ItemDataBound">
                      <ItemTemplate>
                          <asp:Literal ID="ltlPics" runat="server">

                          </asp:Literal>
                      </ItemTemplate>
                  </asp:Repeater>
                            </div>
                            <a href="#" class="btn btn-app" onclick="hiddpics()" style="display:none;"></a>

                            <table id="example1" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>קוד אולם</th>
                                        <th>שם אולם</th>
                                        <th>תכולה</th>
                                        <th>תמונות</th>
                                        <th>מיקום</th>
                                        <th>מחיר</th>
                                        <th>ערוך</th>
                                        <th>מחק</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="RPTHalls" runat="server" OnItemDataBound="RPTHalls_ItemDataBound">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%# Eval("Hid") %></td>
                                                <td><%# Eval("Hname") %></td>
                                                <td><%# Eval("containing") %></td>
                                                <td>
                                                    <div class="my-container">
                                                        <img src="/uploads/pics/halls/<%# Eval("pics").ToString().IndexOf('@')!=-1? Eval("pics").ToString().Substring(1,Eval("pics").ToString().IndexOf('@')):Eval("pics") %>" class="image" />
                                                        <div class="middle">
                                                            <a href="#" class="text btn btn-info" onclick="showPics(<%# Eval("Hid") %>)">להצגת כל התמונות
                                                            </a>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td><%# Eval("location") %></td>
                                                <td><%# Eval("price") %></td>
                                                <td><a href="addUpdateHall.aspx?Hid=<%# Eval("Hid") %>" class="btn btn-primary"><i class="fa-solid fa-pen-to-square"></i></a></td>
                                                <td><a href="#" class="btn btn-danger" onclick="if(confirm('האם אתה בטוח?')) window.location='addUpdateHall.aspx?Hid=<%# Eval("Hid") %>&op=del'"><i class="fa-solid fa-trash-alt"></i></a></td>
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
        function hiddpics() {
            document.getElementById("pics").style.display = "flex";
        }
        function showPics(Hid) {
            document.getElementById(Hid).style.display = "flex";
        }
        function hiddPics(Hid) {
            document.getElementById(Hid).style.display = "none";
        }
    </script>
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
