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
            ClienteNegocio cn = new ClienteNegocio();

            if (Convert.ToInt32(Request.QueryString["accion"]) == 2 && !IsPostBack)
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                List<Cliente> temp = (List<Cliente>)Session["listaClientes"];
                Cliente selected = temp.Find(x => x.Id == id);
                btnAgregar.Visible = false;
                btnModificar.Visible = true;
                txtCodigo.Text = selected.Codigo;
                txtNombres.Text = selected.Nombres;
                txtApellidos.Text = selected.Apellidos; 
                txtFechaNacimiento.Text = selected.FechaNacimiento.ToString("dd/MM/yyyy");
                txtCuit.Text = selected.Cuit;
                txtDomicilio.Text = selected.Domicilio;
                txtTelefono.Text = selected.Telefono;
                txtEmail.Text = selected.Email;
            }

            Session["listaProductos"] = null;
        }
        public void btnAgregar_Click(object sender, EventArgs e)
        {
            try
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
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }

        public void btnModificar_Click(object sender, EventArgs e)
        {
            try
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

                if (cn.modificarCliente(c))
                {
                    //ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                    //    "swal('Producto modificado', '', 'success')", true);
                    Response.Redirect("Clientes.aspx");
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Producto modificado con exito')", true);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
    }
}