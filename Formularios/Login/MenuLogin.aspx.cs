using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_Final_LAB.Formularios.Login
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"]== null)
            {
                Session.Add("error", "Disculpe debe loguearse para acceder aqui...");
                Response.Redirect("ErrorLogin.aspx", false);
            }
        }

        protected void btnMenu_Click(object sender, EventArgs e)
        {
            Response.Redirect("../../Default.aspx", false);
        }
    }
}