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
            DataTable dtCagerorias = pn.obtenerCategorias();
            DataTable dtMarcas = pn.obtenerMarcas();
            ListItem li;

            if (Convert.ToInt32(Request.QueryString["accion"]) == 1)
            {
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
                txtCodigo.Text = selected.Codigo;
                txtDescripcion.Text = selected.Descripcion;
                txtPrecioVenta.Text = selected.PrecioVenta.ToString();
                txtCosto.Text = selected.Costo.ToString();
                txtObservaciones.Text = selected.Observaciones;
                ddlCategoria.SelectedValue = selected.Categoria.Id.ToString();
                ddlMarca.SelectedValue = selected.Marca.Id.ToString();
            }

            Session["listaProductos"] = null;
        }

        public void btnAgregar_Click(object sender, EventArgs e)
        {
            ProductoNegocio pn = new ProductoNegocio();
            Producto p = new Producto();

            try
            {
                p.Codigo = txtCodigo.Text;
                p.Descripcion = txtDescripcion.Text;
                p.PrecioVenta = Convert.ToDecimal(txtPrecioVenta.Text);
                p.Costo = Convert.ToDecimal(txtCosto.Text);
                int idCategoria = Convert.ToInt32(ddlCategoria.SelectedValue);
                int idMarca = Convert.ToInt32(ddlMarca.SelectedValue);
                p.Observaciones = txtObservaciones.Text;

                if (pn.agregarProducto(p, idCategoria, idMarca))
                {
                    //ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                    //    "swal('Producto agregado', '', 'success')", true);
                    Response.Redirect("Productos.aspx");
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Producto agregado con exito')", true);
                }
            }
            catch(Exception ex)
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
                p.Codigo = txtCodigo.Text;
                p.Descripcion = txtDescripcion.Text;
                p.PrecioVenta = Convert.ToDecimal(txtPrecioVenta.Text);
                p.Costo = Convert.ToDecimal(txtCosto.Text);
                int idCategoria = Convert.ToInt32(ddlCategoria.SelectedValue);
                int idMarca = Convert.ToInt32(ddlMarca.SelectedValue);
                p.Observaciones = txtObservaciones.Text;

                if (pn.modificarProducto(p, idCategoria, idMarca))
                {
                    //ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                    //    "swal('Producto modificado', '', 'success')", true);
                    Response.Redirect("Productos.aspx");
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Producto modificado con exito')", true);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
    }
}