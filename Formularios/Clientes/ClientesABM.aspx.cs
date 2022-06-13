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
            Cliente_Negocio cn = new Cliente_Negocio();
            Cliente c = new Cliente();

            c = cn.obtenerCliente();

            txtCliente.Text = c.Nombres.ToString() + " " + c.Apellidos.ToString();
        }
    }
}