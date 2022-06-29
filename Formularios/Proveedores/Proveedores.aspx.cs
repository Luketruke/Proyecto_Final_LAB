using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocios;
using dominios;

namespace Proyecto_Final_LAB.Formularios.Proveedores
{
    public partial class ProveedoresABM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Title = "Proveedores";
           
             ProveedorNegocio pv = new ProveedorNegocio();
             dgvProveedores.DataSource = pv.obtenerProveedores();
             dgvProveedores.DataBind();
           
        }

        protected void dgvProveedores_SelectedIndexChanged(object sender, EventArgs e)
        {
            var Id = dgvProveedores.SelectedDataKey.Value.ToString();

          //  Response.Redirect("ProveedoresABM.aspx?id=" + Id);
        }
    }
   
}