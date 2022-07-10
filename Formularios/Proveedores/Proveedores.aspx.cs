using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocios;
using dominios;

namespace Proyecto_Final_LAB.Formularios.Proveedores
{
    public partial class ProveedoresABM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Session["listaProveedores"] = null;
                alerta();
                if (Session["listaProveedores"] == null)
                {
                    ProveedorNegocio pn = new ProveedorNegocio();
                    Session.Add("listaProveedores", pn.listar());
                }
                dgvProveedores.DataSource = Session["listaProveedores"];
                dgvProveedores.DataBind();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
            Title = "Proveedores";
        }

        protected void dgvProveedores_SelectedIndexChanged(object sender, EventArgs e)
        {
            var Id = dgvProveedores.SelectedDataKey.Value.ToString();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                ProveedorNegocio pn = new ProveedorNegocio();
                GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
                GridView gv = clickedRow.NamingContainer as GridView;
                var id = gv.DataKeys[clickedRow.RowIndex].Values[0].ToString();
                pn.eliminarProveedor(Convert.ToInt32(id));
                Session["alerta"] = "eliminado";
                Session["listaProveedores"] = null;
                Response.Redirect("Proveedores.aspx");
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
                GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
                GridView gv = clickedRow.NamingContainer as GridView;
                var id = gv.DataKeys[clickedRow.RowIndex].Values[0].ToString();
                Response.Redirect("ProveedoresABM.aspx?accion=2&id=" + id);
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
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "SomeKey", "toastr['success']('Proveedor agregado')", true);
                    Session["alerta"] = null;
                    break;
                case "eliminado":
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "SomeKey", "toastr['warning']('Proveedor eliminado')", true);
                    Session["alerta"] = null;
                    break;
                case "modificado":
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "SomeKey", "toastr['success']('Proveedor modificado')", true);
                    Session["alerta"] = null;
                    break;
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProveedoresABM.aspx?accion=1");
        }

        /*
       
        */


        protected void btnExcel_Click(object sender, EventArgs e)
        {
            Response.ClearContent();
            Response.AddHeader("content-disposition", "attachment;filename=Proveedores.xls");
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application / vnd.xls";
           //application / vnd.pdf
            System.IO.StringWriter stringWrite = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);

            dgvProveedores.RenderControl(htmlWrite);
            Response.Write(stringWrite.ToString());
            Response.End();
        }


        public override void VerifyRenderingInServerForm(Control control)
        {
        }
    }
    }
   
