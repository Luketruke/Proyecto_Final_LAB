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
    public partial class MarcasABM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ProductoNegocio pn = new ProductoNegocio();
            dgvMarcas.DataSource = pn.obtenerMarcas();
            dgvMarcas.DataBind();
        }

        public void btnAgregar_Click(object sender, EventArgs e)
        {
            ProductoNegocio pn = new ProductoNegocio();
            Marca m = new Marca();

            m.Descripcion = txtMarca.Text;

            if (pn.agregarMarca(m))
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                    "swal('Marca agregada', '', 'success')", true);
            }
        }
    }
}