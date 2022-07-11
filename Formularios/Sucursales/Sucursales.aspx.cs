using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocios;
using dominios;

namespace Proyecto_Final_LAB.Formularios.Vendedores
{
    public partial class Sucursales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                SucursalesNegocio sn = new SucursalesNegocio();
                alerta();

                Session["listaSucursales"] = null;

                Session.Add("listaSucursales", sn.obtenerSucursales());

                dgvSucursales.DataSource = Session["listaSucursales"];
                dgvSucursales.DataBind();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("SucursalesABM.aspx?accion=1");
        }
        protected void btnPuntosVenta_Click(object sender, EventArgs e)
        {
            try
            {
                GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
                GridView gv = clickedRow.NamingContainer as GridView;
                var id = gv.DataKeys[clickedRow.RowIndex].Values[0].ToString();
                Response.Redirect("PuntosVenta.aspx?accion=1&s=" + id);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        protected void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
                GridView gv = clickedRow.NamingContainer as GridView;
                var id = gv.DataKeys[clickedRow.RowIndex].Values[0].ToString();
                Response.Redirect("SucursalesABM.aspx?accion=2&id=" + id);
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
                sn.eliminarSucursal(Convert.ToInt32(id));
                Session["alerta"] = "eliminado";
                Session["listaSucursales"] = null;
                Response.Redirect("Sucursales.aspx");
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
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "SomeKey", "toastr['success']('Sucursal agregada')", true);
                    Session["alerta"] = null;
                    break;
                case "eliminado":
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "SomeKey", "toastr['warning']('Sucursal eliminada')", true);
                    Session["alerta"] = null;
                    break;
                case "modificado":
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "SomeKey", "toastr['success']('Sucursal modificada')", true);
                    Session["alerta"] = null;
                    break;
            }
        }
    }
}