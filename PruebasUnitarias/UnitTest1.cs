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
            //Organizar/Inicializa  inicializa los objetos y establece los valores de los datos que vamos a utilizar en el Test que lo contiene.
            string email = "guille@gmail.cl";
            string clave = "1234";

            // Actuar realiza la llamada al método a probar con los parámetros preparados para tal fin.
            IniciarSesion servicio = new IniciarSesion();
            var result = servicio.GetValidacionUser(email,clave);

            // Confirmar/Comprobar comprueba que el método de pruebas ejecutado se comporta tal y como teníamos previsto que lo hiciera.
            Assert.IsTrue(result);
        }

        [TestMethod]
        public void TestMetodoBuscarProductoyCrearCarro()
        {
            //Organizar/Inicializa  inicializa los objetos y establece los valores de los datos que vamos a utilizar en el Test que lo contiene.
            string codigo = "123";
            string cantidad = "10";
            //string descuento = "10";     

            // Actuar realiza la llamada al método a probar con los parámetros preparados para tal fin.
            MetodoGenerarVenta servicio = new MetodoGenerarVenta();
            var result1 = servicio.idbuscar_Click1(codigo,cantidad);

            // Confirmar/Comprobar comprueba que el método de pruebas ejecutado se comporta tal y como teníamos previsto que lo hiciera.
            Assert.IsTrue(result1);
       
        }
        [TestMethod]
        public void TestMetodoAddClienteAddTipoPagoAddVentaAddDetalleVenta()
        {
            //Organizar/Inicializa  inicializa los objetos y establece los valores de los datos que vamos a utilizar en el Test que lo contiene.
            //string descuento = "10";
            int nuCliente = +1;
            string tipopago = "Efectivo";

            // Actuar realiza la llamada al método a probar con los parámetros preparados para tal fin.
            MetodoGenerarVenta servicio = new MetodoGenerarVenta();
            var result2 = servicio.agregarVenta_Click(nuCliente, tipopago);

            // Confirmar/Comprobar comprueba que el método de pruebas ejecutado se comporta tal y como teníamos previsto que lo hiciera.
            Assert.IsTrue(result2);
        }
    }

}
