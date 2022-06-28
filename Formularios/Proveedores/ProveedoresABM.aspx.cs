using System;
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

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {

            ProveedorNegocio pn = new ProveedorNegocio();
               Proveedor p = new Proveedor();

               p.Codigo = txtCodigo.Text;
               p.RazonSocial = txtRazonSocial.Text;
               p.Cuit = txtCuit.Text;
               p.Domicilio = txtDomicilio.Text;
               p.Telefono= txtTelefono.Text;
               p.Email= txtEmail.Text;
              
               if (pn.agregarProveedor(p))
               {
                   ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                      "swal('Proveedor agregado', '', 'success')", true);
               }           
        }
    }
}