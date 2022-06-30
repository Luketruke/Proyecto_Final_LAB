using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocios;
using dominios;

namespace Proyecto_Final_LAB.Formularios.Clientes
{
    public partial class Clientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["listaClientes"] == null)
            {
                ClienteNegocio cn = new ClienteNegocio();
                Session.Add("listaClientes", cn.obtenerClientesTodos());
            }
            dgvClientes.DataSource = Session["listaClientes"];
            dgvClientes.DataBind();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ClientesABM.aspx?accion=1");
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
            GridView gv = clickedRow.NamingContainer as GridView;
            var id = gv.DataKeys[clickedRow.RowIndex].Values[0].ToString();
            Response.Redirect("ClientesABM.aspx?accion=2&id=" + id);
        }
    }
}