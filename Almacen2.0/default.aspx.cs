using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Almacen2._0.Models;
using Almacen2._0.Views.Administrador.Metodos;

namespace Almacen2._0.Pagina
{
    public partial class Login : System.Web.UI.Page
    {
        almacen_avance2Entities1 context = new almacen_avance2Entities1();

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");           
        }

        public void inicio_Click(object sender, EventArgs e)
        {
            try
            {
                string email = txtemail.Text;
                string clave = txtpassword.Text;




                var result = from c in context.Usuario
                             where c.clave.Equals(clave) && c.email.Equals(email)
                             select new { c.id_rol, c.id_usuario, c.nombre, c.apellido };

                //var result = new IniciarSesion().buscarUsuario(email,clave);

                if (result.ToList().Count ==0 )
                {
                    panel_mensaje.Visible = true;
                    panel_mensaje.CssClass = "alert alert-danger";
                    lbmensaje.Text = "Usuario no valido";                                   
                }
                else
                {
                    //int test2 = new IniciarSesion().validacion(2);

                    int usuario_rol = result.ToList()[0].id_rol;
                    int usuario_id = result.ToList()[0].id_usuario;
                    string nombre5 = result.ToList()[0].nombre;
                    string apellido = result.ToList()[0].apellido;

                    var nombre2 = from c in context.Rol
                                  where c.id_rol.Equals(usuario_rol)
                                  select new { c.nombre };

                    string nombre3 = nombre2.ToList()[0].nombre;

                    var nombre6 = from c in context.Almacen select new { c.id_almacen, c.nombre, c.email, c.telefono};
                    int id_almacen = nombre6.ToList()[0].id_almacen;
                    string nombre = nombre6.ToList()[0].nombre;
                    string email2 = nombre6.ToList()[0].email;
                    int telefono = nombre6.ToList()[0].telefono;
                    Session["nombre_Almacen"] = nombre;
                    Session["id_almacen"] = id_almacen;
                    Session["email2"] = email2;
                    Session["telefono"] = telefono;

                    Session["login"] = true;
                    Session["iduser"] = usuario_id;
                    Session["nombre"] = nombre5;
                    Session["apellido"] = apellido;
                    Session["email"] = email;
                    Session["nombre_rol"] = nombre3;
                    
                                        

                    if (usuario_rol == 1)
                    {                        

                        Response.Redirect("/Views/Administrador/Componentes/Paneldecontrol.aspx");
                    }
                    if (usuario_rol == 2)
                    {

                        Response.Redirect("/Views/Trabajador/Componentes/Paneldecontrol.aspx");
                    }
                    
                    Session.Timeout = 30;

                }


            }
            catch (Exception)
            {
                throw;
                
            }

        }
        
    }
}