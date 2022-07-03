using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocios;
using dominios;


namespace Proyecto_Final_LAB
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuario = (Usuario)Session["USUARIO"];
            UsuarioNegocio aux = new UsuarioNegocio();
            if(aux.permisos(usuario))
            {
                Response.Redirect("Formularios/Login/ErrorLogin.aspx");
            }
            }
        }
    }
