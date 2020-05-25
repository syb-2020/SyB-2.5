using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Routing;

namespace Almacen2._0
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            RouteTable.Routes.MapPageRoute("login", "login", "~/Inicio.aspx");
            RouteTable.Routes.MapPageRoute("almacen", "almacen", "~/Views/Administrador/Componentes/Inicio.aspx");
            
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Session["login"] = false;
            Session["iduser"] = "";
            Session["nombre"] ="";
            Session["apellido"] = "";
            Session["fecha"] = System.DateTime.Now;
            Session["email"] = "";
            Session["nombre_rol"] = "";
            Session["nombre_Almacen"] = "";
            Session["id_almacen"] = "";
            Session["email2"] = "";
            Session["telefono"] = "";
            Session["id_venta_boleta"] = "";
            Session["num_cliente"] = "";


        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}