using System;
using System.Data;
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
            try
            {
                if (Convert.ToInt32(Request.QueryString["accion"]) == 2 && !IsPostBack)
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    List<Cliente> temp = (List<Cliente>)Session["listaClientes"];
                    DataTable dt = cn.obtenerDireccionCliente(id);
                    Cliente selected = temp.Find(x => x.Id == id);
                    btnAgregar.Visible = false;
                    btnModificar.Visible = true;
                    txtCodigo.Text = selected.Codigo;
                    txtNombres.Text = selected.Nombres;
                    txtApellidos.Text = selected.Apellidos;
                    txtFechaNacimiento.Text = selected.FechaNacimiento.ToString("yyyy-MM-dd");
                    txtCuit.Text = selected.Cuit;
                    txtTelefono.Text = selected.Telefono;
                    txtEmail.Text = selected.Email;
                    txtDomicilio.Text = dt.Rows[0]["Direccion"].ToString();
                    txtLocalidad.Text = dt.Rows[0]["Localidad"].ToString();
                    txtCodigoPostal.Text = dt.Rows[0]["CodigoPostal"].ToString();
                    txtObservaciones.Text = dt.Rows[0]["Observaciones"].ToString();
                }
                Session["listaClientes"] = null;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        public void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                ClienteNegocio cn = new ClienteNegocio();
                Direccion d = new Direccion();
                Cliente c = new Cliente();
                c.Codigo = txtCodigo.Text;
                c.Nombres = txtNombres.Text;
                c.Apellidos = txtApellidos.Text;
                c.FechaNacimiento = DateTime.Parse(txtFechaNacimiento.Text);
                c.Cuit = txtCuit.Text;
                c.Telefono = txtTelefono.Text;
                c.Email = txtEmail.Text;
                d.Domicilio = txtDomicilio.Text;
                d.Localidad = txtLocalidad.Text;
                d.CodigoPostal = txtCodigoPostal.Text;
                d.Observaciones = txtObservaciones.Text;

                if (cn.agregarCliente(c, d))
                {
                    Session["alerta"] = "agregado";
                    Response.Redirect("Clientes.aspx");
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
                Direccion d = new Direccion();
                Cliente c = new Cliente();
                c.Codigo = txtCodigo.Text;
                c.Nombres = txtNombres.Text;
                c.Apellidos = txtApellidos.Text;
                c.FechaNacimiento = DateTime.Parse(txtFechaNacimiento.Text);
                c.Cuit = txtCuit.Text;
                c.Telefono = txtTelefono.Text;
                c.Email = txtEmail.Text;
                d.Domicilio = txtDomicilio.Text;
                d.Localidad = txtLocalidad.Text;
                d.CodigoPostal = txtCodigoPostal.Text;
                d.Observaciones = txtObservaciones.Text;

                if (cn.modificarCliente(c, d))
                {
                    Session["alerta"] = "modificado";
                    Response.Redirect("Clientes.aspx");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
    }
}