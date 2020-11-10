﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Administrador/Administrador.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="Almacen2._0.Views.Administrador.Componentes.Almacen" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Almacen | Juanita</title>
     <!--Cargamos el Script para las Alertas-->


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

        <!--Cargamos el Script para las Alertas-->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>


    <!-- estilos de animación banner-->
        <link rel="stylesheet" type="text/css" href="../../../bower_components/Style.css"/>
    <style>  
            .msg {
                    position: relative;
                    float: right;
                    width: 40%;
                    clear: both;
                    margin-top: -56px;                   
             }            
           .gear {
               float: left;
               font-size: 30px;
               animation-name: rotate-gear;
               animation-duration: 2s;
               animation-iteration-count: infinite;
               animation-timing-function: linear;
           }

           @keyframes rotate-gear {
               from {
                   transform: rotateZ(0deg);
               }

               to {
                   transform: rotateZ(360deg);
               }
           }

           #logotipo:hover .gear{
               animation: fromBellow 500ms linear;
           }

           @keyframes fromBellow {
               0% {
                   transform: translateY(0%);
               }

               50% {
                   transform: translateY(200%);
               }

               100% {
                   transform: translateY(0%);
               }
           }
       </style>
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
        <div class="msg">
                <asp:Panel ID="Alerta" runat="server" Visible="false">
                <strong role="alert">
                    <asp:Label ID="lbAlerta" runat="server" Text=""></asp:Label>
                </strong>
                <button type="button" id="msg" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </asp:Panel>
        </div>
        <div class="row" style="margin-right: 0px; margin-left: 0px;">
            <div class="col-md-12">

                <!-- Profile Image -->
                <div class="box box-primary" style="border: 1px solid rgba(31, 45, 65, 0.125);">
                    <div class="box-header bg-yellow">
                        <h3 class="text-center text-dark" style="font-size: 1.8rem;
           margin: 0;">Ingresar Productos</h3>
                    </div>
                    <div class="box-body box-profile">

                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="tidproductoagregar">Código Producto</label>
                                <asp:TextBox runat="server" ID="tidproductoagregar" CssClass="form-control"
                                    placeholder="Código Producto">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="El campo es obligatorio" ForeColor="red" ControlToValidate="tidproductoagregar" Display="Dynamic"
                                    ValidationGroup="add2"> </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Ingrese solo numeros" ForeColor="red" Display="Dynamic" ControlToValidate="tidproductoagregar" ValidationExpression="^[0-9]+$" ValidationGroup="add2"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <label for="tnombreproducto">Nombre Producto: </label>
                                <asp:TextBox runat="server" ID="tnombreproducto" CssClass="form-control"
                                    placeholder="Nombre Producto"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="El campo es obligatorio" ForeColor="red" ControlToValidate="tnombreproducto" Display="Dynamic"
                                    ValidationGroup="add2"> </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Ingrese solo letras" ForeColor="red" Display="Dynamic" ControlToValidate="tnombreproducto" ValidationExpression="^[a-zA-Z\s]+$" ValidationGroup="add2"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <label for="tprecioproducto">Precio Producto: </label>
                                <asp:TextBox runat="server" ID="tprecioproducto" TextMode="Number"
                                    CssClass="form-control" placeholder="Precio Producto">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="El campo es obligatorio" ForeColor="red" ControlToValidate="tprecioproducto" Display="Dynamic"
                                    ValidationGroup="add2"> </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Ingrese solo numeros" ForeColor="red" Display="Dynamic" ControlToValidate="tprecioproducto" ValidationExpression="^[0-9]+$" ValidationGroup="add2"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <label for="tstockproducto">Stock Producto: </label>
                                <asp:TextBox runat="server" ID="tstockproducto" TextMode="Number"
                                    CssClass="form-control" placeholder="Stock Producto">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="El campo es obligatorio" ForeColor="red" ControlToValidate="tstockproducto" Display="Dynamic"
                                    ValidationGroup="add2"> </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Ingrese solo numeros" ForeColor="red" Display="Dynamic" ControlToValidate="tstockproducto" ValidationExpression="^[0-9]+$" ValidationGroup="add2"></asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <label for="tdescripcion">Descripcion: </label>
                                <asp:TextBox runat="server" ID="tdescripcion" CssClass="form-control"
                                    placeholder="Descripcion"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="El campo es obligatorio" ForeColor="red" ControlToValidate="tdescripcion" Display="Dynamic"
                                    ValidationGroup="add2"> </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator12" runat="server" ErrorMessage="Ingrese solo letras" ForeColor="red" Display="Dynamic" ControlToValidate="tdescripcion" ValidationExpression="^[a-zA-Z\s]+$" ValidationGroup="add2"></asp:RegularExpressionValidator>
                            </div>     
                             <div class="form-group">
                                <label for="idcategoria">Categoria</label>
                                <asp:DropDownList runat="server" ID="idcategoria" CssClass="form-control" DataTextField="nombre" DataValueField="id_categoria"></asp:DropDownList>
                            </div>
                            <asp:Button runat="server" ID="idaddproducto" ValidationGroup="add2" OnClick="idaddproducto_Click"
                                CssClass="btn btn-lg btn-success center-block"  Text="Agregar Producto" />                            
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
                        <h3 class="text-center text-dark" style="font-size: 1.8rem; margin: 0;">Buscar Productos Almacén</h3>
                    </div>
                    <div class="box-body box-profile">
                        <div class="form-group">
                            <label for="txtDesc">Ingresar Código o Nombre del Producto</label>
                            <asp:TextBox ID="txtDesc" type="text" CssClass="form-control" placeholder="Código o Nombre"
                                runat="server" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="El campo es obligatorio" ForeColor="red" ControlToValidate="txtDesc" Display="Dynamic"
                                    ValidationGroup="add3"> </asp:RequiredFieldValidator>
                        </div>
                        <asp:Button ID="btnBuscar" CssClass="btn btn-lg btn-info     center-block" ValidationGroup="add3" runat="server" Text="Buscar"
                            OnClick="btnBuscar_Click" />
                        
                        <div class="col-md-5">                           
                        </div>
                        <!-- /.nav-tabs-custom -->
                    </div>
                </div>
            </div>
            

            <div class="col-md-12">               
                <!-- Profile Image -->
                <div class="box box-primary" style="border: 1px solid rgba(31, 45, 65, 0.125);">
                    <div class="box-header bg-yellow">
                        <h3 class="text-center text-dark" style="font-size: 1.8rem; margin: 0px;">Productos </h3>
                    </div>
                    <div class="table-responsive text-center">
                        <asp:GridView ID="GridView1" OnRowCommand="GridView1_RowCommand"
                            CssClass="table table-bordered table-condensed" runat="server" AutoGenerateColumns="false" PageSize="2"
                            AllowPaging="True" AllowCustomPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging">
                            <Columns>
                                <asp:BoundField HeaderStyle-CssClass="text-center" Visible="false" DataField="id_producto"
                                    HeaderText="Id" />
                                <asp:BoundField HeaderStyle-CssClass="text-center" DataField="nombre" HeaderText="Nombre" />                                 
                                <asp:BoundField HeaderStyle-CssClass="text-center" DataField="precio" DataFormatString="${0:N0}"
                                    HeaderText="Precio" />
                                <asp:BoundField HeaderStyle-CssClass="text-center" DataField="stock" HeaderText="Stock" />                             
                                <asp:BoundField HeaderStyle-CssClass="text-center" ItemStyle-BackColor="#009933" ItemStyle-ForeColor="white" DataField="estado" HeaderText="Estado" />
                                 
                                <asp:ButtonField HeaderStyle-CssClass="text-center " ControlStyle-CssClass="btn btn-success "
                                    ButtonType="Link" CommandName="IdVer" Text="Seleccionar" HeaderText="Ver Producto" />
                                <asp:ButtonField HeaderStyle-CssClass="text-center" ControlStyle-CssClass="btn btn-danger"
                                    ButtonType="Link" CommandName="IdEliminar" Text="Eliminar" HeaderText="Eliminar Producto" />
                                <asp:ButtonField HeaderStyle-CssClass="text-center"  ControlStyle-CssClass="btn btn-warning center"
                                    ButtonType="Link" CommandName="IdActualizar" Text="Editar" HeaderText="Actualizar Producto" />
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
    
</asp:Content>

