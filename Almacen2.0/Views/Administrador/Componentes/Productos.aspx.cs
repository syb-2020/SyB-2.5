using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Almacen2._0.Models;



namespace Almacen2._0.Views.Administrador.Componentes
{
    public partial class Almacen : System.Web.UI.Page
    {
        almacen_avance2Entities1 context = new almacen_avance2Entities1();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //GridView1.DataSource = context.Producto.ToList();
                //GridView1.DataBind();
                GridView1.VirtualItemCount = Count();
                CargarData(1, 2);

                idcategoria.DataSource = context.Categoria.ToList();
                idcategoria.DataTextField = "nombre";
                idcategoria.DataValueField = "id_categoria";
                idcategoria.DataBind();

            };
        }
        private void mensajeAlertaSuccess(bool estadoAlerta, string mensaje)
        {
            Alerta.Visible = estadoAlerta;
            Alerta.CssClass = "alert alert-success";
            lbAlerta.Text = mensaje;
        }
        private void mensajeAlertaDanger(bool estadoAlerta, string mensaje)
        {
            Alerta.Visible = estadoAlerta;
            Alerta.CssClass = "alert alert-danger";
            lbAlerta.Text = mensaje;
        }
        //se llama al metodo creado para los productos, correspondiente a cargar datos de la lista de productos
        private void CargarData(int starIndex, int maxRows)
        {
            GridView1.DataSource = new MetodoProducto().GetPaginacion(starIndex, maxRows, txtDesc.Text);
            GridView1.DataBind();
        }

        //se crea el metodo Count,
        private int Count()
        {
            var desc = txtDesc.Text;
            return new MetodoProducto().GetPaginacionCount(desc);

        }
        //Carga los datos en un gridview, con contador de paginas
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            CargarData(e.NewPageIndex + 1, 2);
        }
        //Servicio para buscar el producto
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            GridView1.VirtualItemCount = Count();
            CargarData(1, 2);           
            mensajeAlertaSuccess(true, "Producto encontrado");
        }

        //Servicio para poder ingresar un producto en el sistema
        protected void idaddproducto_Click(object sender, EventArgs e)
        {
            try
            {
                Producto nuevo = new Producto { 
                    id_producto = tidproductoagregar.Text, 
                    nombre = tnombreproducto.Text, 
                    precio = Convert.ToInt32(tprecioproducto.Text), 
                    stock = Convert.ToInt32(tstockproducto.Text),
                    descripcion = tdescripcion.Text,
                    estado = "disponible",
                    id_categoria = Convert.ToInt32(idcategoria.SelectedItem.Value)

                };

                context.Producto.Add(nuevo);
                context.SaveChanges();

                tidproductoagregar.Text = "";
                tnombreproducto.Text = "";
                tprecioproducto.Text = "";
                tstockproducto.Text = "";
                
                mensajeAlertaSuccess(true, "Producto Agregado ");


                GridView1.DataSource = context.Producto.ToList();
                GridView1.DataBind();
            }
            catch (Exception)
            {
                mensajeAlertaDanger(true, "Producto NO! Agregado ");               
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int filaSeleccionada = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "IdVer")
            {
                //string id = "";
                string nombre = "";
                int stock = 0;

                //id = GridView1.Rows[filaSeleccionada].Cells[0].Text;
                nombre = GridView1.Rows[filaSeleccionada].Cells[1].Text;
                double precio = 0;
                string[] IngresiFinal = GridView1.Rows[filaSeleccionada].Cells[2].Text.Split('$');
                double.TryParse(IngresiFinal[1], out precio);
                int.TryParse(GridView1.Rows[filaSeleccionada].Cells[3].Text, out stock);

                //consulto por el id del producto a la base de datos y lo guardo en una variable
                var id3 = from c in context.Producto
                          where c.nombre.Equals(nombre)
                          select new { c.id_producto, c.descripcion, c.id_categoria};
                //guardo el id de la variable consultada en un nuevo id tipo string
                string id4 = id3.ToList()[0].id_producto;
                string descrip = id3.ToList()[0].descripcion;
                //Carga la informacion del producto en los siguientes entradas de textos.
                tidproductoagregar.Text = id4.ToString();
                tnombreproducto.Text = nombre.ToString();
                tprecioproducto.Text = precio.ToString();
                tstockproducto.Text = stock.ToString();
                tdescripcion.Text = descrip.ToString();

                //scamos el id de categoria para buscar y cargarla para su posterior editacion
                int id_cate = Convert.ToInt32(id3.ToList()[0].id_categoria);
                var cat1 = from c in context.Categoria
                          where c.id_categoria.Equals(id_cate)
                          select new { c.id_categoria, c.nombre };

                idcategoria.DataSource = cat1.ToList();
                idcategoria.DataTextField = "nombre";
                idcategoria.DataValueField = "id_categoria";
                idcategoria.DataBind();

                mensajeAlertaSuccess(true, "Datos Del Producto Seleccionado");
            }

            if (e.CommandName.Equals("IdEliminar"))
            {
                string nombre = "";
                nombre = GridView1.Rows[filaSeleccionada].Cells[1].Text;

                Producto nuevo = new Producto();


                var listNombre = from litpr in context.Producto
                                 where litpr.nombre.StartsWith(nombre)
                                 select litpr;
                string id = listNombre.ToList()[0].id_producto;

                context.Producto.Remove(context.Producto.Find(id));
                context.SaveChanges();

                mensajeAlertaSuccess(true, "Producto Eliminado");               

                GridView1.DataSource = context.Producto.ToList();
                GridView1.DataBind();
            }
            if (e.CommandName.Equals("IdActualizar"))
            {

                try
                {
                    string id2 = tidproductoagregar.Text;
                    //id2 = GridView1.Rows[filaSeleccionada].Cells[0].Text;

                    Producto nuevo2 = new Producto();

                    var listNombre22 = from litpr in context.Producto
                                     where litpr.id_producto.Equals(id2)
                                     select litpr;
                    string idactualizar = listNombre22.ToList()[0].id_producto;

                    nuevo2 = context.Producto.Find(idactualizar);
                    nuevo2.nombre = tnombreproducto.Text;
                    nuevo2.precio = Convert.ToInt32(tprecioproducto.Text);
                    nuevo2.stock = Convert.ToInt32(tstockproducto.Text);
                    nuevo2.descripcion = tdescripcion.Text;
                    context.SaveChanges();

                    mensajeAlertaSuccess(true, "Producto Editado");                    


                    GridView1.DataSource = context.Producto.ToList();
                    GridView1.DataBind();


                }
                catch (Exception)
                {
                    mensajeAlertaDanger(true, "Error, verifique los campos");                   


                }

            }

        }


    }
}