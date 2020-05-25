<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Administrador/Administrador.Master" AutoEventWireup="true" CodeBehind="Paneldecontrol.aspx.cs" Inherits="Almacen2._0.Views.Administrador.Componentes.Paneldecontrol" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <meta charset="utf-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Almacen | Juanita</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="../../../bower_components/bootstrap/dist/css/bootstrap.min.css"/>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../../bower_components/font-awesome/css/font-awesome.min.css"/>
  <!-- Ionicons -->
  <link rel="stylesheet" href="../../../bower_components/Ionicons/css/ionicons.min.css"/>
  <!-- Theme style -->
  <link rel="stylesheet" href="../../../dist/css/AdminLTE.min.css"/>
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="../../../dist/css/skins/_all-skins.min.css"/>
  <!-- Morris chart -->
  <link rel="stylesheet" href="../../../bower_components/morris.js/morris.css"/>
  <!-- jvectormap -->
  <link rel="stylesheet" href="../../../bower_components/jvectormap/jquery-jvectormap.css"/>
  <!-- Date Picker -->
  <link rel="stylesheet" href="../../../bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css"/>
  <!-- Daterange picker -->
  <link rel="stylesheet" href="../../../bower_components/bootstrap-daterangepicker/daterangepicker.css"/>
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="../../../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css"/>

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic"/>
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="idprincipal" runat="server">
    <section class="content">
      <!-- Small boxes (Stat box) -->
      <div class="row" style="height: 400px">
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3></h3>

              <p>Productos Almacén</p>
            </div>
            <div class="icon">
              <i class="glyphicon glyphicon-home"></i>
            </div>
            <a href="Almacen.aspx" class="small-box-footer">Mas información <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>        
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3><sup style="font-size: 20px"></sup></h3>

              <p>Reportes</p>
            </div>
            <div class="icon">
              <i class="glyphicon glyphicon-list-alt"></i>
            </div>
            <a href="Reportes.aspx" class="small-box-footer">Mas información <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3></h3>

              <p>Usuarios</p>
            </div>
            <div class="icon">
              <i class="glyphicon glyphicon-user"></i>
            </div>
            <a href="Usuarios.aspx" class="small-box-footer">Mas información <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3></h3>

              <p>Camaras</p>
            </div>
            <div class="icon">
                <i class="glyphicon glyphicon-facetime-video"></i>
            </div>
            <a href="Camaras.aspx" class="small-box-footer">Mas información <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
                  <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3></h3>

              <p>Generar Venta</p>
            </div>
            <div class="icon">
              <i class="glyphicon glyphicon-shopping-cart"></i>
            </div>
            <a href="Generarventa.aspx" class="small-box-footer">Mas información <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
          

        <!-- ./col -->
      </div>
      <!-- /.row -->
      <!-- Main row -->
      <!-- /.row (main row) -->

    </section>
</asp:Content>
