//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Almacen2._0.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Reportes
    {
        public int id_reporte { get; set; }
        public Nullable<System.DateTime> fecha { get; set; }
        public string descripción { get; set; }
        public int id_usuario { get; set; }
        public int id_venta { get; set; }
        public int id_almacen { get; set; }
    
        public virtual Almacen Almacen { get; set; }
        public virtual Usuario Usuario { get; set; }
        public virtual Venta Venta { get; set; }
    }
}
