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
    public partial class CategoriasABM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ProductoNegocio pn = new ProductoNegocio();
            dgvCategorias.DataSource = pn.obtenerCategorias();
            dgvCategorias.DataBind();
        }

        public void btnAgregar_Click(object sender, EventArgs e)
        {
            ProductoNegocio pn = new ProductoNegocio();
            CategoriaProducto c = new CategoriaProducto();

            c.Categoria = txtCategoria.Text;

            if (pn.agregarCategoria(c))
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                    "swal('Categoria agregada', '', 'success')", true);
            }
        }
    }
}