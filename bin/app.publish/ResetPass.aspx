<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPass.aspx.cs" Inherits="eventsHall.ResetPass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Forgot Password</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="adminManage/fontawesome/fontawesome-free-6.2.1-web/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="adminManage/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="adminManage/dist/css/adminlte.min.css">
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="../../index2.html"><b>Admin</b>LTE</a>
  </div>
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">
      <p class="login-box-msg">אימות סיסמא.</p>

      <form action="recover-password.html" method="post">
        <div class="input-group mb-3">
            <asp:TextBox ID="txtPass" runat="server" class="form-control" placeholder="נא הזן סיסמא"></asp:TextBox>
<%--          <input type="email" class="form-control" placeholder="Email">--%>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
            <asp:TextBox ID="txtPass2" runat="server" class="form-control" placeholder="נא הזן אימות סיסמא"></asp:TextBox>
<%--          <input type="email" class="form-control" placeholder="Email">--%>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
          <asp:Literal ID="msgError" runat="server" Visible="false">אימות לא תואם</asp:Literal>
        <div class="row">
          <div class="col-12">
              <asp:Button ID="btnReset" runat="server" Text="אפס סיסמא" class="btn btn-primary btn-block" OnClick="btnReset_Click" />
<%--            <button type="submit" class="btn btn-primary btn-block">Request new password</button>--%>
          </div>
          <!-- /.col -->
        </div>
      </form>

      <p class="mt-3 mb-1">
        <a href="login.html">Login</a>
      </p>
      <p class="mb-0">
        <a href="register.html" class="text-center">Register a new membership</a>
      </p>
    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->

<!-- jQuery -->
<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>


    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>
