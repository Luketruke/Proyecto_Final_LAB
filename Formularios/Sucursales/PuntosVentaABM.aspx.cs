using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocios;
using dominios;

namespace Proyecto_Final_LAB.Formularios.Sucursales
{
    public partial class PuntosVentaABM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                SucursalesNegocio sn = new SucursalesNegocio();

                if (Convert.ToInt32(Request.QueryString["accion"]) == 2 && !IsPostBack)
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    List<PuntoVenta> temp = (List<PuntoVenta>)Session["listaPuntosVenta"];
                    PuntoVenta selected = temp.Find(x => x.Id == id);
                    btnAgregar.Visible = false;
                    btnModificar.Visible = true;
                    txtNombre.Text = selected.Nombre;
                    txtNumero.Text = selected.Numero;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                SucursalesNegocio sn = new SucursalesNegocio();
                PuntoVenta pv = new PuntoVenta();
                pv.Numero = txtNumero.Text;
                pv.Nombre = txtNombre.Text;
                pv.Sucursal = new Sucursal();
                pv.Sucursal.Id = Convert.ToInt32(Request.QueryString["s"]);

                if (sn.agregarNumeracion(sn.agregarPuntoVenta(pv)))
                {
                    Session["alerta"] = "agregado";
                    Response.Redirect("PuntosVenta.aspx?s=" + Convert.ToInt32(Request.QueryString["s"]));
                }
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
                SucursalesNegocio sn = new SucursalesNegocio();
                PuntoVenta pv = new PuntoVenta();
                pv.Numero = txtNumero.Text;
                pv.Nombre = txtNombre.Text;

                if (sn.modificarPuntoVenta(pv))
                {
                    Session["alerta"] = "modificado";
                    Response.Redirect("PuntosVenta.aspx?s=" + Convert.ToInt32(Request.QueryString["s"]));
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
    }
}