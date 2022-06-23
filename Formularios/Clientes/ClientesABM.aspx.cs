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
    public partial class ClientesABM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
<<<<<<< HEAD
            Title = "Cliente REGISTROS : ";
            //Se carga los datos clientes
            ClienteNegocio cn = new ClienteNegocio();
            dgvClientes.DataSource = cn.obtenerClientesTodos();
            dgvClientes.DataBind();
            
=======

        }

        public void btnAgregar_Click(object sender, EventArgs e)
        {
            ClienteNegocio cn = new ClienteNegocio();
            Cliente c = new Cliente();

            c.Codigo = txtCodigo.Text;
            c.Nombres = txtNombres.Text;
            c.Apellidos = txtApellidos.Text;
            c.FechaNacimiento = DateTime.Parse(txtFechaNacimiento.Text);
            c.Cuit = txtCuit.Text;
            c.Domicilio = txtDomicilio.Text;
            c.Telefono = txtTelefono.Text;
            c.Email = txtEmail.Text;

            if (cn.agregarCliente(c))
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                    "swal('Cliente agregado', '', 'success')", true);
                //Response.Redirect("~");
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Cliente agregado con exito')", true);
            }
>>>>>>> parent of 96f5054 (Revert "agregados clientes y mejoras")
        }
    }
}


