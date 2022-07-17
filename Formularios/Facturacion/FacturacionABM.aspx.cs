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
            VendedoresNegocio vn = new VendedoresNegocio();
            SucursalesNegocio sn = new SucursalesNegocio();
            FacturasNegocio fn = new FacturasNegocio();
            ProductoNegocio pn = new ProductoNegocio();
            try
            {
                if (!IsPostBack)
                {
                    int idSucursal = Convert.ToInt32(Session["idSucursal"]);

                    Session["listaItemsFactura"] = null;
                    Session["listaProductos"] = null;
                    Session["dtProdSelected"] = null;

                    //Esto no deberia ser asi de hardcodeado, pero como lo de login no se va a terminar va a quedar de esta manera.
                    //La idea realmente seria que Session["idSucursal"] tenga la sucursal del usuario y precargar la sucursal con los items.
                    if (idSucursal==0)
                    {
                        Session.Add("listaProductos", pn.listarProductosFactura(3));
                    }
                    else
                    {
                        Session.Add("listaProductos", pn.listarProductosFactura(idSucursal));
                    }

                    dgvProductos.DataSource = Session["listaProductos"];
                    dgvProductos.DataBind();

                    DataTable dtCliente = fn.obtenerClientesFactura();
                    DataTable dtFormasPago = fn.obtenerFormasDePago();
                    DataTable dtSucursales = sn.obtenerSucursalesFactura();
                    DataTable dtPuntosVenta = sn.obtenerPuntosDeVentaFactura(1);
                    DataTable dtVendedores = vn.obtenerVendedoresFactura(1);
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
            VendedoresNegocio vn = new VendedoresNegocio();
            SucursalesNegocio sn = new SucursalesNegocio();
            ListItem li;
            try
            {
                int idSucursal = Convert.ToInt32(ddlSucursal.SelectedValue);
                DataTable dtVendedores = vn.obtenerVendedoresFactura(idSucursal);
                DataTable dtPuntoVenta = sn.obtenerPuntosDeVentaFactura(idSucursal);
                Session["idSucursal"] = idSucursal.ToString();

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
                if(dtCliente.Rows.Count > 0)
                {
                    ddlClientes.Items.Clear();
                    ddlClientes.Items.Add("Seleccione...");

                    foreach (DataRow r in dtCliente.Rows)
                    {
                        li = new ListItem(r["nombreCliente"].ToString(), r["Id"].ToString());
                        ddlClientes.Items.Add(li);
                    }
                }
                else
                {
                    string script = String.Format(@"<script type='text/javascript'>alert('No se encontraron clientes' );</script>", "0033");
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
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
                Session["dtProdSelected"] = null;
                DataTable dt = new DataTable();
                dt.Columns.Add("valor", typeof(int));
                GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
                GridView gv = clickedRow.NamingContainer as GridView;
                int id = Convert.ToInt32(gv.DataKeys[clickedRow.RowIndex].Values[0]);
                List<Producto> temp = (List<Producto>)Session["listaProductos"];
                Producto selected = temp.Find(x => x.Id == id);

                if (selected.Stock.StockActual > selected.Stock.StockMinimo)
                {
                    dt.Rows.Add(selected.Id);                                                 //Posicion 0 = IdProducto
                    dt.Rows.Add((selected.Stock.StockMinimo-selected.Stock.StockActual)*-1);  //Posicion 1 = StockPosible
                    Session["dtProdSelected"] = dt;
                    txtCodigoProducto.Text = selected.Codigo.ToString();
                    txtDescripcion.Text = selected.Descripcion;
                    txtPrecio.Value = selected.PrecioVenta.ToString();
                    txtCantidad.Text = "1";
                    txtDescuento.Text = "0";
                }
                else
                {
                    string script = String.Format(@"<script type='text/javascript'>alert('No hay suficiente stock para seleccionar el producto' );</script>", "0033");
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                }
            }
            catch (Exception ex)
            {
            }
        }
        protected void btnAgregarProducto_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = new DataTable();
                List<ItemFactura> listaItemsFactura = new List<ItemFactura>();
                ItemFactura i = new ItemFactura();
                dt = (DataTable)Session["dtProdSelected"];

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

                if (dt!=null)
                {
                    i.IdProducto = Convert.ToInt32(dt.Rows[0]["valor"]);
                    int StockPosible = Convert.ToInt32(dt.Rows[1]["valor"]);

                    if (Convert.ToInt32(txtCantidad.Text)>0)
                    {
                        if (Convert.ToInt32(txtCantidad.Text) <= StockPosible)
                        {
                            i.Codigo = txtCodigoProducto.Text;
                            i.Cantidad = Convert.ToInt32(txtCantidad.Text);
                            i.Descripcion = txtDescripcion.Text;
                            i.PrecioVenta = Convert.ToDecimal(txtPrecio.Value);
                            i.PrecioTotal = Convert.ToDecimal(Convert.ToInt32(txtCantidad.Text)*Convert.ToDecimal(txtPrecio.Value));

                            if (txtDescuento.Text != ".")
                            {
                                if (Convert.ToInt32(txtDescuento.Text)>=0 && Convert.ToInt32(txtDescuento.Text)<100)
                                {
                                    i.Descuento = (Convert.ToInt32(txtDescuento.Text) * i.PrecioTotal)/100;
                                    i.PrecioTotal = i.PrecioTotal - i.Descuento;

                                    txtCodigoProducto.Text = "";
                                    txtDescripcion.Text = "";
                                    txtPrecio.Value = "";
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
                                else
                                {
                                    string script = String.Format(@"<script type='text/javascript'>alert('El descuento no es valido' );</script>", "0033");
                                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                                }
                            }
                            else
                            {
                                string script = String.Format(@"<script type='text/javascript'>alert('Caracter invalido en el descuento' );</script>", "0033");
                                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                            }
                        }
                        else
                        {
                            string script = String.Format(@"<script type='text/javascript'>alert('El stock no es suficiente, ingrese otra cantidad' );</script>", "0033");
                            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                        }
                    }
                    else
                    {
                        string script = String.Format(@"<script type='text/javascript'>alert('La cantidad debe ser mayor a 1' );</script>", "0033");
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                    }
                }
                else
                {
                    string script = String.Format(@"<script type='text/javascript'>alert('No selecciono ningun producto' );</script>", "0033");
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                }
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
                decimal NuevoSubtotal = 0;

                foreach (var v in temp)
                {
                    listaItemsFactura = temp.FindAll(x => x.NumeroItem != nroItem);
                }

                for (int x = 0; x < listaItemsFactura.Count; x++)
                {
                    NuevoSubtotal += Convert.ToDecimal(listaItemsFactura[x].PrecioTotal);
                }

                decimal precioTotal = NuevoSubtotal - Convert.ToDecimal(txtDescuentoFactura.Value);

                if (precioTotal > 0)
                {
                    txtSubtotalFactura.Value = NuevoSubtotal.ToString();
                    txtTotalFactura.Value = precioTotal.ToString();
                }
                else if (precioTotal <= 0)
                {
                    txtDescuentoFactura.Value = "0.00";
                    txtSubtotalFactura.Value = "0.00";
                    txtTotalFactura.Value = "0.00";
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
            StockNegocio sn = new StockNegocio();
            ItemFactura i = new ItemFactura();
            Factura f = new Factura();

            try
            {
                f.NumeroFactura = lblNroFactura.Text;
                f.Cliente = new Cliente();
                f.Cliente.Id = Convert.ToInt32(ddlClientes.SelectedValue);
                f.Vendedor = new Vendedor();
                f.Vendedor.Id = Convert.ToInt32(ddlVendedor.SelectedValue);
                f.FormaPago = new FormaPago();
                f.FormaPago.Id = Convert.ToInt32(ddlFormaPago.SelectedValue);
                f.SubTotal = Convert.ToDecimal(txtSubtotalFactura.Value);
                f.Descuento = Convert.ToDecimal(txtDescuentoFactura.Value);
                f.Total = Convert.ToDecimal(txtTotalFactura.Value);
                f.Fecha = DateTime.Parse(txtFechaFactura.Text);
                f.Observaciones = txtObservaciones.Text;
                f.Sucursal = new Sucursal();
                f.Sucursal.Id = Convert.ToInt32(Session["idSucursal"]);
                f.TipoDocumento = new TipoDocumento();
                f.TipoDocumento.Id = Convert.ToInt32(Session["TipoCliente"]);
                f.PuntoVenta = new PuntoVenta();
                f.PuntoVenta.Id = Convert.ToInt32(ddlPuntoVenta.SelectedValue);

                List<ItemFactura> temp = (List<ItemFactura>)Session["listaItemsFactura"];
                if (temp != null)
                {
                    int idFactura = fn.agregarFactura(f);
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
                        if (fn.agregarItemsFactura(i, idFactura))
                        {
                            int idStock = sn.modificarStockFactura(i.IdProducto, i.Cantidad, f.Sucursal.Id);
                            sn.agregarMovimientoStockFactura(i.IdProducto, idStock, i.Cantidad, f.Sucursal.Id);
                        }
                    }
                    fn.modificarNumeracion(f.TipoDocumento.Id, f.PuntoVenta.Id);
                    Session["alerta"] = "agregado";
                    Response.Redirect("Facturas.aspx");
                }
                else
                {
                    string script = String.Format(@"<script type='text/javascript'>alert('Debe agregar productos a la factura' );</script>", "0033");
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                }
            }
            catch (Exception ex)
            {
            }
        }
        protected void btnDescuentoFactura_Click(object sender, EventArgs e)
        {
            try
            {
                decimal precioTotal = Convert.ToDecimal(txtSubtotalFactura.Value);
                decimal descuento = Convert.ToDecimal(txtDescuentoFactura.Value);
                if (descuento < 0)
                {
                    precioTotal = precioTotal - descuento;
                    if (precioTotal > 0) txtTotalFactura.Value = precioTotal.ToString();
                    else
                    {
                        string script = String.Format(@"<script type='text/javascript'>alert('El precio total debe ser mayor a 0' );</script>", "0033");
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                    }
                }
                else
                {
                    string script = String.Format(@"<script type='text/javascript'>alert('El descuento no puede ser negativo' );</script>", "0033");
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                }
            }
            catch (Exception ex)
            {

            }
        }
        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Session["alerta"] = "cancelado";
            Response.Redirect("Facturas.aspx");
        }

        protected void btnFiltrarProductos_Click(object sender, EventArgs e)
        {
            ProductoNegocio pn = new ProductoNegocio();
            int idSucursal = Convert.ToInt32(Session["idSucursal"]);

            if (idSucursal==0)
            {
                //Hardcodeado en 3, esto deberia funcionar la sucursal del usuario activo.
                dgvProductos.DataSource = pn.listarProductosFacturaFiltrados(txtFiltrarProductos.Value.ToString(), 3);
            }
            else
            {
                dgvProductos.DataSource = pn.listarProductosFacturaFiltrados(txtFiltrarProductos.Value.ToString(), idSucursal);
            }

            dgvProductos.DataBind();
        }
    }
}