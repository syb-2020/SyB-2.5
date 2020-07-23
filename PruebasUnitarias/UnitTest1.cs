using System;
using Almacen2._0.Pagina;
using Almacen2._0.Views.Administrador.Metodos;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace PruebasUnitarias
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMetodoIniciarSesion()
        {
            string email = "guille@gmail.cl";
            string clave = "1234";

            IniciarSesion servicio = new IniciarSesion();
            var result = servicio.GetValidacionUser(email,clave);

            Assert.IsTrue(result);
        }

        [TestMethod]
        public void TestMetodoGenerarVenta()
        {
            string codigo = "123";
            string cantidad = "10";
            //string descuento = "10";
            string nuCliente = "1";
            string tipopago = "Efectivo";            

            MetodoGenerarVenta servicio = new MetodoGenerarVenta();

            var result1 = servicio.idbuscar_Click1( codigo,cantidad);
        }
    }

}
