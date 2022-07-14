using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocios;
using dominios;

namespace Proyecto_Final_LAB.Formularios.Sucursales
{
    public partial class SucursalesABM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                SucursalesNegocio sn = new SucursalesNegocio();

                if (Convert.ToInt32(Request.QueryString["accion"]) == 2 && !IsPostBack)
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    List<Sucursal> temp = (List<Sucursal>)Session["listaSucursales"];
                    Sucursal selected = temp.Find(x => x.Id == id);
                    btnAgregar.Visible = false;
                    btnModificar.Visible = true;
                    txtNombre.Text = selected.Nombre;
                    txtDireccion.Text = selected.Direccion;
                    txtLocalidad.Text = selected.Localidad;
                    txtCodigoPostal.Text = selected.CodigoPostal;
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
                Sucursal s = new Sucursal();
                s.Nombre = txtNombre.Text;
                s.Direccion = txtDireccion.Text;
                s.Localidad = txtLocalidad.Text;
                s.CodigoPostal = txtCodigoPostal.Text;

                if (sn.agregarSucursal(s))
                {
                    Session["alerta"] = "agregado";
                    Response.Redirect("Sucursales.aspx");
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
                Sucursal s = new Sucursal();
                s.Nombre = txtNombre.Text;
                s.Direccion = txtDireccion.Text;
                s.Localidad = txtLocalidad.Text;
                s.CodigoPostal = txtCodigoPostal.Text;

                if (sn.modificarSucursal(s))
                {
                    Session["alerta"] = "modificado";
                    Response.Redirect("Sucursales.aspx");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
    }
}