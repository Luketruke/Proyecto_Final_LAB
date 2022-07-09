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
    public partial class VendedoresABM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            VendedoresNegocio vn = new VendedoresNegocio();
            SucursalesNegocio sn = new SucursalesNegocio();
            ListItem li;
            try
            {
                DataTable dtSucursales = sn.obtenerSucursales();
                if (Convert.ToInt32(Request.QueryString["accion"]) == 1)
                {
                    int codigo = vn.obtenerUltimoCodigo();
                    if (codigo == -1)
                    {
                        txtCodigo.Text = 1.ToString();
                    }
                    else
                    {
                        codigo = codigo+1;
                        txtCodigo.Text = codigo.ToString();
                    }
                    ddlSucursales.Items.Add("Seleccione sucursal...");
                    txtFechaAlta.Text =  DateTime.Now.ToString("yyyy-MM-dd");
                }

                foreach (DataRow r in dtSucursales.Rows)
                {
                    li = new ListItem(r["Nombre"].ToString(), r["Id"].ToString());
                    ddlSucursales.Items.Add(li);
                }

                if (Convert.ToInt32(Request.QueryString["accion"]) == 2 && !IsPostBack)
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    List<Vendedor> temp = (List<Vendedor>)Session["listaVendedores"];
                    Vendedor selected = temp.Find(x => x.Id == id);
                    btnAgregar.Visible = false;
                    btnModificar.Visible = true;
                    txtCodigo.Text = selected.Codigo.ToString();
                    txtNombres.Text = selected.Nombres;
                    txtApellidos.Text = selected.Apellidos;
                    txtFechaAlta.Text = selected.FechaAlta.ToString("yyyy-MM-dd");
                    txtTelefono.Text = selected.Telefono;
                    txtEmail.Text = selected.Email;
                    txtPorcentajeVenta.Text = selected.PorcentajeXVenta.ToString();
                }
                Session["listaVendedores"] = null;
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
                VendedoresNegocio vn = new VendedoresNegocio();
                Vendedor v = new Vendedor();
                v.Codigo = Convert.ToInt32(txtCodigo.Text);
                v.Nombres = txtNombres.Text;
                v.Apellidos = txtApellidos.Text;
                v.FechaAlta = DateTime.Parse(txtFechaAlta.Text);
                v.Telefono = txtTelefono.Text;
                v.Email = txtEmail.Text;
                v.PorcentajeXVenta = Convert.ToDecimal(txtPorcentajeVenta.Text);
                v.Sucursal = new Sucursal();
                v.Sucursal.Id = Convert.ToInt32(ddlSucursales.SelectedValue);

                if (vn.agregarVendedor(v))
                {
                    Session["alerta"] = "agregado";
                    Response.Redirect("Vendedores.aspx");
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
                VendedoresNegocio vn = new VendedoresNegocio();
                Vendedor v = new Vendedor();
                v.Id = Convert.ToInt32(Request.QueryString["Id"]);
                v.Nombres = txtNombres.Text;
                v.Apellidos = txtApellidos.Text;
                v.FechaAlta = DateTime.Parse(txtFechaAlta.Text);
                v.Telefono = txtTelefono.Text;
                v.Email = txtEmail.Text;
                v.PorcentajeXVenta = Convert.ToDecimal(txtPorcentajeVenta.Text);
                v.Sucursal = new Sucursal();
                v.Sucursal.Id = Convert.ToInt32(ddlSucursales.SelectedValue);

                if (vn.modificarVendedor(v))
                {
                    Session["alerta"] = "modificado";
                    Response.Redirect("Vendedores.aspx");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
    }
}