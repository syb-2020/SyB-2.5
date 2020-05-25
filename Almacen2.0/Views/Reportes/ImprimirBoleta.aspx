<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImprimirBoleta.aspx.cs" Inherits="Almacen2._0.Views.Reportes.ImprimirReporte" %>

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
            <i class="fa fa-globe"></i> Almacén <%=Session["nombre_Almacen"]%>.
            <small class="pull-right"></small>
          </h2>
        </div>
        <!-- /.col -->
      </div>
      <!-- info row -->
      <div class="row invoice-info">        
        <div class="col-sm-4 invoice-col">
          <h4><b><%=Session["nombre_Almacen"]%></b></h4>
            <h4><b>Direccion 23 norte 5 oriente D</b></h4>
          <h4><b>Correo <%=Session["email2"]%></b></h4>
          <h4><b>Telefono +56<%=Session["telefono"]%></b></h4> 
          <h4><b>N° Cliente: <%=Session["num_cliente"]%></b></h4> <br/> <br /><br />
            ************************************************************************************************************************************
                 
            <h4><b><%=Session["fecha"]%></b></h4>
            <br />

        </div>
        <!-- /.col -->
      </div>
        <div class="row">
        <!-- accepted payments column -->
       <div class="col-sm-8">       
          <div class="table-responsive">
            <table class="table">
              <tbody>
              <tr>
                <th><h4>Descripcion</h4></th>
                <td><h4><asp:TextBox ID="txtdescri" CssClass="form-control" runat="server"></asp:TextBox></h4></td><br />
              </tr>
            </tbody></table>
          </div>
        </div>
      <!-- /.row -->

      <!-- Table row -->
      <div class="row">
        <div class="col-xs-12 table-responsive">          
            <asp:GridView ID="GridView1" OnRowCommand="GridView1_RowCommand" CssClass="table1 table table-responsive" runat="server" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField HeaderStyle-CssClass="text-center" DataField="id_detalle" HeaderText="Id" />
                        <asp:BoundField HeaderStyle-CssClass="text-center" DataField="precio_venta" HeaderText="Total" />
                        <asp:BoundField HeaderStyle-CssClass="text-center" DataField="id_producto"  HeaderText="Id producto" />
                        <asp:BoundField HeaderStyle-CssClass="text-center" DataField="id_venta" HeaderText="Id venta" />        
                        <asp:BoundField HeaderStyle-CssClass="text-center" DataField="Cliente.descripcion" HeaderText="productos y pago" />  
                        <asp:BoundField HeaderStyle-CssClass="text-center" DataField="id_tipo_pago" HeaderText="Id Pago" />  
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
                  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
            <br /><br />
        <div class="col-sm-8">       
          <div class="table-responsive">
            <table class="table">
              <tbody><tr>
                <th style="width:50%"><h4>Total:</h4></th>
                <td><asp:TextBox ID="txttotal" CssClass="form-control" style="text-align:right" runat="server"></asp:TextBox></td>
              </tr>              
            </tbody></table>
          </div>
        </div>
        <!-- /.col -->
      </div>
            <br />
            <br />
      <!-- /.row -->
                 
        <div class="center-block"  style="align-content:center; text-align:center"><br /><br /><br />
          <h4><b>Atendido por <%=Session["nombre"]%></b></h4><br />
            <h4><b>Gracias Por Su Compra!!!</b></h4>
          <h4><b>NO VALIDA COMO BOLETA</b></h4>
            <h4><b>USO INTERNO VENDEDOR</b></h4>
          
         
            

        </div>
        <!-- /.col -->
      <!-- this row will not appear when printing -->
     
    </section>
    </form>
</body>
</html>
