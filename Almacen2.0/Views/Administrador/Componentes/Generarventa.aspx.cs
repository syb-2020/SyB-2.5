using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Almacen2._0.Models;
using System.Threading;

namespace Almacen2._0.Views.Administrador.Componentes
{
	public partial class Almacén : System.Web.UI.Page
	{
		static List<Producto> carro = new List<Producto>();

		protected void Page_Load(object sender, EventArgs e)
		{
			using (almacen_avance2Entities1 contexto = new almacen_avance2Entities1()) {
				var mostrarProducto = from pro in contexto.Producto
									  select pro;
				gridvmostrarproductoventa.DataSource = mostrarProducto.ToList();
				gridvmostrarproductoventa.DataBind();


				if (!IsPostBack)
				{

					idtipopago.DataSource = contexto.Tipo_pago.ToList();
					idtipopago.DataTextField = "descripcion";
					idtipopago.DataValueField = "id_tipo_pago";
					idtipopago.DataBind();
				}
			}
			tcodigo.Focus();
			gridGenerarProducto.DataSource = carro;
			gridGenerarProducto.DataBind();



		}

		protected void idbuscar_Click1(object sender, EventArgs e)
		{
			using (almacen_avance2Entities1 contexto = new almacen_avance2Entities1())
			{

				try
				{
					string buscarcodigo = tcodigo.Text;
					int buscarcodigo2 = Convert.ToInt32(buscarcodigo);
					var listProduct = from litpr in contexto.Producto
									  where litpr.id_producto.Equals(buscarcodigo2)
									  select litpr;
					Producto producto = new Producto();
					producto = listProduct.First(p => p.id_producto.Equals(buscarcodigo2));

					if (producto.stock >= 1)
					{

						agregarCompleto(producto);
						sumaTotal();
						Thread.Sleep(200);
						producto.stock = producto.stock - 1;
						contexto.SaveChanges();

						var listaProductoActu = from liActu in contexto.Producto
												select liActu;

						gridvmostrarproductoventa.DataSource = listaProductoActu.ToList();
						gridvmostrarproductoventa.DataBind();


					}
					else
					{
						tcodigo.Text = "";
						tcodigo.Focus();
					}
				}
				catch (Exception)
				{

				}

			}
		}

		private void agregarCompleto(Producto producto) {
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
			finally {
				gridGenerarProducto.DataSource = carro;
				gridGenerarProducto.DataBind();
				tcodigo.Text = "";
				tcodigo.Focus();
			}
		}

		protected void gridGenerarProducto_RowCommand(object sender, GridViewCommandEventArgs e)
		{
			using (almacen_avance2Entities1 contexto = new almacen_avance2Entities1())
			{

				int fila = Convert.ToInt32(e.CommandArgument);
				int cod = Convert.ToInt32(gridGenerarProducto.Rows[fila].Cells[1].Text);


				try
				{

					if (e.CommandName.Equals("idBorrarProducto"))
					{

						Producto prod_en_carro = new Producto();
						prod_en_carro = carro.First(p => p.id_producto.Equals(cod));

						if (prod_en_carro.stock > 0)
						{
							carro[carro.IndexOf(prod_en_carro)].stock -= 1;
							sumaTotal();
							if (prod_en_carro.stock == 0)
							{
								carro.RemoveAll(p => p.id_producto.Equals(cod));
							}

							//aaa
							var listProduct = from litpr in contexto.Producto
											  where litpr.id_producto.Equals(cod)
											  select litpr;
							Producto producto = new Producto();
							producto = listProduct.First(p => p.id_producto.Equals(cod));
							if (producto.stock >= 0)
							{


								Thread.Sleep(200);
								producto.stock = producto.stock + 1;
								contexto.SaveChanges();

								var listaProductoActu = from liActu in contexto.Producto
														select liActu;

								gridvmostrarproductoventa.DataSource = listaProductoActu.ToList();
								gridvmostrarproductoventa.DataBind();


							}
							else
							{
								tcodigo.Text = "";
								tcodigo.Focus();
							}
							//aaaa


						}
						else
						{
							//carro.RemoveAll(p => p.id_producto == cod);

						}
						gridGenerarProducto.DataSource = carro;
						gridGenerarProducto.DataBind();


					}


				}
				catch (Exception)
				{

				}
			}
		}

		private void sumaTotal() {


			int total = 0;

			foreach (var item in carro)
			{

				total += item.stock * item.precio;
			}
			mostrarPrecio.Text = total.ToString();
		}

		protected void cancelarVenta_Click(object sender, EventArgs e)
		{
            if (IsPostBack)
            {
                carro.Clear();
                gridGenerarProducto.DataSource = carro;
                gridGenerarProducto.DataBind();
                tcodigo.Text = "";
                tcodigo.Focus();
                mostrarPrecio.Text = "0";
                Alerta.Visible = true;
                Alerta.CssClass = "alert alert-danger";
                lbAlerta.Text = "Operacion Cancelada ";
            }
        }


		static Cliente nuevoCliente = new Cliente();
		static Pago nuevoPago = new Pago();
		static Venta nuevoVenta = new Venta();
		static Detalle_venta nuevoDetalleVenta = new Detalle_venta();

		protected void agregarVenta_Click(object sender, EventArgs e)
		{
			int num_cliente = 0;
			int idpago = 0;
			int num_venta = 0;
			using (almacen_avance2Entities1 contextoCliente = new almacen_avance2Entities1())
			{
				string detalle = "";
				foreach (var item2 in carro)
				{
					detalle += item2.stock +" "+item2.nombre+"\r\n";                  

                }

                nuevoCliente = new Cliente
                {
                    numero_cliente = 1,
                    descripcion = detalle + "\r\n"
                };
				contextoCliente.Cliente.Add(nuevoCliente);

				contextoCliente.SaveChanges();
				num_cliente = nuevoCliente.numero_cliente;
			}

			using (almacen_avance2Entities1 contextoPago = new almacen_avance2Entities1())
			{
				nuevoPago = new Pago
				{
					numero_cliente = num_cliente,
					fecha = DateTime.Now,
					id_tipo_pago = Convert.ToInt32(idtipopago.SelectedItem.Value)
				};
				contextoPago.Pago.Add(nuevoPago);
				contextoPago.SaveChanges();
				idpago = nuevoPago.id_pago;

			}
		
			using (almacen_avance2Entities1 contextoVenta = new almacen_avance2Entities1())
			{
				nuevoVenta = new Venta
				{
					fecha = DateTime.Now,
					numero_cliente = num_cliente,
					id_usuario = Convert.ToInt32(Session["iduser"]),
					id_pago = nuevoPago.id_pago
				};
				contextoVenta.Venta.Add(nuevoVenta);
				contextoVenta.SaveChanges();
				num_venta = nuevoVenta.id_venta;
			}

			using (almacen_avance2Entities1 contextoDetalleVenta = new almacen_avance2Entities1())
			{
				var buscarAlmacen = from alm in contextoDetalleVenta.Almacen
									select new
									{
										alm.id_almacen
									};


				foreach (var item in carro)
				{
					nuevoDetalleVenta.precio_venta = Convert.ToInt32(mostrarPrecio.Text);
					nuevoDetalleVenta.id_producto = item.id_producto;
					nuevoDetalleVenta.id_venta = num_venta;
                    Session["id_venta_boleta"] = num_venta;
                    nuevoDetalleVenta.id_almacen = Convert.ToInt32(buscarAlmacen.First().id_almacen);
					nuevoDetalleVenta.id_tipo_pago = Convert.ToInt32(idtipopago.SelectedItem.Value);
                    nuevoDetalleVenta.numero_cliente = num_cliente;
                    Session["num_cliente"] = num_cliente;

                }
				contextoDetalleVenta.Detalle_venta.Add(nuevoDetalleVenta);
				contextoDetalleVenta.SaveChanges();
			}


            if (IsPostBack)
            {
                carro.Clear();
                gridGenerarProducto.DataSource = carro;
                gridGenerarProducto.DataBind();
                tcodigo.Text = "";
                tcodigo.Focus();
                mostrarPrecio.Text = "0";

                Alerta.Visible = true;
                Alerta.CssClass = "alert alert-success";
                lbAlerta.Text = "Venta Realizada ";
            }


        }

	}
}

