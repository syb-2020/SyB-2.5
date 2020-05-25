<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImprimirReportesVentas.aspx.cs" Inherits="Almacen2._0.Views.Reportes.ImprimirReportes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
</head>
<body onload="window.print()">
    <form id="form1" runat="server">
        <section class="invoice">
      <!-- title row -->
            <br /><br />
      <div class="row">
        <div class="col-xs-12">
          <h2 class="page-header">
            <i class="fa fa-globe"></i> Reportes Almacén <%=Session["nombre_Almacen"]%>.
            <small class="pull-right"></small>
          </h2>
        </div>
        <!-- /.col -->
      </div>
      <!-- info row -->
      <div class="center-block" style="text-align:center">        
       
          <h5><b>Nombre almacen<%=Session["nombre_Almacen"]%></b></h5>
            <h5><b>Direccion 23 norte 5 oriente D</b></h5>
          <h5><b>Correo <%=Session["email2"]%></b></h5>
          <h5><b>Telefono +56<%=Session["telefono"]%></b></h5> 
          <h5><b><%=Session["fecha"]%></b></h5> <br/> <br /><br />
            <br />

        <!-- /.col -->
      </div>
        <div class="row">
        <!-- accepted payments column -->
       <div class="col-sm-8">       
          <div class="table-responsive">
            <table class="table">
              <tbody>
              <tr>
                <th><h5>Descripcion</h5></th>                
              </tr>
            </tbody></table>
          </div>
        </div>
      <!-- /.row -->

      <!-- Table row -->
      <div class="row">
        <div class="col-xs-10 table-responsive" style="margin-left:25px">          
            <asp:GridView ID="GridView1" OnRowCommand="GridView1_RowCommand" CssClass="table1 table table-responsive" runat="server" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField HeaderStyle-CssClass="text-center" DataField="id_venta" HeaderText="Id venta" />
                        <asp:BoundField HeaderStyle-CssClass="text-center" DataField="fecha" HeaderText="fecha" DataFormatString="{0:dd-MM-yyyy}" />
                        <asp:BoundField HeaderStyle-CssClass="text-center" DataField="numero_cliente"  HeaderText="Cliente" />   
                        <asp:BoundField HeaderStyle-CssClass="text-center" DataField="Usuario.nombre"  HeaderText="Nombre Trabajador" />                        
                        <asp:BoundField HeaderStyle-CssClass="text-center" DataField="Pago.id_tipo_pago" HeaderText="Id Tipo Pago" />  
                    </Columns>
                    <HeaderStyle CssClass="btn-primary" />
                    <EmptyDataTemplate>
                        <h4 class="text-primary"><strong>No</strong> Existen Datos.</h4>
                    </EmptyDataTemplate>
                </asp:GridView>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

      
        <!-- /.col -->
          <br/>
            <br />
                   <br /><br />
            <br /><br />
        
        <!-- /.col -->
      </div>
            <br />
            <br />
      <!-- /.row -->                         
    
    </section>
    </form>
</body>
</html>
