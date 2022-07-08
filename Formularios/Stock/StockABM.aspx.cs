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
                alerta();
                int idProducto = Convert.ToInt32(Request.QueryString["idProducto"]);
                int StockTotal = 0;
                Session["listaStock"] = null;
                Session["idStock"] = null;
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
        //Luego se va a agregar un historico general para el producto, este va a ser solo por sucursal.
        protected void btnStockHistorico_Click(object sender, EventArgs e)
        {
            StockNegocio sn = new StockNegocio();
            GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
            GridView gv = clickedRow.NamingContainer as GridView;
            var id = gv.DataKeys[clickedRow.RowIndex].Values[0].ToString();
            Session["idStock"] = id.ToString();

            dgvStockHistorico.DataSource = sn.obtenerStockHistorico(Convert.ToInt32(id));
            dgvStockHistorico.DataBind();

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "modalStockHistorico", "openModalStockHistorico('show')", true);
        }
        protected void btnEditarStock_Click(object sender, EventArgs e)
        {
            StockNegocio sn = new StockNegocio();
            GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
            GridView gv = clickedRow.NamingContainer as GridView;
            var id = gv.DataKeys[clickedRow.RowIndex].Values[0].ToString();
            Session["idStock"] = id.ToString();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "modalModificarStock", "openModal('show')", true);
        }
        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            StockNegocio sn = new StockNegocio();
            int id = Convert.ToInt32(Session["idStock"]);
            int cantidad = Convert.ToInt32(txtStockAgregar.Text);
            if (sn.modificarStock(id, cantidad))
            {
                if (sn.agregarMovimientoStock(id, cantidad))
                {
                    Session["listaStock"] = null;
                    Session["alerta"] = "modificado";
                    int idProducto = Convert.ToInt32(Request.QueryString["idProducto"]);
                    Response.Redirect("../Stock/StockABM.aspx?idProducto=" + idProducto);
                }
                else
                {
                    string script = String.Format(@"<script type='text/javascript'>alert('Error al agregar stock' );</script>", "0033");
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                }
            }
            else
            {
                string script = String.Format(@"<script type='text/javascript'>alert('Error al agregar stock' );</script>", "0033");
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }
        }
        protected void alerta()
        {
            switch (Session["alerta"])
            {
                case "modificado":
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "SomeKey", "toastr['success']('Stock modificado')", true);
                    Session["alerta"] = null;
                    break;
            }
        }
    }
}