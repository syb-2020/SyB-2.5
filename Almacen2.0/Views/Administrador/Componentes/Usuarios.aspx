<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Administrador/Administrador.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="Almacen2._0.Views.Administrador.Componentes.Usuarios" %>
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
     <!-- estilos de animación banner-->
        <link rel="stylesheet" type="text/css" href="../../bower_components/Style.css"/>

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
    <script>                       
        window.setTimeout(function () {
            $(".Alerta").fadeTo(500, 0).slideUp(500, function () {
                $(this).remove();
            });
        }, 5000);
    </script>
  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic"/>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="idprincipal" runat="server">
    <div class="content">
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

            <div class="col-md-12" style="margin-right: 0px; margin-left: 0px;">

                <!-- Profile Image -->
                <div class="box box-primary " style="border: 1px solid rgba(31, 45, 65, 0.125);">
                    <div class="box-header bg-yellow">
                        <h3 class="text-center text-dark" style="font-size: 1.8rem; margin: 0;">Crear Trabajador</h3>
                    </div>
                    <div class="box-body box-profile">
                        <div class="form-group">
                            <label for="temail">Correo Electronico: </label>
                            <asp:TextBox runat="server" ID="temail" CssClass="form-control" placeholder="Correo Electronico"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="El campo es obligatorio" ForeColor="red" ControlToValidate="temail" Display="Dynamic"
                                ValidationGroup="add2"> </asp:RequiredFieldValidator>

                        </div>

                        <div class="form-group">
                            <label for="tclave">Contraseña: </label>
                            <asp:TextBox runat="server" ID="tclave" TextMode="Password" CssClass="form-control" placeholder="Contraseña"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="El campo es obligatorio" ForeColor="red" ControlToValidate="tclave" Display="Dynamic"
                                ValidationGroup="add2"> </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="tnombre">Nombre: </label>
                            <asp:TextBox runat="server" ID="tnombre" CssClass="form-control" placeholder="Nombre"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="El campo es obligatorio" ForeColor="red" ControlToValidate="tnombre" Display="Dynamic"
                                ValidationGroup="add2"> </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group">
                            <label for="tapellido">Apellido: </label>
                            <asp:TextBox runat="server" ID="tapellido" CssClass="form-control" placeholder="Apellido"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="El campo es obligatorio" ForeColor="red" ControlToValidate="tapellido" Display="Dynamic"
                                ValidationGroup="add2"> </asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group">
                            <label for="tdireccion">Direccion: </label>
                            <asp:TextBox runat="server" ID="tdireccion" CssClass="form-control" placeholder="Direccion"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="El campo es obligatorio" ForeColor="red" ControlToValidate="tdireccion" Display="Dynamic"
                                ValidationGroup="add2"> </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="ttelefono">Numero Telefonico: </label>
                            <asp:TextBox runat="server" ID="ttelefono" CssClass="form-control" placeholder="Numero Telefonico"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="El campo es obligatorio" ForeColor="red" ControlToValidate="ttelefono" Display="Dynamic"
                                ValidationGroup="add2"> </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="idrol">Rol</label>
                            <asp:DropDownList runat="server" ID="idrol" CssClass="form-control" DataTextField="nombre" DataValueField="id_rol"></asp:DropDownList>
                        </div>

                        <asp:Button runat="server" ID="idAdd" ValidationGroup="add2" CssClass="btn btn-lg btn-success center-block" OnClick="idAdd_Click" Text="Agregar Usuario" />                        

                    </div>

                </div>

            </div>




            <div class="col-md-12">

                <!-- Profile Image -->
                <div class="box box-primary " style="border: 1px solid rgba(31, 45, 65, 0.125);">
                    <div class="box-header bg-yellow">
                        <h3 class="text-center text-dark" style="font-size: 1.8rem; margin: 0;">Buscar Trabajador</h3>
                    </div>
                    <div class="box-body box-profile">
                        <div class="form-group">
                            <label for="t_id_usuario">Nombre Usuario: </label>
                            <div class="col-md-12">
                                <asp:TextBox runat="server" ID="t_id_usuario" CssClass="form-control" Style="margin-bottom: 10px;"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="El campo es obligatorio" ForeColor="red" ControlToValidate="t_id_usuario" Display="Dynamic"
                                    ValidationGroup="add"> </asp:RequiredFieldValidator>                                
                            </div>
                            <div class="input-group-prepend text-center">
                                    <asp:Button runat="server" ID="idbuscar" ValidationGroup="add" ToolTip="Ingrese Nombre para Buscar" CssClass="btn btn-lg btn-info " OnClick="idbuscar_Click"  Text="Buscar" />
                                    <asp:Button runat="server" ID="idEdit" ValidationGroup="add2"  ToolTip="Ingresar Id para Editar" CssClass="btn btn-lg btn-warning " OnClick="idEdit_Click"  Text="Editar" />
                                    <asp:Button runat="server" ID="idDelete" ValidationGroup="add" ToolTip="Ingrese Id para Eliminar" CssClass=" btn btn-lg btn-danger" OnClick="idDelete_Click"  Text="Eliminar" />
                             </div>
                            <br />                            
                        </div>                        
                        <div class="table-responsive text-center">
                            <asp:GridView runat="server" ID="idtablatrabajador" OnRowCommand="idtablatrabajador_RowCommand" CssClass="table table-bordered table-condensed">
                                <HeaderStyle CssClass="btn-primary" />

                                <Columns>
                                </Columns>
                                <EmptyDataTemplate>
                                    <h4 class="text-primary"><strong>Buscar</strong>Usuario</h4>
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
 
</asp:Content>
