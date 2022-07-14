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
    public partial class ProveedoresABM1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ProveedorNegocio pn = new ProveedorNegocio();
            try
            {

                if (Convert.ToInt32(Request.QueryString["accion"]) == 2 && !IsPostBack)
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    List<Proveedor> temp = (List<Proveedor>)Session["listaProveedores"];
                    DataTable dt = pn.obtenerDireccionProveedor(id);
                    Proveedor selected = temp.Find(x => x.Id == id);
                    btnAgregar.Visible = false;
                    btnModificar.Visible = true;
                    txtCodigo.Text = selected.Codigo;
                    txtRazonSocial.Text = selected.RazonSocial;
                    txtCUIT.Text = selected.Cuit;
                   // txtDomicilio.Text = selected.Domicilio;
                    txtTelefono.Text = selected.Telefono;
                    txtEmail.Text = selected.Email;
                    txtDomicilio.Text = dt.Rows[0]["Direccion"].ToString();
                    txtLocalidad.Text = dt.Rows[0]["Localidad"].ToString();
                    txtCodigoPostal.Text = dt.Rows[0]["CodigoPostal"].ToString();
                    txtObservaciones.Text = dt.Rows[0]["Observaciones"].ToString();
                }
                Session["listaProveedores"] = null;
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
                int id = Convert.ToInt32(Request.QueryString["id"]);
                ProveedorNegocio pn = new ProveedorNegocio();
                Direccion d = new Direccion();
                Proveedor p = new Proveedor();
                p.Codigo = txtCodigo.Text;
                p.RazonSocial = txtRazonSocial.Text;
                p.Cuit = txtCUIT.Text;
                p.Telefono = txtTelefono.Text;
                p.Email = txtEmail.Text;
                d.Domicilio = txtDomicilio.Text;
                d.Localidad = txtLocalidad.Text;
                d.CodigoPostal = txtCodigoPostal.Text;
                d.Observaciones = txtObservaciones.Text;
                if (pn.modificarProveedor(p,d ,id))
                {
                    Session["alerta"] = "modificado";
                    Response.Redirect("Proveedores.aspx", false);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
           
        }
        protected void btnAgregar_Click(object sender, EventArgs e)
        {  
            ProveedorNegocio pn = new ProveedorNegocio();
               Direccion d = new Direccion();
               Proveedor p = new Proveedor();

               p.Codigo = txtCodigo.Text;
               p.RazonSocial = txtRazonSocial.Text;
               p.Cuit = txtCUIT.Text;            
               p.Telefono= txtTelefono.Text;
               p.Email= txtEmail.Text;
               d.Domicilio = txtDomicilio.Text;
               d.Localidad = txtLocalidad.Text;
               d.CodigoPostal = txtCodigoPostal.Text;
               d.Observaciones = txtObservaciones.Text;
        
            if (pn.agregarProveedor(p, d))
               {
                Session["alerta"] = "agregado";
                Response.Redirect("Proveedores.aspx");
                // ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                //   "swal('Proveedor agregado', '', 'success')", true);
            }   
             
        }
    }
}