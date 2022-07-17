using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocios;
using dominios;

namespace Proyecto_Final_LAB.Formularios.Sucursales
{
    public partial class PuntosVenta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                SucursalesNegocio sn = new SucursalesNegocio();
                alerta();

                if (!IsPostBack)
                    Session["listaPuntosVenta"] = null;

                Session.Add("listaPuntosVenta", sn.obtenerPuntosDeVenta(Convert.ToInt32(Request.QueryString["s"])));
                dgvPuntosVenta.DataSource = Session["listaPuntosVenta"];
                dgvPuntosVenta.DataBind();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("PuntosVentaABM.aspx?accion=1&s=" + Convert.ToInt32(Request.QueryString["s"]));
        }
        protected void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
                GridView gv = clickedRow.NamingContainer as GridView;
                var id = gv.DataKeys[clickedRow.RowIndex].Values[0].ToString();
                Response.Redirect("PuntosVentaABM.aspx?accion=2&s=" + Convert.ToInt32(Request.QueryString["s"]) + "&id=" + id);
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
                SucursalesNegocio sn = new SucursalesNegocio();
                GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
                GridView gv = clickedRow.NamingContainer as GridView;
                var id = gv.DataKeys[clickedRow.RowIndex].Values[0].ToString();
                if (sn.eliminarPuntoVenta(Convert.ToInt32(id)))
                {
                    Session["alerta"] = "eliminado";
                    Session["listaPuntosVenta"] = null;
                    Response.Redirect("PuntosVenta.aspx");
                }
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
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "SomeKey", "toastr['success']('Punto de venta agregado')", true);
                    Session["alerta"] = null;
                    break;
                case "eliminado":
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "SomeKey", "toastr['warning']('Punto de venta eliminado')", true);
                    Session["alerta"] = null;
                    break;
                case "modificado":
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "SomeKey", "toastr['success']('Punto de venta modificado')", true);
                    Session["alerta"] = null;
                    break;
                case "cancelado":
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "SomeKey", "toastr['warning']('Accion cancelada')", true);
                    Session["alerta"] = null;
                    break;
            }
        }
    }
}