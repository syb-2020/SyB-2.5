<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Administrador/Administrador.Master" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="Almacen2._0.Views.Administrador.Componentes.Reportes" %>

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
    <link rel="stylesheet" href="../../../bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css" />
    <!-- Daterange picker -->
    <link rel="stylesheet" href="../../../bower_components/bootstrap-daterangepicker/daterangepicker.css" />
    <!-- bootstrap wysihtml5 - text editor -->
    <link rel="stylesheet" href="../../../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" />

     <!-- estilos de animación banner-->
        <link rel="stylesheet" type="text/css" href="../../bower_components/Style.css"/>
    <style>         
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
   <!--Primer Grafico-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load("current", { packages: ["corechart"] });
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Task', 'Hours per Day'],
                ['Bebidas', 11],
                ['Cecinas', 6],
                ['Aseo', 4],
                ['Frutas y Verduras', 9],
                ['Pan', 7]
            ]);

            var options = {
                title: 'Principales productos vendidos en el almacén',
                is3D: true,
            };

            var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
            chart.draw(data, options);
        }
    </script>


    <!--Segundo Grafico-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', { 'packages': ['bar'] });
        google.charts.setOnLoadCallback(drawStuff);

        function drawStuff() {
            var data = new google.visualization.arrayToDataTable([
                ['Día', 'Cantidad de ventas'],
                ["Lunes", 44],
                ["Martes", 22],
                ["Miércoles", 26],
                ["Jueves", 37],
                ['Viernes', 48]
            ]);

            var options = {
                title: 'Chess opening moves',
                width: 900,
                legend: { position: 'none' },
                chart: {
                    title: 'Cantidad de ventas por día',
                    subtitle: ''
                },
                bars: 'horizontal', // Required for Material Bar Charts.
                axes: {
                    x: {
                        0: { side: 'top', label: 'Cantidad de ventas' } // Top x-axis.
                    }
                },
                bar: { groupWidth: "90%" }
            };

            var chart = new google.charts.Bar(document.getElementById('top_x_div'));
            chart.draw(data, options);
        };
    </script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
    

    <!--Tercer Grafico-->
     <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', { packages: ['corechart', 'bar'] });
        google.charts.setOnLoadCallback(drawBasic);
        function drawBasic() {

            var data = new google.visualization.DataTable();
            data.addColumn('timeofday', 'Time of Day');
            data.addColumn('number', 'Motivation Level');

            data.addRows([
                [{ v: [8, 0, 0], f: '8 am' }, 1],
                [{ v: [9, 0, 0], f: '9 am' }, 2],
                [{ v: [10, 0, 0], f: '10 am' }, 3],
                [{ v: [11, 0, 0], f: '11 am' }, 4],
                [{ v: [12, 0, 0], f: '12 pm' }, 5],
                [{ v: [13, 0, 0], f: '1 pm' }, 6],
                [{ v: [14, 0, 0], f: '2 pm' }, 7],
                [{ v: [15, 0, 0], f: '3 pm' }, 8],
                [{ v: [16, 0, 0], f: '4 pm' }, 9],
                [{ v: [17, 0, 0], f: '5 pm' }, 10],
            ]);

            var options = {
                title: 'Nivel de motivación de los trabajadores a través del día',
                hAxis: {
                    title: 'Hora del día',
                    format: 'h:mm a',
                    viewWindow: {
                        min: [7, 30, 0],
                        max: [17, 30, 0]
                    }
                },
                vAxis: {
                    title: 'Clasificación (escala de 1-10)'
                }
            };

            var chart = new google.visualization.ColumnChart(
                document.getElementById('chart_div'));

            chart.draw(data, options);
        }
    </script>

    <!--Cuarto Grafico Grafico-->
     <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', { packages: ['corechart', 'bar'] });
        google.charts.setOnLoadCallback(drawBasic);
        function drawBasic() {

            var data = new google.visualization.DataTable();
            data.addColumn('timeofday', 'Hora del día');
            data.addColumn('number', 'Cantidad de ventas');

            data.addRows([
                [{ v: [8, 0, 0], f: '8 am' }, 7],
                [{ v: [9, 0, 0], f: '9 am' }, 5],
                [{ v: [10, 0, 0], f: '10 am' }, 4],
                [{ v: [11, 0, 0], f: '11 am' }, 4],
                [{ v: [12, 0, 0], f: '12 am' }, 8],
                [{ v: [13, 0, 0], f: '1 pm' }, 6],
                [{ v: [14, 0, 0], f: '2 pm' }, 7],
                [{ v: [15, 0, 0], f: '3 pm' }, 9],
                [{ v: [16, 0, 0], f: '4 pm' }, 10],
                [{ v: [17, 0, 0], f: '5 pm' }, 8],
            ]);

            var options = {
                title: 'Cantidad de ventas en el día',
                hAxis: {
                    title: 'Hora del día',
                    format: 'h:mm a',
                    viewWindow: {
                        min: [7, 30, 0],
                        max: [17, 30, 0]
                    }
                },
                vAxis: {
                    title: 'Cantidad de ventas'
                }
            };

            var chart = new google.visualization.ColumnChart(
                document.getElementById('chart_div2'));

            chart.draw(data, options);
        }
    </script>

    <!--Quinto Grafico-->
    <script type="text/javascript">
        google.charts.load('current', { packages: ['corechart', 'bar'] });
        google.charts.setOnLoadCallback(drawBasic);
        function drawBasic() {

            var data = new google.visualization.DataTable();
            data.addColumn('timeofday', 'Time of Day');
            data.addColumn('number', 'Motivation Level');

            data.addRows([
                [{ v: [8, 0, 0], f: '8 am' }, 1],
                [{ v: [9, 0, 0], f: '9 am' }, 2],
                [{ v: [10, 0, 0], f: '10 am' }, 3],
                [{ v: [11, 0, 0], f: '11 am' }, 4],
                [{ v: [12, 0, 0], f: '12 pm' }, 5],
                [{ v: [13, 0, 0], f: '1 pm' }, 6],
                [{ v: [14, 0, 0], f: '2 pm' }, 7],
                [{ v: [15, 0, 0], f: '3 pm' }, 8],
                [{ v: [16, 0, 0], f: '4 pm' }, 9],
                [{ v: [17, 0, 0], f: '5 pm' }, 10],
            ]);

            var options = {
                title: 'Motivation Level Throughout the Day',
                hAxis: {
                    title: 'Time of Day',
                    format: 'h:mm a',
                    viewWindow: {
                        min: [7, 30, 0],
                        max: [17, 30, 0]
                    }
                },
                vAxis: {
                    title: 'Rating (scale of 1-10)'
                }
            };

            var chart = new google.visualization.ColumnChart(
                document.getElementById('chart_div3'));

            chart.draw(data, options);
        }
    </script>



    <script type="text/javascript">

</script>

    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic" />
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="idprincipal" runat="server">

    <!-- Small boxes (Stat box) -->
    <div class="content">
        <div class="row" style="margin-right: 0px; margin-left: 0px;">

            <div class="col-md-4">

                <!-- Profile Image -->
                <div class="box box-primary" style="border: 1px solid rgba(31, 45, 65, 0.125);">
                    <div class="box-header bg-yellow">
                        <h3 class="text-center text-dark" style="font-size: 1.8rem; margin: 0;">Reportes</h3>
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

                    </div>
                </div>
            </div>


            <div class="col-md-4">

                <!-- Profile Image -->
                <div class="box box-primary" style="border: 1px solid rgba(31, 45, 65, 0.125);">
                    <div class="box-header bg-yellow">
                        <h3 class="text-center text-dark" style="font-size: 1.8rem; margin: 0;">Carga de Archivos</h3>
                    </div>
                    <div class="box-body box-profile">
                        <div class="col-md-4" style="top: 5px">

                            <br />
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                            <br />
                            <asp:Label ID="UploadDetails" runat="server" Text=""></asp:Label>

                            <br />
                            <asp:Button ID="btnSubirArchivo" class="btn btn-info" runat="server" Text="Subir Archivo"
                                OnClick="btnSubirArchivo_Click" />
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator1" runat="server"
                                ErrorMessage="Solo pdf, doc o xls son permitidos."
                                ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.pdf|.doc|.docx|xls)$"
                                ControlToValidate="FileUpload1">
                            </asp:RegularExpressionValidator>
                            <br />

                            <br />
                        </div>
                    </div>
                </div>
            </div>


            <div class="col-md-4">

                <!-- Profile Image -->
                <div class="box box-primary" style="border: 1px solid rgba(31, 45, 65, 0.125);">
                    <div class="box-header bg-yellow">
                        <h3 class="text-center text-dark" style="font-size: 1.8rem; margin: 0;">Archivos Subidos Al Sistema</h3>
                    </div>
                    <div class="box-body box-profile">
                        <asp:GridView ID="GridView1" runat="server" CssClass="table1 table table-responsive text-center" AutoGenerateColumns="False" CellPadding="4"
                            ForeColor="#333333" GridLines="None" OnRowDeleting="GridView1_RowDeleting" DataKeyNames="Name">
                            <RowStyle BackColor="#EFF3FB" />
                            <Columns>
                                <asp:TemplateField HeaderText="Eliminar" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgEliminar" runat="server" CommandName="Delete" ImageUrl="../../imagenes/delete.png" Width="24px" Height="24px" />
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

                    </div>
                </div>
            </div>

            <%-- Primer grafico --%>
            <div class="col-md-6">
                <!-- Line chart -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <i class="fa fa-bar-chart-o"></i>

                        <h3 class="box-title">Categorías de productos más vendidos en el almacén</h3>

                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                <i class="fa fa-minus"></i>
                            </button>
                            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                        </div>
                    </div>
                    <div class="box-body">
                        <div id="piechart_3d" style="width: auto; height: 300px;"></div>
                    </div>
                    <!-- /.box-body-->
                </div>
                <!-- /.box -->

                <!-- Area chart -->

                <!-- /.box -->

            </div>

            <%-- Tercer Grafico --%>
            <div class="col-md-6">
                <!-- Line chart -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <i class="fa fa-bar-chart-o"></i>

                        <h3 class="box-title">Nivel de motivación de los trabajadores</h3>

                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                <i class="fa fa-minus"></i>
                            </button>
                            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                        </div>
                    </div>
                    <div class="box-body">                        
                        <div id="chart_div" style="width: auto; height: 300px;"></div>
                    </div>
                    <!-- /.box-body-->
                </div>
                <!-- /.box -->

                <!-- Area chart -->

                <!-- /.box -->

            </div>
           
            <%-- Segundo Grafico --%>
            <div class="col-md-12">
                <!-- Line chart -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <i class="fa fa-bar-chart-o"></i>

                        <h3 class="box-title">Resumen de Ventas por día</h3>

                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                <i class="fa fa-minus"></i>
                            </button>
                            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                        </div>
                    </div>
                    <div class="box-body">
                        <div id="top_x_div" style="width: 450px; height: 300px;"></div>
                    </div>
                    <!-- /.box-body-->
                </div>
                <!-- /.box -->

                <!-- Area chart -->

                <!-- /.box -->

            </div>

            <%-- Cuarto Grafico --%>
            <div class="col-md-6">
                <!-- Line chart -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <i class="fa fa-bar-chart-o"></i>

                        <h3 class="box-title">Resumen de venta Diario</h3>

                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                <i class="fa fa-minus"></i>
                            </button>
                            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                        </div>
                    </div>
                    <div class="box-body">                        
                        <div id="chart_div2" style="width: auto; height: 300px;"></div>
                    </div>
                    <!-- /.box-body-->
                </div>
                <!-- /.box -->

                <!-- Area chart -->

                <!-- /.box -->

            </div>

            <%-- Quinto Grafico --%>
            <div class="col-md-6">
                <!-- Line chart -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <i class="fa fa-bar-chart-o"></i>

                        <h3 class="box-title">Por Definir</h3>

                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                <i class="fa fa-minus"></i>
                            </button>
                            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                        </div>
                    </div>
                    <div class="box-body">                        
                        <div id="chart_div3" style="width: auto; height: 300px;"></div>
                    </div>
                    <!-- /.box-body-->
                </div>
                <!-- /.box -->

                <!-- Area chart -->

                <!-- /.box -->

            </div>

        <!-- /.col -->
        <!-- /.col -->

        
        </div>
    </div>

  <!-- Add the sidebar's background. This div must be placed
 
</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="../../bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="../../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="../../bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../dist/js/demo.js"></script>
<!-- FLOT CHARTS -->
<script src="../../bower_components/Flot/jquery.flot.js"></script>
<!-- FLOT RESIZE PLUGIN - allows the chart to redraw when the window is resized -->
<script src="../../bower_components/Flot/jquery.flot.resize.js"></script>
<!-- FLOT PIE PLUGIN - also used to draw donut charts -->
<script src="../../bower_components/Flot/jquery.flot.pie.js"></script>
<!-- FLOT CATEGORIES PLUGIN - Used to draw bar charts -->
<script src="../../bower_components/Flot/jquery.flot.categories.js"></script>
<!-- Page script -->

        <!-- ./col -->


<!-- ./wrapper -->
  
   
    <!-- /.row -->
    <!-- Main row -->
    <!-- /.row (main row) -->


</asp:Content>

