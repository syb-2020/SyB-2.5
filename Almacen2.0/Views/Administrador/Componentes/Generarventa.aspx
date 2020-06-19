<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Administrador/Administrador.Master" AutoEventWireup="true" CodeBehind="Generarventa.aspx.cs" Inherits="Almacen2._0.Views.Administrador.Componentes.Almacén" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
   <meta charset="utf-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Almacen | Juanita </title>
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
    <link rel="stylesheet" href="../../../bower_components/Style.css"/>
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
<asp:Content ID="Content1" ContentPlaceHolderID="idprincipal" runat="server">

    <div class="content">
        <div class="row">
            <div class="col-md-4">
                <div class="box box-primary" style="border: 1px solid rgba(31, 45, 65, 0.125);">
                    <div class="box-header bg-yellow">
                        <h3 class="text-center text-dark" style="font-size: 1.8rem;
           margin: 0;">Lista de Productos</h3>
                    </div>
                    <div class="box-body box-profile">
                        <div class="table-responsive text-center">
                        <asp:GridView runat="server" ID="gridvmostrarproductoventa" CssClass="table table-bordered table-condensed">
                            <Columns>
                                   
                                </Columns>
                            <HeaderStyle CssClass="btn-primary" />
                        </asp:GridView>
                            </div>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="box box-primary " style="border: 1px solid rgba(31, 45, 65, 0.125);">
                    <div class="box-header bg-yellow">
                        <h3 class="text-center text-dark" style="font-size: 1.8rem;
           margin: 0;">Buscar Producto</h3>
                    </div>
                    <div class="box-body box-profile">

                        <div class="form-group">
                            <label for="tcodigo"><h4>CODIGO:</h4></label>
                            <br />
                            <div class="input-group-1" >
                                <asp:TextBox runat="server" ID="tcodigo" CssClass="form-control" placeholder="Codigo"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="El campo es obligatorio" ForeColor="red" ControlToValidate="tcodigo" Display="Dynamic"
                        ValidationGroup="add"> </asp:RequiredFieldValidator>
                                
                                <div class="input-group-prepend">
                                    <br />
                                    <asp:Button runat="server" ID="idbuscar" ValidationGroup="add" OnClick="idbuscar_Click1" Text="Buscar" CssClass="btn btn-info" />
                                </div>

                            </div>
                            <br />
                            <div class="table-responsive text-center">
                            <asp:GridView runat="server" ID="gridGenerarProducto" OnRowCommand="gridGenerarProducto_RowCommand" CssClass="table table-bordered table-condensed">
                                <HeaderStyle CssClass="btn-primary" />
                                <Columns>
                                    <asp:ButtonField ButtonType="Link" CommandName="idBorrarProducto" ControlStyle-CssClass="btn btn-block btn-danger" Text="-" />
                                </Columns>
                                <EmptyDataTemplate>
                                    <h4 class="text-primary"><strong>El</strong> Carro esta Vacio.</h4>
                                </EmptyDataTemplate>
                            </asp:GridView>
                                </div>
                            <br />

                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="box box-primary" style="border: 1px solid rgba(31, 45, 65, 0.125);">
                    <div class="box-header bg-yellow">
                        <h3 class="text-center text-dark" style="font-size: 1.8rem;
           margin: 0;">Pago</h3>                        
                    </div>
                    <div class="box-body box-profile">

                        <label>Seleccione Metodo De Pago: </label>
                        <br />
                        <div class="input-group mb-4">
                            <div class="input-group-prepend">
                                <asp:DropDownList runat="server" ID="idtipopago" CssClass="form-control" DataTextField="descripcion" DataValueField="id_tipo_pago"></asp:DropDownList>
                                <br />
                            </div>
                        </div>
                        <asp:GridView runat="server" ID="tabladePago">
                            <HeaderStyle CssClass="btn-dark" />
                        </asp:GridView>
                        <br />
                        <label>Precio Total </label>
                        <asp:Button runat="server" ID="mostrarPrecio" CssClass="btn btn-dark" />
                        <br />
                        <br />

                        <asp:Button runat="server" ValidationGroup="add" ID="agregarVenta" OnClick="agregarVenta_Click" Text="Pagar" CssClass="btn btn-success" />
                        <asp:Button runat="server" ID="cancelarVenta" OnClick="cancelarVenta_Click" Text="Cancelar" CssClass="btn btn-danger" />
                        <a href="../../Reportes/ImprimirBoleta.aspx" target="_blank" class="btn btn-default"><i class="fa fa-print"></i>Boleta</a>
                        <asp:Panel ID="Alerta" runat="server" Visible="false">
                            <strong>
                                <asp:Label ID="lbAlerta" runat="server" Text=""></asp:Label>
                            </strong>
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </asp:Panel>
                    </div>
                </div>
            </div>


            <%--<div class="col-md-4" style="margin-left: 250px;  bottom: 170px">
            <label for="tcodigovoucher">Codigo Voucher: </label><br />                
				<div class="input-group mb-2">                     
					<asp:TextBox runat="server" ID="TextBox1" CssClass="form-control" placeholder="Codigo Voucher"></asp:TextBox>                   
				</div>
            </div>--%>
        </div>
    </div>




</asp:Content>
