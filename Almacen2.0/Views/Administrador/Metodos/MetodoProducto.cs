using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Almacen2._0.Models;

namespace Almacen2._0.Views.Administrador
{
    public class MetodoProducto
    {
        almacen_avance2Entities1 context = new almacen_avance2Entities1();

        //Se crea la lista para traer los productos y poder tomar la cantidad de ellos para la paginacion
        public List<Producto> GetPaginacion (int starIndex, int maxRows, string desc)
        {
            var result = (from oc in context.Producto where oc.nombre.Contains(desc) select oc).OrderBy(p => p.id_producto).Skip((starIndex - 1) * maxRows).Take(maxRows);
            
            //ordeBy: Ordena los productos en orden numerico < a >
            //Skip: Tomar un orden especifico para irme al primer o segundo registro de la tabla.
            //Take: Trae la cantidad de registros por pagina (maxRows trae la cantidad).
            return result.ToList();
            
        }
      

        //acá se trae la cantidad de registro de la lista
        public int GetPaginacionCount (string desc)
        {
            return context.Producto.Count(p => p.nombre.Contains(desc));            
        }
        
    }
}