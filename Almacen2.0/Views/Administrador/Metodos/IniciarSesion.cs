using Almacen2._0.Models;
using System;
using System.Collections.Generic;
using System.Linq;


namespace Almacen2._0.Views.Administrador.Metodos
{
    public class IniciarSesion
    {
        almacen_avance2Entities1 contexto2 = new almacen_avance2Entities1();

        public string email_valid = "mario@gmail.cl";
        public string clave_valid = "1234";

        //public List<Usuario> buscarUsuario(string email, string clave)
        //{            
        //    var result = from user in contexto2.Usuario where user.email.Equals(email) && user.clave.Equals(clave) select user;
        //    return result.ToList();                                
        //}

        public bool GetValidacionUser(string email2, string clave)
        {
            var validar = false;

            if (email_valid.Equals(email2) && clave_valid.Equals(clave))
            {
                validar = true;
            }

            return validar;
        }
    }
}