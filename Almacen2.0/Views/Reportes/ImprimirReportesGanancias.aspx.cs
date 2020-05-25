using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Almacen2._0.Models;
namespace Almacen2._0.Views.Reportes
{
    public partial class ImprimirReportesGanancias : System.Web.UI.Page
    {
        almacen_avance2Entities1 context = new almacen_avance2Entities1();
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataSource = context.Detalle_venta.ToList();
            GridView1.DataBind();
            
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
    }
}