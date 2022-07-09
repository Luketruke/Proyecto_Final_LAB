using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocios;
using dominios;

namespace Proyecto_Final_LAB.Formularios.Productos
{
    public partial class ProductosABM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CategoriasNegocio cn = new CategoriasNegocio();
            ProductoNegocio pn = new ProductoNegocio();
            MarcasNegocio mn = new MarcasNegocio();
            try
            {
                DataTable dtCagerorias = cn.obtenerCategorias();
                DataTable dtMarcas = mn.obtenerMarcas();
                ListItem li;

                if (Convert.ToInt32(Request.QueryString["accion"]) == 1)
                {
                    int codigo = pn.obtenerUltimoCodigo();
                    if (codigo == -1) {
                        txtCodigo.Text = 1.ToString();
                    }
                    else
                    {
                        codigo = codigo+1;
                        txtCodigo.Text = codigo.ToString();
                    }
                    ddlCategoria.Items.Add("Seleccione categoria...");
                    ddlMarca.Items.Add("Seleccione marca...");
                }

                foreach (DataRow r in dtCagerorias.Rows)
                {
                    li = new ListItem(r["Descripcion"].ToString(), r["Id"].ToString());
                    ddlCategoria.Items.Add(li);
                }

                foreach (DataRow r in dtMarcas.Rows)
                {
                    li = new ListItem(r["Descripcion"].ToString(), r["Id"].ToString());
                    ddlMarca.Items.Add(li);
                }

                if (Convert.ToInt32(Request.QueryString["accion"]) == 2 && !IsPostBack)
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    List<Producto> temp = (List<Producto>)Session["listaProductos"];
                    Producto selected = temp.Find(x => x.Id == id);
                    btnAgregar.Visible = false;
                    btnModificar.Visible = true;
                    txtCodigo.Text = selected.Codigo.ToString();
                    txtDescripcion.Text = selected.Descripcion;
                    txtPrecioVenta.Text = selected.PrecioVenta.ToString();
                    txtCosto.Text = selected.Costo.ToString();
                    txtObservaciones.Text = selected.Observaciones;
                    ddlCategoria.SelectedValue = selected.Categoria.Id.ToString();
                    ddlMarca.SelectedValue = selected.Marca.Id.ToString();
                    txtStockMinimo.Text = selected.Stock.StockMinimo.ToString();
                }

                Session["listaProductos"] = null;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }

        public void btnAgregar_Click(object sender, EventArgs e)
        {
            List<Sucursal> listaSucursales = new List<Sucursal>();
            ProductoNegocio pn = new ProductoNegocio();
            StockNegocio sn = new StockNegocio();
            Producto p = new Producto();
            Stock s = new Stock();

            try
            {
                p.Codigo = Convert.ToInt32(txtCodigo.Text);
                p.Descripcion = txtDescripcion.Text;
                p.PrecioVenta = Convert.ToDecimal(txtPrecioVenta.Text);
                p.Costo = Convert.ToDecimal(txtCosto.Text);
                p.Categoria = new CategoriaProducto();
                p.Categoria.Id = Convert.ToInt32(ddlCategoria.SelectedValue);
                p.Marca = new Marca();
                p.Marca.Id = Convert.ToInt32(ddlMarca.SelectedValue);
                p.Observaciones = txtObservaciones.Text;

                int idProducto = pn.agregarProducto(p);

                s.Producto = new Producto();
                s.Producto.Id = idProducto;
                s.StockMinimo = Convert.ToInt32(txtStockMinimo.Text);

                if (idProducto > 1)
                {
                    listaSucursales = sn.obtenerSucursales();

                    for(int i = 0; i < listaSucursales.Count; i++)
                    {
                        s.Sucursal = new Sucursal();
                        s.Sucursal.Id = Convert.ToInt32(listaSucursales[i].Id);

                        if (sn.agregarStock(s))
                        {
                            Session["alerta"] = "agregado";
                            Response.Redirect("Productos.aspx");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        public void btnModificar_Click(object sender, EventArgs e)
        {
            ProductoNegocio pn = new ProductoNegocio();
            Producto p = new Producto();

            try
            {
                p.Id = int.Parse(Request.QueryString["id"].ToString());
                p.Descripcion = txtDescripcion.Text;
                p.PrecioVenta = Convert.ToDecimal(txtPrecioVenta.Text);
                p.Costo = Convert.ToDecimal(txtCosto.Text);
                int idCategoria = Convert.ToInt32(ddlCategoria.SelectedValue);
                int idMarca = Convert.ToInt32(ddlMarca.SelectedValue);
                p.Observaciones = txtObservaciones.Text;

                if (pn.modificarProducto(p, idCategoria, idMarca))
                {
                    Session["alerta"] = "modificado";
                    Response.Redirect("Productos.aspx");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
    }
}