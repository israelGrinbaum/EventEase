<%@ Page Title="" Language="C#" MasterPageFile="~/adminManage/main.Master" AutoEventWireup="true" CodeBehind="usersList.aspx.cs" Inherits="eventsHall.adminManage.usersList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <link rel="stylesheet" type="text/css" href="DataTables/datatables.min.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainCnt" runat="server">
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">

            <div class="card">
              <div class="card-header primary col-md-6">
                <h3 class="card-title">משתמשים <a href="addUpdateUser.aspx" class="btn btn-primary">הוסף משתמש</a>  <a href="portionCatList.aspx?format=excel" class="btn btn-success"><i class="fa-solid fa-file-excel"></i></a></h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>קוד משתמש</th>
                    <th>שם</th>
                    <th>אימייל</th>
                    <th>טלפון</th>
                    <th>הרשאה</th>
                    <th>תאריך כניסה למערכת</th>
                    <th>ערוך</th>
                    <th>מחק</th>

                  </tr>
                  </thead>
                  <tbody>
                      <asp:Repeater ID="RPTUsers" runat="server">
                          <ItemTemplate>
                                <tr>
                                    <td><%# Eval("Uid") %></td>
                                    <td><%# Eval("Uname") %></td>
                                    <td><%# Eval("email") %></td>
                                    <td><%# Eval("phone") %></td>
                                    <td><%# Eval("permissions") %></td>
                                    <td><%# Eval("insertDate") %></td>
                                    <td><a href="addUpdateUser.aspx?Uid=<%# Eval("Uid") %>" class="btn btn-primary"><i class="fa-solid fa-pen-to-square"></i></a></td>
                                    <td><a href="#" class="btn btn-danger" onclick="if(confirm('האם אתה בטוח?')) window.location='addUpdateUser.aspx?Uid=<%# Eval("Uid") %>&op=del'"><i class="fa-solid fa-trash-alt"></i></a> </td>
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
    <!-- DataTables -->
    <script src="/adminManage/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="/adminManage/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
    <script src="/adminManage/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
    <script src="/adminManage/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
    <script type="text/javascript" src="/adminManage/DataTables/datatables.min.js"></script>

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
