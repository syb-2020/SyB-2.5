using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Almacen2._0.Models;
using Almacen2._0.Views.Administrador;


namespace Almacen2._0.Views.Administrador.Componentes
{
    public partial class Almacen : System.Web.UI.Page
    {
        almacen_avance2Entities1 context = new almacen_avance2Entities1();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                //GridView1.DataSource = context.Producto.ToList();
                //GridView1.DataBind();
                GridView1.VirtualItemCount = Count();
                CargarData(1, 2);

            };
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
        
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            CargarData(e.NewPageIndex + 1, 2);
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            GridView1.VirtualItemCount = Count();
            CargarData(1, 2);                       
        }

        
        protected void idaddproducto_Click(object sender, EventArgs e)
        {
            try
            {
                Producto nuevo = new Producto { id_producto = Convert.ToInt32(tidproductoagregar.Text), nombre = tnombreproducto.Text, precio = Convert.ToInt32(tprecioproducto.Text), stock = Convert.ToInt32(tstockproducto.Text) };

                context.Producto.Add(nuevo);
                context.SaveChanges();

                tidproductoagregar.Text = "";
                tnombreproducto.Text = "";
                tprecioproducto.Text = "";
                tstockproducto.Text = "";

                Alerta.Visible = true;
                Alerta.CssClass = "alert alert-success";
                lbAlerta.Text = "Producto Agregado ";

                GridView1.DataSource = context.Producto.ToList();
                GridView1.DataBind();
            }
            catch (Exception)
            {
                Alerta.Visible = true;
                Alerta.CssClass = "alert alert-danger";
                lbAlerta.Text = "Producto NO! Agregado ";
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

                
                var id3 = from c in context.Producto
                              where c.nombre.Equals(nombre)
                              select new { c.id_producto };
                int id4 = id3.ToList()[0].id_producto;

                tidproductoagregar.Text = id4.ToString();
                tnombreproducto.Text = nombre.ToString();
                tprecioproducto.Text = precio.ToString();
                tstockproducto.Text = stock.ToString();
            }

            if (e.CommandName.Equals("IdEliminar"))
            {
                string nombre = "";
                nombre = GridView1.Rows[filaSeleccionada].Cells[1].Text;

                Producto nuevo = new Producto();
               

                var listNombre = from litpr in context.Producto
                                 where litpr.nombre.StartsWith(nombre)
                                 select litpr;
                int id = listNombre.ToList()[0].id_producto;

                context.Producto.Remove(context.Producto.Find(id));
                context.SaveChanges();
                panel_mensaje.Visible = true;
                panel_mensaje.CssClass = "alert alert-success";
                lbmensaje.Text = "Producto Eliminado!!";
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
                   
                    nuevo2 = context.Producto.Find(Convert.ToInt32(id2));
                    nuevo2.nombre = tnombreproducto.Text;
                    nuevo2.precio = Convert.ToInt32(tprecioproducto.Text);
                    nuevo2.stock = Convert.ToInt32(tstockproducto.Text);
                    context.SaveChanges();
                    panel_mensaje.Visible = true;
                    panel_mensaje.CssClass = "alert alert-success";
                    lbmensaje.Text = "Producto Editado!!";
                    
                                      
                    GridView1.DataSource = context.Producto.ToList();
                    GridView1.DataBind();
                    

                }
                catch (Exception)
                {
                    panel_mensaje.Visible = true;
                    panel_mensaje.CssClass = "alert alert-success";
                    lbmensaje.Text = "Error, Producto no actualizado";          
                    
                    
                }
                
            }

        }

        
    }
}