using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocios;
using dominios;

namespace Proyecto_Final_LAB.Formularios.Facturacion
{
    public partial class FacturacionABM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FacturasNegocio fn = new FacturasNegocio();
            try
            {
                if (!IsPostBack)
                {
                    //Si el usuario no es super admin tiene bloqueado el ddl de sucursales,
                    //por ende hay que obtener la sucursal de la sesion, en caso de ser super admin puede editar la sucursal
                    //y ahi se deberia enviar otro parametro
                    int idSucursal = Convert.ToInt32(Session["Sucursal"]);

                    if (Session["listaProductos"] == null) Session.Add("listaProductos", fn.listarProductosFactura());

                    Session["listaItemsFactura"] = null;

                    dgvProductos.DataSource = Session["listaProductos"];
                    dgvProductos.DataBind();

                    DataTable dtCliente = fn.obtenerClientesFactura();
                    DataTable dtFormasPago = fn.obtenerFormasDePago();
                    DataTable dtSucursales = fn.obtenerSucursales();
                    DataTable dtPuntosVenta = fn.obtenerPuntosDeVenta(1);
                    DataTable dtVendedores = fn.obtenerVendedoresFactura(1);
                    ListItem li;

                    ddlClientes.Items.Add("Seleccione...");
                    ddlFormaPago.Items.Add("Seleccione...");
                    ddlSucursal.Items.Add("Seleccione...");
                    ddlPuntoVenta.Items.Add("Seleccione...");
                    ddlVendedor.Items.Add("Seleccione...");

                    txtDescuentoFactura.Value = "0.00";
                    txtSubtotalFactura.Value = "0.00";
                    txtTotalFactura.Value = "0.00";

                    txtFechaFactura.Text = DateTime.Now.ToString("yyyy-MM-dd");

                    foreach (DataRow r in dtCliente.Rows)
                    {
                        li = new ListItem(r["nombreCliente"].ToString(), r["Id"].ToString());
                        ddlClientes.Items.Add(li);
                    }

                    foreach (DataRow r in dtFormasPago.Rows)
                    {
                        li = new ListItem(r["tipo"].ToString(), r["Id"].ToString());
                        ddlFormaPago.Items.Add(li);
                    }

                    foreach (DataRow r in dtSucursales.Rows)
                    {
                        li = new ListItem(r["nombre"].ToString(), r["Id"].ToString());
                        ddlSucursal.Items.Add(li);
                    }

                    foreach (DataRow r in dtPuntosVenta.Rows)
                    {
                        li = new ListItem(r["nombrePuntoVenta"].ToString(), r["Id"].ToString());
                        ddlPuntoVenta.Items.Add(li);
                    }

                    foreach (DataRow r in dtVendedores.Rows)
                    {
                        li = new ListItem(r["NombreVendedor"].ToString(), r["Id"].ToString());
                        ddlVendedor.Items.Add(li);
                    }

                    ddlSucursal.SelectedValue = "1";
                }
            }
            catch (Exception ex)
            {

            }
        }
        protected void ddlPuntoVenta_SelectedIndexChanged(object sender, EventArgs e)
        {
            FacturasNegocio fn = new FacturasNegocio();
            try
            {
                int idPuntoVenta = Convert.ToInt32(ddlPuntoVenta.SelectedValue);
                int idSucursal = Convert.ToInt32(ddlSucursal.SelectedValue);

                lblTipoFactura.Text = fn.obtenerTipoFactura(Convert.ToInt32(Session["TipoCliente"]));
                lblNroFactura.Text = fn.obtenerNumeroFactura(idPuntoVenta, Convert.ToInt32(Session["TipoCliente"]));
            }
            catch (Exception ex)
            {
            }
        }

        protected void ddlSucursal_SelectedIndexChanged(object sender, EventArgs e)
        {
            FacturasNegocio fn = new FacturasNegocio();
            ListItem li;
            try
            {
                int idSucursal = Convert.ToInt32(ddlSucursal.SelectedValue);
                DataTable dtVendedores = fn.obtenerVendedoresFactura(idSucursal);
                DataTable dtPuntoVenta = fn.obtenerPuntosDeVenta(idSucursal);

                ddlVendedor.Items.Clear();
                ddlVendedor.Items.Add("Seleccione...");

                foreach (DataRow r in dtVendedores.Rows)
                {
                    li = new ListItem(r["NombreVendedor"].ToString(), r["Id"].ToString());
                    ddlVendedor.Items.Add(li);
                }

                ddlPuntoVenta.Items.Clear();
                ddlPuntoVenta.Items.Add("Seleccione...");

                foreach (DataRow r in dtPuntoVenta.Rows)
                {
                    li = new ListItem(r["nombrePuntoVenta"].ToString(), r["Id"].ToString());
                    ddlPuntoVenta.Items.Add(li);
                }
            }
            catch (Exception ex)
            {
            }
        }
        protected void ddlClientes_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                FacturasNegocio fn = new FacturasNegocio();
                Session["TipoCliente"] = null;
                Session["TipoCliente"] = fn.obtenerTipoClienteEspecifico(Convert.ToInt32(ddlClientes.SelectedValue));
                int idPuntoVenta = Convert.ToInt32(ddlPuntoVenta.SelectedValue);
                int idSucursal = Convert.ToInt32(ddlSucursal.SelectedValue);
                lblTipoFactura.Text = fn.obtenerTipoFactura(Convert.ToInt32(Session["TipoCliente"]));
                lblNroFactura.Text = fn.obtenerNumeroFactura(idPuntoVenta, Convert.ToInt32(Session["TipoCliente"]));
            }
            catch (Exception ex)
            {
            }
        }
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                FacturasNegocio fn = new FacturasNegocio();
                ListItem li;
                DataTable dtCliente = fn.obtenerClientesFacturaFiltrados(txtCliente.Text.ToString());
                ddlClientes.Items.Clear();
                ddlClientes.Items.Add("Seleccione...");

                foreach (DataRow r in dtCliente.Rows)
                {
                    li = new ListItem(r["nombreCliente"].ToString(), r["Id"].ToString());
                    ddlClientes.Items.Add(li);
                }
            }
            catch (Exception ex)
            {
            }
        }
        protected void btnAgregarItem_Click(object sender, EventArgs e)
        {
            try
            {
                GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
                GridView gv = clickedRow.NamingContainer as GridView;
                int id = Convert.ToInt32(gv.DataKeys[clickedRow.RowIndex].Values[0]);
                List<Producto> temp = (List<Producto>)Session["listaProductos"];
                Producto selected = temp.Find(x => x.Id == id);
                Session["idProductoSeleccionado"] = selected.Id.ToString();
                txtCodigoProducto.Text = selected.Codigo;
                txtDescripcion.Text = selected.Descripcion;
                txtPrecio.Text = selected.PrecioVenta.ToString();
                txtCantidad.Text = "1";
                txtDescuento.Text = "0";
            }
            catch (Exception ex)
            {
            }
        }
        protected void btnAgregarProducto_Click(object sender, EventArgs e)
        {
            try
            {
                List<ItemFactura> listaItemsFactura = new List<ItemFactura>();
                ItemFactura i = new ItemFactura();

                if (Session["listaItemsFactura"] != null)
                {
                    List<ItemFactura> l = (List<ItemFactura>)Session["listaItemsFactura"];
                    listaItemsFactura = l;
                    i.NumeroItem = l.Count + 1;
                }
                else
                {
                    List<ItemFactura> l = new List<ItemFactura>();
                    listaItemsFactura = l;
                    i.NumeroItem = 1;
                }

                i.IdProducto = Convert.ToInt32(Session["idProductoSeleccionado"]);
                i.Codigo = txtCodigoProducto.Text;
                i.Cantidad = Convert.ToInt32(txtCantidad.Text);
                i.Descripcion = txtDescripcion.Text;
                i.Descuento = Convert.ToDecimal(txtDescuento.Text);
                i.PrecioVenta = Convert.ToDecimal(txtPrecio.Text);
                i.PrecioTotal = Convert.ToDecimal(Convert.ToInt32(txtCantidad.Text)*Convert.ToDecimal(txtPrecio.Text));

                txtCodigoProducto.Text = "";
                txtDescripcion.Text = "";
                txtPrecio.Text = "";
                txtCantidad.Text = "";
                txtDescuento.Text = "";

                listaItemsFactura.Add(i);

                Session["listaItemsFactura"] = listaItemsFactura;

                decimal precioTotal = Convert.ToDecimal(txtTotalFactura.Value);
                precioTotal = precioTotal + i.PrecioTotal;

                txtSubtotalFactura.Value = precioTotal.ToString();
                txtTotalFactura.Value = precioTotal.ToString();


                dgvItemsFactura.DataSource = Session["listaItemsFactura"];
                dgvItemsFactura.DataBind();
            }
            catch (Exception ex)
            {
            }
        }
        protected void btnBorrarItem_Click(object sender, EventArgs e)
        {
            try
            {
                List<ItemFactura> listaItemsFactura = new List<ItemFactura>();
                ItemFactura i = new ItemFactura();
                GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
                GridView gv = clickedRow.NamingContainer as GridView;
                int nroItem = Convert.ToInt32(gv.DataKeys[clickedRow.RowIndex].Values[0]);
                List<ItemFactura> temp = (List<ItemFactura>)Session["listaItemsFactura"];

                foreach (var v in temp)
                {
                    listaItemsFactura = temp.FindAll(x => x.NumeroItem != nroItem);
                }

                Session["listaItemsFactura"] = listaItemsFactura;

                dgvItemsFactura.DataSource = Session["listaItemsFactura"];
                dgvItemsFactura.DataBind();
            }
            catch (Exception ex)
            {
            }
        }
        protected void btnFacturar_Click(object sender, EventArgs e)
        {
            FacturasNegocio fn = new FacturasNegocio();
            ItemFactura i = new ItemFactura();
            Factura f = new Factura();

            f.NumeroFactura = lblNroFactura.Text;
            int idCliente = Convert.ToInt32(ddlClientes.SelectedValue);
            int idVendedor = Convert.ToInt32(ddlVendedor.SelectedValue);
            int idFormaPago = Convert.ToInt32(ddlFormaPago.SelectedValue);
            f.SubTotal = Convert.ToDecimal(txtSubtotalFactura.Value);
            f.Descuento = Convert.ToDecimal(txtDescuentoFactura.Value);
            f.Total = Convert.ToDecimal(txtTotalFactura.Value);
            f.Fecha = DateTime.Parse(txtFechaFactura.Text);
            f.Observaciones = txtObservaciones.Text;
            int idSucursal = 1;
            int idTipoDocumento = Convert.ToInt32(Session["TipoCliente"]);
            int idPuntoVenta = Convert.ToInt32(ddlPuntoVenta.SelectedValue);

            int idFactura = fn.agregarFactura(f, idCliente, idVendedor, idFormaPago, idSucursal, idPuntoVenta, idTipoDocumento);

            List<ItemFactura> temp = (List<ItemFactura>)Session["listaItemsFactura"];

            for (int x = 0; x < temp.Count; x++)
            {
                i.IdProducto = temp[x].IdProducto;
                i.Cantidad = temp[x].Cantidad;
                i.SubTotal = temp[x].SubTotal;
                i.Descuento = temp[x].Descuento;
                i.PrecioTotal = temp[x].PrecioTotal;
                i.Codigo = temp[x].Codigo;
                i.PrecioVenta = temp[x].PrecioVenta;
                i.Descripcion = temp[x].Descripcion;

                fn.agregarItemsFactura(i, idFactura);
            }

        }

        protected void btnDescuentoFactura_Click(object sender, EventArgs e)
        {
            decimal precioTotal = Convert.ToDecimal(txtSubtotalFactura.Value);
            decimal descuento = Convert.ToDecimal(txtDescuentoFactura.Value);
            precioTotal = precioTotal - descuento;
            txtTotalFactura.Value = precioTotal.ToString();
        }
    }
}