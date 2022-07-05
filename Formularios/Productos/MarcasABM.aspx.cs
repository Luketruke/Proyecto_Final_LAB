using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocios;
using dominios;

namespace Proyecto_Final_LAB.Formularios.Productos
{
    public partial class MarcasABM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                alerta();
                if (Session["dtMarcas"] == null)
                {
                    ProductoNegocio pn = new ProductoNegocio();
                    Session.Add("dtMarcas", pn.obtenerMarcas());
                }

                dgvMarcas.DataSource = Session["dtMarcas"];
                dgvMarcas.DataBind();

                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    DataTable dtTemp = (DataTable)Session["dtMarcas"];
                    btnAgregar.Visible = false;
                    btnModificarOk.Visible = true;
                    for (int i = 0; i < dtTemp.Rows.Count; i++)
                    {
                        if (Convert.ToInt32(dtTemp.Rows[i]["Id"])==id && !IsPostBack)
                        {
                            txtMarca.Text = dtTemp.Rows[i]["Descripcion"].ToString();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        public void btnAgregar_Click(object sender, EventArgs e)
        {
            ProductoNegocio pn = new ProductoNegocio();
            Marca m = new Marca();
            try
            {
                m.Descripcion = txtMarca.Text;

                if (pn.agregarMarca(m))
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                        "swal('Marca agregada', '', 'success')", true);

                    Session["dtMarcas"] = null;
                    Session["alerta"] = "agregado";
                    Response.Redirect("MarcasABM.aspx");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        public void btnModificarOk_Click(object sender, EventArgs e)
        {
            ProductoNegocio pn = new ProductoNegocio();
            Marca m = new Marca();
            try
            {
                m.Id = int.Parse(Request.QueryString["id"].ToString());
                m.Descripcion = txtMarca.Text;

                if (pn.modificarMarca(m))
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                        "swal('Marca modificada', '', 'success')", true);

                    Session["dtMarcas"] = null;
                    Session["alerta"] = "modificado";
                    Response.Redirect("MarcasABM.aspx");
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
                GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
                GridView gv = clickedRow.NamingContainer as GridView;
                var id = gv.DataKeys[clickedRow.RowIndex].Values[0].ToString();
                Response.Redirect("MarcasABM.aspx?id=" + id);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                ProductoNegocio pn = new ProductoNegocio();
                GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
                GridView gv = clickedRow.NamingContainer as GridView;
                var id = gv.DataKeys[clickedRow.RowIndex].Values[0].ToString();
                pn.eliminarMarca(Convert.ToInt32(id));
                Session["alerta"] = "eliminado";
                Session["dtMarcas"] = null;
                Response.Redirect("MarcasABM.aspx");
            }
            catch (Exception ex)
            {

            }
        }
        protected void alerta()
        {
            switch (Session["alerta"])
            {
                case "agregado":
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "SomeKey", "toastr['success']('Marca agregada')", true);
                    Session["alerta"] = null;
                    break;
                case "eliminado":
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "SomeKey", "toastr['warning']('Marca eliminada')", true);
                    Session["alerta"] = null;
                    break;
                case "modificado":
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "SomeKey", "toastr['success']('Marca modificada')", true);
                    Session["alerta"] = null;
                    break;
            }
        }

    }
}