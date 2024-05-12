<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="eventsHall.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>AdminLTE 3 | Registration Page</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="adminManage/fontawesome/fontawesome-free-6.2.1-web/css/all.min.css" />
    <!-- icheck bootstrap -->
    <link rel="stylesheet" href="adminManage/plugins/icheck-bootstrap/icheck-bootstrap.min.css" />
    <!-- Theme style -->
    <link rel="stylesheet" href="adminManage/dist/css/adminlte.min.css" />
    <style>
        .warning-massege {
            padding-right: 12px;
            font-size: 15px;
            color: #dc3545;
            margin-bottom: 0px;
            min-inline-size: -webkit-fill-available;
        }
    </style>
</head>
<body class="hold-transition register-page">
    <div hidden="hidden">
        <p class="warning-massege warningMassegeNumber">יש להזין ערך מספרי</p>
        <p class="warning-massege warningMassegeRequired">שדה חובה, יש להזין ערך</p>
    </div>
    <div class="register-box">

        <div class="card">
            <div class="card-body register-card-body">
                <p class="login-box-msg">הרשמה לאתר</p>
                <form id="form1" runat="server">
                    <div class="input-group mb-3">
                        <asp:TextBox ID="txtUname" runat="server" class="form-control Required" placeholder="שם מלא"></asp:TextBox>
                        <!--<input type="text" class="form-control" placeholder="Full name">-->
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-user"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <asp:TextBox ID="txtEmail" runat="server" class="form-control Required" placeholder="אימייל" TextMode="Email"></asp:TextBox>
                        <!--<input type="email" class="form-control" placeholder="Email">-->
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-envelope"></span>
                            </div>
                        </div>
                    </div>
                    <asp:Literal ID="ltlNoEmailExist" runat="server"></asp:Literal>
                    <div class="input-group mb-3">
                        <asp:TextBox ID="txtPhone" runat="server" class="form-control Required" placeholder="טלפון"></asp:TextBox>
                        <!--<input type="password" class="form-control" placeholder="Retype password">-->
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-phone"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <asp:TextBox ID="txtPass" runat="server" class="form-control Required" placeholder="סיסמא" TextMode="Password"></asp:TextBox>
                        <!--<input type="password" class="form-control" placeholder="Password">-->
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <asp:TextBox ID="txtPass2" runat="server" class="form-control Required" placeholder="אימות סיסמא" TextMode="Password"></asp:TextBox>
                        <!--<input type="password" class="form-control" placeholder="Retype password">-->
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                    </div>
                    <asp:Literal ID="ltlPassNoMatch" runat="server"></asp:Literal>
                    <asp:Literal ID="ltlSuccessReg" runat="server"></asp:Literal>


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
                        <div class="col-12">
                            <asp:Button ID="btnRegister" runat="server" class="btn btn-primary btn-block" Text="הירשם" OnClick="btnRegister_Click" />
                            <!--<button type="submit" class="btn btn-primary btn-block">Register</button>-->
                        </div>
                        <!-- /.col -->
                    </div>

                </form>


                <!--<div class="social-auth-links text-center">
                    <p>- או -</p>
                    <a href="#" class="btn btn-block btn-primary">
                        <i class="fab fa-facebook mr-2"></i>
                        הירשם באמצעות Facebook
                    </a>
                    <a href="#" class="btn btn-block btn-danger">
                        <i class="fab fa-google-plus mr-2"></i>
                        הירשם באמצעות Google+
                    </a>
                </div>-->
                <div style="margin-top: 10px;">
                    כבר יש לך חשבון? 
                    <a href="login.aspx" class="btn-link text-center">להתחברות</a>
                </div>
            </div>
            <!-- /.form-box -->
        </div>
        <!-- /.card -->
    </div>
    <!-- /.register-box -->

    <!-- jQuery -->
    <script src="adminManage/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="adminManage/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="adminManage/dist/js/adminlte.min.js"></script>
    <script src="js/dataVerification.js"></script>
</body>
</html>
