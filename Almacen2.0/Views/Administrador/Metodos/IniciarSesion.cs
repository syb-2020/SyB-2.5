using Almacen2._0.Models;
using System;
using System.Collections.Generic;
using System.Linq;


namespace Almacen2._0.Views.Administrador.Metodos
{
    public class IniciarSesion
    {
        //almacen_avance2Entities1 contexto2 = new almacen_avance2Entities1();

        public string email_valid = "mario@gmail.cl";
        public string clave_valid = "1234";

        //public List<Usuario> buscarUsuario(string email, string clave)
        //{            
        //    var result = from user in contexto2.Usuario where user.email.Equals(email) && user.clave.Equals(clave) select user;
        //    return result.ToList();                                
        //}

        public bool GetValidacionUser(string email, string clave)
        {
            var resultado = false;

            if (!string.IsNullOrEmpty(email) && !string.IsNullOrEmpty(clave))
            {
                string correo = email;
                string pass = clave;
                List<Usuario> Usuariotest = new List<Usuario>();
                Usuariotest.Add(new Usuario
                {
                    email = "guille@gmail.cl",
                    clave = "1234",
                    nombre = "Guillermo",
                    apellido = "Fuentes",
                    direccion = "23 norte 5 oriente",
                    numero_telefonico = "990034265",
                    id_rol = 1
                });
                var result = from u in Usuariotest
                             where u.email.Equals(correo) && u.clave.Equals(pass)
                             select new
                             {
                                 u.id_usuario,
                                 u.email,
                                 u.clave,
                                 u.nombre,
                                 u.apellido,
                                 u.direccion,
                                 u.numero_telefonico,
                                 u.id_rol
                             };
                try
                {
                    int idRol = result.First().id_rol;
                    int idUser = result.First().id_usuario;
                    string user = result.First().nombre + " " + result.First().apellido;

                    if (idRol == 1)
                    {
                        //es administrador
                        resultado = true;
                    }
                    else if (idRol == 2)
                    {
                        //es trabajador
                        resultado = true;
                    }                    
                }
                catch
                {
                    //no existe el usuario
                    resultado = false;
                }
            }
            else
            {
                //no existe el usuario
                resultado = false;
            }

            //retorna el resultado
            return resultado;
        }

        //public string GetValidacionUser(string email, string clave)
        //{
        //    if (!string.IsNullOrEmpty(email) && !string.IsNullOrEmpty(clave))
        //    {
        //        string correo = email;
        //        string pass = clave;
        //        List<Usuario> Usuariotest = new List<Usuario>();
        //        Usuariotest.Add(new Usuario
        //        {
        //            email = "guille@gmail.cl",
        //            clave = "1234",
        //            nombre = "Guillermo",
        //            apellido = "Fuentes",
        //            direccion = "23 norte 5 oriente",
        //            numero_telefonico = "990034265",
        //            id_rol = 1
        //        });
        //        var result = from u in Usuariotest
        //                     where u.id_rol == 1 && u.email.Equals(correo) && u.clave.Equals(pass)
        //                     select new
        //                     {
        //                         u.id_usuario,
        //                         u.email,
        //                         u.clave,
        //                         u.nombre,
        //                         u.apellido,
        //                         u.direccion,
        //                         u.numero_telefonico,
        //                         u.id_rol
        //                     };
        //        try
        //        {
        //            int idRol = result.First().id_rol;
        //            int idUser = result.First().id_usuario;
        //            string user = result.First().nombre + " " + result.First().apellido;

        //            if (idRol == 1)
        //            {
        //                Response.Redirect("/Views/Administrador/Componentes/Paneldecontrol.aspx");
        //                return "Usuario Registrado";
        //            }
        //            else if (idRol == 2)
        //            {
        //                Response.Redirect("/Views/Trabajador/Componentes/Paneldecontrol.aspx");
        //                return "Usuario Registrado";
        //            }
        //            return "Usuario Registrado";
        //        }
        //        catch
        //        {
        //            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Login()", true);
        //            return "Usuario No Registrado";
        //        }
        //    }
        //    else
        //    {
        //        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "FaltanCampos()", true);
        //        return "Faltan Datos";
        //    }
        //}        
    }
}