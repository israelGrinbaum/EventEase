<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="eventsHall.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Registration Page</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="adminManage/fontawesome/fontawesome-free-6.2.1-web/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="adminManage/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="adminManage/dist/css/adminlte.min.css">
</head>
<body class="hold-transition register-page">
    <div class="register-box">

        <div class="card">
        <div class="card-body register-card-body">
            <p class="login-box-msg">רשום משתמש חדש</p>
            <form id="form1" runat="server">
                <div class="input-group mb-3">
                    <asp:TextBox ID="txtUname" runat="server" class="form-control" placeholder="שם מלא"></asp:TextBox>
                    <!--<input type="text" class="form-control" placeholder="Full name">-->
                    <div class="input-group-append">
                    <div class="input-group-text">
                        <span class="fas fa-user"></span>
                    </div>
                    </div>
                </div>
                <div class="input-group mb-3">
                    <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="אימייל" TextMode="Email"></asp:TextBox>
                    <!--<input type="email" class="form-control" placeholder="Email">-->
                    <div class="input-group-append">
                    <div class="input-group-text">
                        <span class="fas fa-envelope"></span>
                    </div>
                    </div>
                </div>
                <asp:Literal ID="ltlNoEmailExist" runat="server" ></asp:Literal>
                <div class="input-group mb-3">
                    <asp:TextBox ID="txtPhone" runat="server" class="form-control" placeholder="טלפון" TextMode="Phone"></asp:TextBox>
                    <!--<input type="password" class="form-control" placeholder="Retype password">-->
                    <div class="input-group-append">
                    <div class="input-group-text">
                        <span class="fas fa-phone"></span>
                    </div>
                    </div>
                </div>
                <div class="input-group mb-3">
                    <asp:TextBox ID="txtPass" runat="server" class="form-control" placeholder="סיסמא" TextMode="Password"></asp:TextBox>
                    <!--<input type="password" class="form-control" placeholder="Password">-->
                    <div class="input-group-append">
                    <div class="input-group-text">
                        <span class="fas fa-lock"></span>
                    </div>
                    </div>
                </div>
                <div class="input-group mb-3">
                    <asp:TextBox ID="txtPass2" runat="server" class="form-control" placeholder="אימות סיסמא" TextMode="Password"></asp:TextBox>
                    <!--<input type="password" class="form-control" placeholder="Retype password">-->
                    <div class="input-group-append">
                    <div class="input-group-text">
                        <span class="fas fa-lock"></span>
                    </div>
                    </div>
                </div>
                <asp:Literal ID="ltlPassNoMatch" runat="server" ></asp:Literal>
                <asp:Literal ID="ltlSuccessReg" runat="server" ></asp:Literal>
                

                <div class="row">
                    <div class="col-8">
                    <!--<div class="icheck-primary">
                        <input type="checkbox" id="agreeTerms" name="terms" value="agree">
                        <label for="agreeTerms">
                        I agree to the <a href="#">terms</a>
                        </label>
                    </div>-->
                    </div>
                    <!-- /.col -->
                    <div class="col-4">
                        <asp:Button ID="btnRegister" runat="server" class="btn btn-primary btn-block" Text="הירשם" OnClick="btnRegister_Click" />
                        <!--<button type="submit" class="btn btn-primary btn-block">Register</button>-->
                    </div>
                    <!-- /.col -->
                </div>

            </form>


            <div class="social-auth-links text-center">
            <p>- או -</p>
            <a href="#" class="btn btn-block btn-primary">
                <i class="fab fa-facebook mr-2"></i>
                הירשם באמצעות Facebook
            </a>
            <a href="#" class="btn btn-block btn-danger">
                <i class="fab fa-google-plus mr-2"></i>
                הירשם באמצעות Google+
            </a>
            </div>

            <a href="login.html" class="text-center">אני כבר משתמש רשום</a>
        </div>
        <!-- /.form-box -->
        </div><!-- /.card -->
    </div>
    <!-- /.register-box -->

    <!-- jQuery -->
    <script src="adminManage/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="adminManage/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="adminManage/dist/js/adminlte.min.js"></script>

</body>
</html>
