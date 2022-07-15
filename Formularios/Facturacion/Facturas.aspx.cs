using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Microsoft.Reporting.WebForms;
using negocios;
using dominios;

namespace Proyecto_Final_LAB.Formularios.Facturacion
{
    public partial class Facturas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                    Session["listaFacturas"] = null;

                alerta();
                if (Session["listaFacturas"] == null)
                {
                    FacturasNegocio fn = new FacturasNegocio();
                    Session.Add("listaFacturas", fn.obtenerFacturasTodas());
                }
                dgvFacturas.DataSource = Session["listaFacturas"];
                dgvFacturas.DataBind();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("FacturacionABM.aspx");
        }

        protected void btnFactura_Click(object sender, EventArgs e)
        {
            try
            {
                Warning[] warnings;
                string[] streamIds;
                string mimeType = string.Empty;
                string encoding = string.Empty;
                string extension = string.Empty;

                FacturasNegocio fn = new FacturasNegocio();
                GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
                GridView gv = clickedRow.NamingContainer as GridView;
                var id = gv.DataKeys[clickedRow.RowIndex].Values[0].ToString();

                DataTable dtDatosFactura = new DataTable();
                DataTable dtItemsFactura = new DataTable();

                dtDatosFactura = fn.obtenerDatosFacturaImpresion(Convert.ToInt32(id));
                dtItemsFactura = fn.obtenerItemsFacturaImpresion(Convert.ToInt32(id));

                if (dtDatosFactura.Rows[0]["tipoDocumento"].ToString()=="Factura A")
                {
                    FacturaRA.LocalReport.DataSources.Add(new ReportDataSource("DatosFactura", dtDatosFactura));
                    FacturaRA.LocalReport.DataSources.Add(new ReportDataSource("ItemsFactura", dtItemsFactura));
                    FacturaRA.LocalReport.ReportPath=Server.MapPath("~/Reportes/FacturaRA.rdlc");
                    FacturaRA.LocalReport.EnableHyperlinks = true;
                    byte[] bytes = FacturaRA.LocalReport.Render("PDF", null, out mimeType, out encoding, out extension, out streamIds, out warnings);

                    Response.Buffer = true;
                    Response.Clear();
                    Response.AddHeader("content-disposition", "inline; filename=FacturaRA." + extension); //attachment para descargar el archivo, inline para que sea en new tab
                    Response.ContentType = mimeType;
                    Response.BinaryWrite(bytes);
                    Response.End();
                }
                else if (dtDatosFactura.Rows[0]["tipoDocumento"].ToString()=="Factura B")
                {
                    FacturaRB.LocalReport.DataSources.Add(new ReportDataSource("DatosFactura", dtDatosFactura));
                    FacturaRB.LocalReport.DataSources.Add(new ReportDataSource("ItemsFactura", dtItemsFactura));
                    FacturaRB.LocalReport.ReportPath=Server.MapPath("~/Reportes/FacturaRB.rdlc");
                    FacturaRB.LocalReport.EnableHyperlinks = true;
                    byte[] bytes = FacturaRB.LocalReport.Render("PDF", null, out mimeType, out encoding, out extension, out streamIds, out warnings);

                    Response.Buffer = true;
                    Response.Clear();
                    Response.AddHeader("content-disposition", "inline; filename=FacturaRB." + extension); //attachment para descargar el archivo, inline para que sea en new tab
                    Response.ContentType = mimeType;
                    Response.BinaryWrite(bytes);
                    Response.End();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        protected void alerta()
        {
            switch (Session["alerta"])
            {
                case "agregado":
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "SomeKey", "toastr['success']('Factura agregada')", true);
                    Session["alerta"] = null;
                    break;
                case "cancelado":
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "SomeKey", "toastr['warning']('Factura cancelada')", true);
                    Session["alerta"] = null;
                    break;
                case "eliminado":
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "SomeKey", "toastr['warning']('Factura eliminada')", true);
                    Session["alerta"] = null;
                    break;
            }
        }
    }
}