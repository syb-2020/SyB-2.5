<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Administrador/Administrador.Master" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="Almacen2._0.Views.Administrador.Componentes.Reportes" %>
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
    
      <!-- Small boxes (Stat box) -->
      <div class="content">
            <div class="row">
				
                <div class="col-md-4">

                    <!-- Profile Image -->
                    <div class="box box-primary" style="border: 1px solid rgba(31, 45, 65, 0.125);">
                         <div class="box-header bg-yellow">
                        <h3 class="text-center text-dark" style="font-size: 1.8rem;
           margin: 0;">Reportes</h3>
                    </div>
                        <div class="box-body box-profile">              
        <!-- ./col -->
        
        <!-- ./col -->
        
        <!-- ./col -->
        
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3></h3>

              <p>Reporte Ganancias</p>
            </div>
            <div class="icon">
                <i class="glyphicon glyphicon-list-alt"></i>
            </div>
            <a href="../../Reportes/ImprimirReportesGanancias.aspx" target="_blank" class="small-box-footer">Imprimir <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        

 
                  
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3></h3>

              <p>Reporte de Ventas</p>
            </div>
            <div class="icon">
              <i class="glyphicon glyphicon-list-alt"></i>
            </div>
            <a href="../../Reportes/ImprimirReportesVentas.aspx" target="_blank" class="small-box-footer">Imprimir <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        
</div></div></div>

    
				
                <div class="col-md-4">

                    <!-- Profile Image -->
                    <div class="box box-primary" style="border: 1px solid rgba(31, 45, 65, 0.125);">
                        <div class="box-header bg-yellow">
                        <h3 class="text-center text-dark" style="font-size: 1.8rem;
           margin: 0;" >Carga de Archivos</h3>
                    </div>
                        <div class="box-body box-profile">
           <div class="col-md-4" style="top:5px">
    
           <br />
            <asp:FileUpload ID="FileUpload1" runat="server" />
           <br />
        <asp:Label ID="UploadDetails" runat="server" Text=""></asp:Label>

        <br />
        <asp:Button ID="btnSubirArchivo" class="btn btn-info" runat="server" Text="Subir Archivo" 
            onclick="btnSubirArchivo_Click"  />
           <asp:RegularExpressionValidator 
             id="RegularExpressionValidator1" runat="server" 
             ErrorMessage="Solo pdf, doc o xls son permitidos." 
             ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.pdf|.doc|.docx|xls)$" 
             ControlToValidate="FileUpload1">
        </asp:RegularExpressionValidator>
        <br />
        
        <br />       
    </div>          
          </div></div></div>

				
                <div class="col-md-4">

                    <!-- Profile Image -->
                    <div class="box box-primary" style="border: 1px solid rgba(31, 45, 65, 0.125);">
                        <div class="box-header bg-yellow">
                        <h3 class="text-center text-dark" style="font-size: 1.8rem;
           margin: 0;">Archivos Subidos Al Sistema</h3>
                    </div>
                        <div class="box-body box-profile"> 
                            <asp:GridView ID="GridView1" runat="server" CssClass="table1 table table-responsive text-center" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#333333" GridLines="None" onrowdeleting="GridView1_RowDeleting" DataKeyNames="Name">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
               <asp:TemplateField HeaderText="Eliminar" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:ImageButton ID="imgEliminar" runat="server" CommandName="Delete"  ImageUrl="../../imagenes/delete.png" Width="24px" Height="24px"/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nombre Archivo">
                    <ItemTemplate>
                        <asp:HyperLink ID="nombre" runat="server" NavigateUrl='<%# Eval("Name", "~/files/{0}") %>'
                            Text='<%# Eval("Name") %>'>
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Length" HeaderText="Tamaño" />
                <asp:TemplateField HeaderText="Descargar" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:HyperLink ID="descarga" runat="server" NavigateUrl='<%# Eval("Name", "~/GuardarEnCarpeta/Download.aspx?filename={0}") %>'>
                               <img src="../../imagenes/download.gif" alt=""  style="border-width:0px; width:30px; height:30px" />
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>

                             </div></div></div></div></div>
        <!-- ./col -->

      <!-- /.row -->
      <!-- Main row -->
      <!-- /.row (main row) -->

    
</asp:Content>

