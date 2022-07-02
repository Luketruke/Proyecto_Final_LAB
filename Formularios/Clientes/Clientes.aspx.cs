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
            try
            {
                Session["listaClientes"] = null;
                alerta();
                if (Session["listaClientes"] == null)
                {
                    ClienteNegocio cn = new ClienteNegocio();
                    Session.Add("listaClientes", cn.obtenerClientesTodos());
                }
                dgvClientes.DataSource = Session["listaClientes"];
                dgvClientes.DataBind();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ClientesABM.aspx?accion=1");
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
                GridView gv = clickedRow.NamingContainer as GridView;
                var id = gv.DataKeys[clickedRow.RowIndex].Values[0].ToString();
                Response.Redirect("ClientesABM.aspx?accion=2&id=" + id);
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
                ClienteNegocio cn = new ClienteNegocio();
                GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
                GridView gv = clickedRow.NamingContainer as GridView;
                var id = gv.DataKeys[clickedRow.RowIndex].Values[0].ToString();
                cn.eliminarCliente(Convert.ToInt32(id));
                Session["alerta"] = "eliminado";
                Session["listaClientes"] = null;
                Response.Redirect("Clientes.aspx");
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
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "SomeKey", "toastr['success']('Cliente agregado')", true);
                    Session["alerta"] = null;
                    break;
                case "eliminado":
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "SomeKey", "toastr['warning']('Cliente eliminado')", true);
                    Session["alerta"] = null;
                    break;
                case "modificado":
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "SomeKey", "toastr['success']('Cliente modificado')", true);
                    Session["alerta"] = null;
                    break;
            }
        }
    }
}