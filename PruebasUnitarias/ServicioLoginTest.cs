using System;
using System.Collections.Generic;
using System.Linq;
using Almacen2._0.Models;
using Almacen2._0.Pagina;
using Almacen2._0.Views.Administrador.Metodos;
using Microsoft.EntityFrameworkCore;
using Microsoft.VisualStudio.TestTools.UnitTesting;



namespace PruebasUnitarias
{ 
    [TestClass]
    public class ServicioLoginTest
    {                
        [TestMethod]
        public void PruebaMetodoIniciarSesion()
        {
            //preparacion
            
            string email = "@gmail.cl";
            string clave = "1234";

            IniciarSesion servicio2 = new IniciarSesion();

            //ejecucion
            //var result2 = servicio2.buscarUsuario(email, clave);
            //var result4 = servicio2.buscarUsuario(email, clave);

            

            var result2 = servicio2.GetValidacionUser(email,clave);


            //respuesta
            Assert.IsTrue(result2);

        }
    }
}
