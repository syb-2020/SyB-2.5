<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Administrador/Administrador.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="Almacen2._0.Views.Administrador.Componentes.Almacen" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Almacen | Juanita</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="../../../bower_components/bootstrap/dist/css/bootstrap.min.css" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../../bower_components/font-awesome/css/font-awesome.min.css" />
    <!-- Ionicons -->
    <link rel="stylesheet" href="../../../bower_components/Ionicons/css/ionicons.min.css" />
    <!-- Theme style -->
    <link rel="stylesheet" href="../../../dist/css/AdminLTE.min.css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="../../../dist/css/skins/_all-skins.min.css" />
    <!-- Morris chart -->
    <link rel="stylesheet" href="../../../bower_components/morris.js/morris.css" />
    <!-- jvectormap -->
    <link rel="stylesheet" href="../../../bower_components/jvectormap/jquery-jvectormap.css" />
    <!-- Date Picker -->
    <link rel="stylesheet"
        href="../../../bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css" />
    <!-- Daterange picker -->
    <link rel="stylesheet" href="../../../bower_components/bootstrap-daterangepicker/daterangepicker.css" />
    <!-- bootstrap wysihtml5 - text editor -->
    <link rel="stylesheet" href="../../../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" />
    <link href="../../../Content/estyle.css" rel="stylesheet" />
    <link rel="stylesheet" href="../../bower_components/Style.css"/>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

    <!-- Google Font -->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="idprincipal" runat="server">

    <!-- Main content -->
    <section class="content">

        <div class="row">
            <div class="col-md-12">

                <!-- Profile Image -->
                <div class="box box-primary" style="border: 1px solid rgba(31, 45, 65, 0.125);">
                    <div class="box-header bg-yellow">
                        <h3 class="text-center text-dark" style="font-size: 1.8rem;
           margin: 0;">Ingresar Productos</h3>
                    </div>
                    <div class="box-body box-profile">

                        <div class="col-md-12">

                            <br />

                            <div class="form-group">
                                <label for="tidproductoagregar">ID Producto</label>
                                <asp:TextBox runat="server" ID="tidproductoagregar" CssClass="form-control"
                                    placeholder="ID Producto">
                                </asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="tnombreproducto">Nombre: </label>
                                <asp:TextBox runat="server" ID="tnombreproducto" CssClass="form-control"
                                    placeholder="Nombre"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="tprecioproducto">Precio: </label>
                                <asp:TextBox runat="server" ID="tprecioproducto" TextMode="Number"
                                    CssClass="form-control" placeholder="Precio">
                                </asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="tstockproducto">Stock: </label>
                                <asp:TextBox runat="server" ID="tstockproducto" TextMode="Number"
                                    CssClass="form-control" placeholder="Stock">
                                </asp:TextBox>
                            </div>
                            <asp:Button runat="server" ID="idaddproducto" OnClick="idaddproducto_Click"
                                CssClass="btn btn-success" Style="margin-bottom: 10px;" Text="Agregar" />
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
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->

                <!-- About Me Box -->

                <!-- /.box -->
            </div>
            <div class="col-md-12">

                <!-- Profile Image -->
                <div class="box box-primary" style="border: 1px solid rgba(31, 45, 65, 0.125);">
                    <div class="box-header bg-yellow">
                        <h3 class="text-center text-dark" style="font-size: 1.8rem;
           margin: 0;">Buscar Productos Almacén</h3>
                    </div>
                    <div class="box-body box-profile">
                        <div class="form-group">
                            <label for="txtDesc">Ingresar Codigo o Nombre del Producto</label>
                            <asp:TextBox ID="txtDesc" type="text" CssClass="form-control" placeholder="Descripcion"
                                runat="server" />
                        </div>
                        <asp:Button ID="btnBuscar" CssClass="btn btn-success" runat="server" Text="Buscar"
                            OnClick="btnBuscar_Click" />


                        <div class="col-md-5">
                            <asp:Panel ID="panel_mensaje" Visible="false" runat="server">
                                <strong>
                                    <asp:Label ID="lbmensaje" runat="server" Text=""></asp:Label>
                                </strong>
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </asp:Panel>
                        </div>
                        <!-- /.nav-tabs-custom -->
                    </div>
                </div>



                <!-- /.box-body -->

                <!-- /.box -->

                <!-- About Me Box -->

                <!-- /.box -->
            </div>
            <div class="col-md-12">

                <!-- Profile Image -->
                <div class="box box-primary" style="border: 1px solid rgba(31, 45, 65, 0.125);">
                    <div class="box-header bg-yellow">
                        <h3 class="text-center text-dark" style="font-size: 1.8rem;
           margin: 0;">Productos </h3>
                    </div>
                    <div class="table-responsive text-center">
                        <asp:GridView ID="GridView1" OnRowCommand="GridView1_RowCommand"
                            CssClass="table table-bordered table-condensed" runat="server" AutoGenerateColumns="false"
                            PageSize="2" AllowPaging="True" AllowCustomPaging="True"
                            OnPageIndexChanging="GridView1_PageIndexChanging">
                            <Columns>
                                <asp:BoundField HeaderStyle-CssClass="text-center" Visible="false"
                                    DataField="id_producto" HeaderText="Id" />
                                <asp:BoundField HeaderStyle-CssClass="text-center" DataField="nombre"
                                    HeaderText="Nombre" />
                                <asp:BoundField HeaderStyle-CssClass="text-center" DataField="precio"
                                    DataFormatString="${0:N0}" HeaderText="Precio" />
                                <asp:BoundField HeaderStyle-CssClass="text-center" DataField="stock"
                                    HeaderText="Stock" />
                                <asp:ButtonField HeaderStyle-CssClass="text-center "
                                    ControlStyle-CssClass="btn btn-success " ButtonType="Link" CommandName="IdVer"
                                    Text="Seleccionar" HeaderText="Ver Producto" />
                                <asp:ButtonField HeaderStyle-CssClass="text-center"
                                    ControlStyle-CssClass="btn btn-danger" ButtonType="Link" CommandName="IdEliminar"
                                    Text="Eliminar" HeaderText="Eliminar Producto" />
                                <asp:ButtonField HeaderStyle-CssClass="text-center"
                                    ControlStyle-CssClass="btn btn-warning center" ButtonType="Link"
                                    CommandName="IdActualizar" Text="Editar" HeaderText="Actualizar Producto" />
                            </Columns>
                            <PagerSettings Mode="NumericFirstLast" PageButtonCount="8" FirstPageText="Primero"
                                LastPageText="Ultimo" />
                            <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />

                            <HeaderStyle CssClass="btn-primary" />
                            <EmptyDataTemplate>
                                <h4 class="text-primary"><strong>No</strong> Existen Datos.</h4>
                            </EmptyDataTemplate>
                        </asp:GridView>

                    </div>
                </div>
            </div>
            <!-- /.col -->

            <!-- /.col -->
        </div>
        <!-- /.row -->

    </section>
    <!-- 
        <section class="content">

        <div class="row">
            <div class="col-md-3">

              
                <div class="box box-primary" style="border: 1px solid rgba(31, 45, 65, 0.125);">
                    <div class="box-header bg-yellow">
                        <div class="col-md-6 col-xl-4">
                            <div class="card mb-3 widget-content bg-arielle-smile">
                                <div class="widget-content-wrapper text-white">
                                    <div class="widget-content-left">
                                        <div class="widget-heading">Clients</div>
                                        <div class="widget-subheading">Total Clients Profit</div>
                                    </div>
                                    <div class="widget-content-right">
                                        <div class="widget-numbers text-white"><span>$ 568</span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    -->
    <!-- /.content -->

</asp:Content>