using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocios;
using dominios;

namespace Proyecto_Final_LAB.Formularios.StockProductos
{
    public partial class StockABM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            StockNegocio st = new StockNegocio();
            try
            {
                int idProducto = Convert.ToInt32(Request.QueryString["idProducto"]);
                int StockTotal = 0;
                Session["listaStock"] = null;
                if (Session["listaStock"] == null)
                {
                    Session.Add("listaStock", st.obtenerStockProductos(idProducto));
                }

                List<Stock> listaStock = (List<Stock>)Session["listaStock"];

                for (int x = 0; x < listaStock.Count; x++)
                {
                    StockTotal += Convert.ToInt32(listaStock[x].StockActual);
                }

                lblStockTotal.Text = "Stock total: " + StockTotal.ToString();

                dgvStock.DataSource = Session["listaStock"];
                dgvStock.DataBind();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        protected void btnModificar_Click(object sender, EventArgs e)
        {

        }

        protected void btnStockHistorico_Click(object sender, EventArgs e)
        {

        }
    }
}