using System;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Almacen2._0.Models;

namespace Almacen2._0.Views.Administrador.Componentes
{
    public partial class Categorias : System.Web.UI.Page
    {
        almacen_avance2Entities1 context = new almacen_avance2Entities1();
        protected void Page_Load(object sender, EventArgs e)
        {
           
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
        protected void addcategoria_Click(object sender, EventArgs e)
        {
            try
            {
                Categoria nuevo = new Categoria
                {
                    nombre = nombrecategoria.Text,
                    descripcion = descripcioncategoria.Text,                   
                    estado = "activo"
                };

                context.Categoria.Add(nuevo);
                context.SaveChanges();

                mensajeAlertaSuccess(true, "Categoria Agregada ");


                nombrecategoria.Text = "";
                descripcioncategoria.Text = "";              
              
            }
            catch (Exception)
            {
                mensajeAlertaDanger(true, "Error, categoria no agregada ");
            }
        }

        protected void idbuscar_Click(object sender, EventArgs e)
        {

            string buscarnombre = t_id_categoria.Text;

            var listNombre = from litpr in context.Categoria
                             where litpr.nombre.StartsWith(buscarnombre)
                             select litpr;
                      
            if (listNombre.Count() != 0)
            {
                mensajeAlertaSuccess(true, "Categoria Encontrada");
                idtablacategoria.DataSource = listNombre.ToList();
                idtablacategoria.DataBind();
            }
            else
            {
                mensajeAlertaDanger(true, "Error, categoria no agregada");
            }
         
        }

        protected void idEdit_Click(object sender, EventArgs e)
        {
            try
            {
                string buscarnombre = t_id_categoria.Text;

                var listid = from litpr in context.Categoria
                                 where litpr.nombre.StartsWith(buscarnombre)
                                 select new { litpr.id_categoria};

                int id = listid.ToList()[0].id_categoria;

                Categoria users = new Categoria();
                users = context.Categoria.Find(id);
                users.nombre = nombrecategoria.Text;
                users.descripcion = descripcioncategoria.Text;               

                context.SaveChanges();

                mensajeAlertaSuccess(true, "Categoria modificada ");
        

                nombrecategoria.Text = "";
                descripcioncategoria.Text = "";               

            }
            catch (Exception)
            {
                mensajeAlertaDanger(true, "Error, categoria no modificada");
            }
        }

        protected void idDelete_Click(object sender, EventArgs e)
        {
            try
            {
                string buscarnombre = t_id_categoria.Text;

                var listid = from litpr in context.Categoria
                             where litpr.nombre.StartsWith(buscarnombre)
                             select new { litpr.id_categoria };

                int id = listid.ToList()[0].id_categoria;
              
                context.Categoria.Remove(context.Categoria.Find(id));
                context.SaveChanges();

                mensajeAlertaSuccess(true, "Categoria eliminada ");

            }
            catch (Exception)
            {
                mensajeAlertaDanger(true, "Error, categoria no eliminada");
            }
        }

        protected void idtablacategoria_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int filaSeleccionada = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "IdVer")
            {

                string estado = "";
                int id_user;
                int.TryParse(idtablacategoria.Rows[filaSeleccionada].Cells[1].Text, out id_user);





                Categoria users = new Categoria();
                users = context.Categoria.Find(id_user);

                if (users.estado == "activo")
                {
                    users.estado = "inactivo";

                    context.SaveChanges();
                    mensajeAlertaSuccess(true, "Estado Cambiado");

                    var listNombre = from litpr in context.Categoria
                                     where litpr.id_categoria.Equals(users.id_categoria)
                                     select litpr;

                    idtablacategoria.DataSource = listNombre.ToList();
                    idtablacategoria.DataBind();


                }
                else if (users.estado == "inactivo")
                {
                    users.estado = "activo";
                    context.SaveChanges();
                    mensajeAlertaSuccess(true, "Estado Cambiado");



                    var listNombre = from litpr in context.Categoria
                                     where litpr.id_categoria.Equals(users.id_categoria)
                                     select litpr;

                    idtablacategoria.DataSource = listNombre.ToList();
                    idtablacategoria.DataBind();


                }              


            }
        }
    }
}