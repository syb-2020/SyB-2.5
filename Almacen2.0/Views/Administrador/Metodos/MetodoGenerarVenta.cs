using Almacen2._0.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Almacen2._0.Views.Administrador.Metodos
{
    public class MetodoGenerarVenta
    {
		bool resultBuscar = false;
		bool resultDescuento = false;
		bool resultAgregarVenta
		int total = 0;
		List<Producto> carro = new List<Producto>();


		public bool idbuscar_Click1(string codigo, string cantidad)
		{
			if (!string.IsNullOrEmpty(codigo))
			{
				string codigoProd = codigo;

				List<Producto> producto1 = new List<Producto>();
				producto1.Add(new Producto
				{
					id_producto = "123",
					nombre = "papa lays",
					precio = 700,
					stock = 98
				});
				var listProduct = from litpr in producto1
								  where litpr.id_producto.Equals(codigoProd)
								  select litpr;
				Producto producto2 = new Producto();
				producto2 = listProduct.First(p => p.id_producto.Equals(codigoProd));
				try
				{
					if (producto2.stock >= 1)
					{

						agregarCompleto(producto2);
						sumaTotal();
						Thread.Sleep(200);
						producto2.stock = producto2.stock - Convert.ToInt32(cantidad);

						resultBuscar = true;


					}
					else
					{
						resultBuscar = false;
					}
				}
				catch (Exception)
				{
					throw;
				}

			}
			else
			{
				resultBuscar = false;
			}
			return resultBuscar;

		}

		public void agregarCompleto(Producto producto)
		{

			try
			{
				Producto prod_en_carro = new Producto();
				prod_en_carro = carro.First(p => p.id_producto.Equals(producto.id_producto));
				carro[carro.IndexOf(prod_en_carro)].stock += 1;
			}
			catch (Exception)
			{
				carro.Add(new Producto { id_producto = producto.id_producto, nombre = producto.nombre, precio = producto.precio, stock = 1 });
			}
		}

		public void sumaTotal()
		{
			foreach (var item in carro)
			{

				total += item.stock * item.precio;
			}

		}

		public bool descuento(string descuento)
		{
			if (!string.IsNullOrEmpty(descuento))
			{
				double descuento2 = Convert.ToInt32(descuento);
				double porcentaje = (total / 100) * descuento2;
				double total2 = total - porcentaje;

				resultDescuento = true;
			}
			else
			{
				resultDescuento = false;
			}
			return resultDescuento;

		}


		static Cliente nuevoCliente = new Cliente();
		static Pago nuevoPago = new Pago();
		static Venta nuevoVenta = new Venta();
		static Detalle_venta nuevoDetalleVenta = new Detalle_venta();

		public bool agregarVenta_Click(string nuCliente, string tipopago)
		{
			int num_cliente = Convert.ToInt32(nuCliente);
			int idpago = 0;
			int num_venta = 0;

			if (!string.IsNullOrEmpty(nuCliente))
			{
				string detalle = "";
				foreach (var item2 in carro)
				{
					detalle += item2.stock + " " + item2.nombre + "\r\n";

				}
				List<Cliente> ClienteTest = new List<Cliente>();
				ClienteTest.Add(new Cliente
				{
					numero_cliente = num_cliente,
					descripcion = detalle + "\r\n"
				});

				resultAgregarVenta = true;
			}
			else
			{
				resultAgregarVenta = false;
			}


			if (!string.IsNullOrEmpty(tipopago))
			{
				List<Tipo_pago> tip = new List<Tipo_pago>();
				tip.Add(new Tipo_pago
				{
					id_tipo_pago = 1,
					descripcion = "Efectivo"
				});
				tip.Add(new Tipo_pago
				{
					id_tipo_pago = 2,
					descripcion = "Debito"
				});

				var listTipopago = from litpr in tip
								   where litpr.descripcion.Equals(tipopago)
								   select new { idpago };
				nuevoPago = new Pago
				{
					numero_cliente = num_cliente,
					fecha = DateTime.Now,
					id_tipo_pago = Convert.ToInt32(listTipopago)
				};
				idpago = Convert.ToInt32(listTipopago);

				nuevoVenta = new Venta
				{
					id_venta = 1,
					fecha = DateTime.Now,
					numero_cliente = num_cliente,
					id_usuario = 1,
					id_pago = nuevoPago.id_pago
				};

				num_venta = nuevoVenta.id_venta;

				foreach (var item in carro)
				{
					nuevoDetalleVenta.precio_venta = Convert.ToInt32(total);
					nuevoDetalleVenta.id_producto = item.id_producto;
					nuevoDetalleVenta.id_venta = num_venta;

					nuevoDetalleVenta.id_tipo_pago = Convert.ToInt32(idpago);
					nuevoDetalleVenta.numero_cliente = num_cliente;

					resultAgregarVenta = true;

				}

				resultAgregarVenta = true;

			}
			else
			{
				resultAgregarVenta = false;
			}

			return resultAgregarVenta;
		}
	}
}