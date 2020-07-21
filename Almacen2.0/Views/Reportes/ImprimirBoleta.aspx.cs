using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Almacen2._0.Models;
namespace Almacen2._0.Views.Reportes
{
    public partial class ImprimirReporte : System.Web.UI.Page
    {
        almacen_avance2Entities1 context = new almacen_avance2Entities1();
        
        protected void Page_Load(object sender, EventArgs e)
        {

            // GridView1.DataSource = context.Detalle_venta.ToList();
            //GridView1.DataBind();
            int id_venta2 = Convert.ToInt32(Session["id_venta_boleta"]);
            int num_clie2 = Convert.ToInt32(Session["num_cliente"]);
            foreach (var item in context.Detalle_venta.ToList())
            {
                if (id_venta2 == item.id_venta)
                {
                    txttotal.Text = Convert.ToString(item.precio_venta);

                    var result = from c in context.Cliente where c.numero_cliente.Equals(num_clie2) select new{ c.descripcion};
                    string descrip = result.ToList()[0].descripcion;

                    txtdescri.Text = descrip.Replace("\r\n", "\r\n");
                }
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
    }
}