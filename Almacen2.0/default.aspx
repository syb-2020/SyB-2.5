<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Almacen2._0.Pagina.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="utf-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <title>Almacen Juanita | SyB</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
  
    <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="../../bower_components/bootstrap/dist/css/bootstrap.min.css"/>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../bower_components/font-awesome/css/font-awesome.min.css"/>
  <!-- Ionicons -->
  <link rel="stylesheet" href="../../bower_components/Ionicons/css/ionicons.min.css"/>
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/AdminLTE.min.css"/>
  <!-- iCheck -->
  <link rel="stylesheet" href="../../plugins/iCheck/square/blue.css"/>
   
    <!-- estilos de animación banner-->
        <link rel="stylesheet" type="text/css" href="../../bower_components/Style.css"/>

    <link rel="icon" type="favicon/x-icon" />

   

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
    <style>
        
        .login-logo a, .register-logo a {
            color: #000;
        }

    </style>
  

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic"/>
</head>
<body class="hold-transition login-page" style="background: url(Img/fondo-3.png);">
    <div class="row" id="banner">
          <h1>Almacén Juanita</h1>
    </div>

<div class="login-box">    
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Iniciar Sesión.</p>

      <form id="form2" runat="server" method="post">
          <div class="form-group has-feedback">

              <asp:TextBox ID="txtemail" type="email" runat="server" CssClass="form-control" placeholder="Email"></asp:TextBox>
              <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="El campo es obligatorio" ForeColor="red" ControlToValidate="txtemail" Display="Dynamic"
                  ValidationGroup="iniciar"> </asp:RequiredFieldValidator>
          </div>
          <div class="form-group has-feedback">

              <asp:TextBox ID="txtpassword" TextMode="Password" runat="server" CssClass="form-control" placeholder="Password"></asp:TextBox>
              <span class="glyphicon glyphicon-lock form-control-feedback"></span>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="El campo es obligatorio" ForeColor="red" ControlToValidate="txtpassword" Display="Dynamic"
                  ValidationGroup="iniciar"> </asp:RequiredFieldValidator>
          </div>
          <div class="row">
              <div class="col-xs-8">
                  <div class="checkbox icheck">
                      <label>
                          <input type="checkbox" />
                          Recuerdame
                      </label>
                  </div>
              </div>
              <!-- /.col -->
              
              <div class="col-xs-4">                                                         
                  <asp:Button ValidationGroup="iniciar" ID="inicio" OnClick="inicio_Click" runat="server" class="btn btn-primary btn-block btn-flat" Text="Entrar" />
              </div>
              <!-- /.col -->
          </div>
          <div>
              <asp:Panel ID="panel_mensaje" Visible="false" runat="server">
                  <strong>
                         <asp:Label ID="lbmensaje" runat="server" Text=""></asp:Label>
                  </strong>
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                         <span aria-hidden="true">&times;</span>
                  </button>
             </asp:Panel>
          </div>
      </form>
    <!-- inicio
    <div class="social-auth-links text-center">
      <p>- OR -</p>
      <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign in using
        Facebook</a>
      <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign in using
        Google+</a>
    </div>
      fin-->
    <!-- /.social-auth-links -->

    <a href="#">Olvide Mi Contraseña</a>

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 3 -->
<script src="../../bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="../../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="../../plugins/iCheck/icheck.min.js"></script>
<script>
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' /* optional */
        });
    });
</script>
</body>
</html>

