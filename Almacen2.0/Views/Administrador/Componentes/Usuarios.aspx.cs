using System;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Almacen2._0.Models;

namespace Almacen2._0.Views.Administrador.Componentes
{
    public partial class Usuarios : System.Web.UI.Page
    {
        almacen_avance2Entities1 context = new almacen_avance2Entities1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                idrol.DataSource = context.Rol.ToList();
                idrol.DataTextField = "nombre";
                idrol.DataValueField = "id_rol";
                idrol.DataBind();             
            }
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
        protected void idAdd_Click(object sender, EventArgs e)
        {
            try
            {            
                Usuario nuevo = new Usuario
                {
                    email = temail.Text,
                    clave = tclave.Text,
                    nombre = tnombre.Text,
                    apellido = tapellido.Text,
                    direccion = tdireccion.Text,
                    numero_telefonico =ttelefono.Text,
                    id_rol = Convert.ToInt32(idrol.SelectedItem.Value)
                };

                context.Usuario.Add(nuevo);
                context.SaveChanges();

                mensajeAlertaSuccess(true, "Usuario Agregado ");                

                temail.Text = "";
                tclave.Text = "";
                tnombre.Text = "";
                tapellido.Text = "";
                tdireccion.Text = "";
                ttelefono.Text = "";
            }
            catch (Exception)
            {
                mensajeAlertaDanger(true,"Usuario NO! Agregado ");                

            }
        }

        protected void idEdit_Click(object sender, EventArgs e)
        {
            try
            {
                Usuario users = new Usuario();
                users = context.Usuario.Find(Convert.ToInt32(t_id_usuario.Text));
                users.email = temail.Text;
                users.clave = tclave.Text;
                users.nombre = tnombre.Text;
                users.apellido = tapellido.Text;
                users.direccion = tdireccion.Text;
                users.numero_telefonico = ttelefono.Text;
                users.id_rol = Convert.ToInt32(idrol.SelectedItem.Value);


                context.SaveChanges();
               
                mensajeAlertaSuccess(true, "Usuario Modificado ");

                Thread.Sleep(5000);

                temail.Text = "";
                tclave.Text = "";
                tnombre.Text = "";
                tapellido.Text = "";
                tdireccion.Text = "";
                ttelefono.Text = "";

            }
            catch (Exception)
            {              
                mensajeAlertaDanger(true,"Usuario NO! Modificado ");
            }
        }

        protected void idDelete_Click(object sender, EventArgs e)
        {
            try
            {
                Usuario users = new Usuario();
                users.id_usuario = Convert.ToInt32(t_id_usuario.Text);                
                context.Usuario.Remove(context.Usuario.Find(users.id_usuario));
                context.SaveChanges();
              
                mensajeAlertaSuccess(true, "Usuario Eliminado ");
               
            }
            catch (Exception)
            {                
                mensajeAlertaDanger(true, "Usuario NO! Eliminado ");
            }
        }

        protected void idbuscar_Click(object sender, EventArgs e)
        {
            string buscarnombre = t_id_usuario.Text;

            var listNombre = from litpr in context.Usuario
                             where litpr.nombre.StartsWith(buscarnombre)
                             select litpr;

            //temail.Text = users.email;
            //tnombre.Text = users.nombre;
            //tapellido.Text = users.apellido;
            //tdireccion.Text = users.direccion;           

            if (listNombre.Count() != 0)
            {               
                mensajeAlertaSuccess(true, "Usuario Encontrado ");
                idtablatrabajador.DataSource = listNombre.ToList();
                idtablatrabajador.DataBind();
            }
            else
            {                
                mensajeAlertaDanger(true, "Usuario NO! Encontrado ");
            }

            //temail.Text = "";
            //tclave.Text = "";
            //tnombre.Text = "";
            //tapellido.Text = "";
            //tdireccion.Text = "";           
        }

        protected void idtablatrabajador_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
        }
    }
}