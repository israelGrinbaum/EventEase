﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="eventsHall.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Log in</title>

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
        <p class="login-box-msg">כניסה למערכת</p>
        <form id="form1" runat="server">
            <div class="input-group mb-3">
                <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="אימייל"></asp:TextBox>
                <!--<input type="email" class="form-control" placeholder="Email">-->
                <div class="input-group-append">
                <div class="input-group-text">
                    <span class="fas fa-envelope"></span>
                </div>
                </div>
            </div>
            <div class="input-group mb-3">
                <asp:TextBox ID="txtPass" runat="server" TextMode="Password" class="form-control" placeholder="סיסמא"></asp:TextBox>
                <!--<input type="password" class="form-control" placeholder="Password">-->
                <div class="input-group-append">
                <div class="input-group-text">
                    <span class="fas fa-lock"></span>
                </div>
                </div>
            </div>
            <asp:Literal ID="ltlIsNotExist" runat="server" ></asp:Literal>

            <div class="row">
                <div class="col-8">
                <div class="icheck-primary">
                    <input type="checkbox" id="remember">
                    <label for="remember">
                    Remember Me
                    </label>
                </div>
                </div>
                <!-- /.col -->
                <div class="col-4">
                <asp:Button ID="btnLogin" runat="server" Text="הכנס אותי" class="btn btn-primary btn-block" OnClick="btnLogin_Click"/>
                <!--<button type="submit" class="btn btn-primary btn-block">Sign In</button>-->
                </div>
                <!-- /.col -->
            </div>
        </form>


        <div class="social-auth-links text-center mb-3">
            <p>- או -</p>
            <a href="#" class="btn btn-block btn-primary">
              <i class="fab fa-facebook mr-2"></i> היכנס באמצעות Facebook
            </a>
            <a href="#" class="btn btn-block btn-danger">
              <i class="fab fa-google-plus mr-2"></i> היכנס באמצעות Google+
            </a>
        </div>
      <!-- /.social-auth-links -->

        <p class="mb-1">
            <a href="forgot-password.html">שכחתי סיסמא</a>
        </p>
        <p class="mb-0">
            <a href="register.html" class="text-center">הירשם למערכת</a>
        </p>
    </div>
    <!-- /.login-card-body -->
  </div>
</div>

    <!-- jQuery -->
    <script src="adminManage/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="adminManage/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="adminManage/dist/js/adminlte.min.js"></script>

</body>
</html>