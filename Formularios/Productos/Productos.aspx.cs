using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocios;

namespace Proyecto_Final_LAB.Formularios.Productos
{
    public partial class Productos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["listaProductos"] == null)
                {
                    ProductoNegocio pn = new ProductoNegocio();
                    Session.Add("listaProductos", pn.listarProductos());
                }
                dgvProductos.DataSource = Session["listaProductos"];
                dgvProductos.DataBind();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProductosABM.aspx?accion=1");
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
                GridView gv = clickedRow.NamingContainer as GridView;
                var id = gv.DataKeys[clickedRow.RowIndex].Values[0].ToString();
                Response.Redirect("ProductosABM.aspx?accion=2&id=" + id);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
    }
}