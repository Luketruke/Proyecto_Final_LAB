using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocios;

namespace Proyecto_Final_LAB.Formularios.Vendedores
{
    public partial class Vendedores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Session["listaVendedores"] = null;
                alerta();
                if (Session["listaVendedores"] == null)
                {
                    VendedoresNegocio vn = new VendedoresNegocio();
                    Session.Add("listaVendedores", vn.obtenerVendedoresTodos());
                }
                dgvVendedores.DataSource = Session["listaVendedores"];
                dgvVendedores.DataBind();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("VendedoresABM.aspx?accion=1");
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
                GridView gv = clickedRow.NamingContainer as GridView;
                var id = gv.DataKeys[clickedRow.RowIndex].Values[0].ToString();
                Response.Redirect("VendedoresABM.aspx?accion=2&id=" + id);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                VendedoresNegocio vn = new VendedoresNegocio();
                GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
                GridView gv = clickedRow.NamingContainer as GridView;
                var id = gv.DataKeys[clickedRow.RowIndex].Values[0].ToString();
                vn.eliminarVendedor(Convert.ToInt32(id));
                Session["alerta"] = "eliminado";
                Session["listaVendedores"] = null;
                Response.Redirect("Vendedores.aspx");
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
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "SomeKey", "toastr['success']('Vendedor agregado')", true);
                    Session["alerta"] = null;
                    break;
                case "modificado":
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "SomeKey", "toastr['success']('Vendedor modificado')", true);
                    Session["alerta"] = null;
                    break;
                case "eliminado":
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "SomeKey", "toastr['warning']('Vendedor eliminado')", true);
                    Session["alerta"] = null;
                    break;
            }
        }
    }
}