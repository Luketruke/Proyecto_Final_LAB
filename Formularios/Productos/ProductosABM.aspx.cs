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
            ProductoNegocio pn = new ProductoNegocio();
            DataTable dtCagerorias = new DataTable();
            DataTable dtMarcas = new DataTable();
            ListItem i;

            dtCagerorias = pn.obtenerCategorias();
            dtMarcas = pn.obtenerMarcas();

            foreach (DataRow r in dtCagerorias.Rows)
            {
                i = new ListItem(r["Descripcion"].ToString(), r["Id"].ToString());
                ddlCategoria.Items.Add(i);
            }

            foreach (DataRow r in dtMarcas.Rows)
            {
                i = new ListItem(r["Descripcion"].ToString(), r["Id"].ToString());
                ddlMarca.Items.Add(i);
            }
        }

        public void btnAgregar_Click(object sender, EventArgs e)
        {
            ProductoNegocio pn = new ProductoNegocio();
            Producto p = new Producto();

            p.Codigo = txtCodigo.Text;
            p.Descripcion = txtDescripcion.Text;
            p.PrevioVenta = Convert.ToDecimal(txtPrecioVenta.Text);
            p.Costo = Convert.ToDecimal(txtCosto.Text);        
            int idCategoria = Convert.ToInt32(ddlCategoria.SelectedValue);
            int idMarca = Convert.ToInt32(ddlMarca.SelectedValue);
            p.Observaciones = txtObservaciones.Text;

            pn.agregarProducto(p, idCategoria, idMarca);
        }
    }
}