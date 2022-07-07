using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocios;
using dominios;

namespace Proyecto_Final_LAB.Formularios.Facturacion
{
    public partial class Facturas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Session["listaFacturas"] = null;
                alerta();
                if (Session["listaFacturas"] == null)
                {
                    FacturasNegocio fn = new FacturasNegocio();
                    Session.Add("listaFacturas", fn.obtenerFacturasTodas());
                }
                dgvFacturas.DataSource = Session["listaFacturas"];
                dgvFacturas.DataBind();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        protected void alerta()
        {
            switch (Session["alerta"])
            {
                case "agregado":
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "SomeKey", "toastr['success']('Factura agregada')", true);
                    Session["alerta"] = null;
                    break;
                case "cancelado":
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "SomeKey", "toastr['warning']('Factura cancelada')", true);
                    Session["alerta"] = null;
                    break;
                case "eliminado":
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "SomeKey", "toastr['warning']('Factura eliminada')", true);
                    Session["alerta"] = null;
                    break;
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("FacturacionABM.aspx");
        }
    }
}