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
    public partial class CategoriasABM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                alerta();
                if (Session["dtCategorias"] == null)
                {
                    CategoriasNegocio cn = new CategoriasNegocio();
                    Session.Add("dtCategorias", cn.obtenerCategorias());
                }

                dgvCategorias.DataSource = Session["dtCategorias"];
                dgvCategorias.DataBind();

                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    DataTable dtTemp = (DataTable)Session["dtCategorias"];
                    btnAgregar.Visible = false;
                    btnModificarOk.Visible = true;
                    for (int i = 0; i < dtTemp.Rows.Count; i++)
                    {
                        if (Convert.ToInt32(dtTemp.Rows[i]["Id"])==id && !IsPostBack)
                        {
                            txtCategoria.Text = dtTemp.Rows[i]["Descripcion"].ToString();
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
            CategoriasNegocio cn = new CategoriasNegocio();
            CategoriaProducto c = new CategoriaProducto();
            try
            {
                c.Categoria = txtCategoria.Text;

                if (cn.agregarCategoria(c))
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                        "swal('Categoria agregada', '', 'success')", true);

                    Session["dtCategorias"] = null;
                    Session["alerta"] = "agregado";
                    Response.Redirect("CategoriasABM.aspx");

                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        public void btnModificarOk_Click(object sender, EventArgs e)
        {
            CategoriasNegocio cn = new CategoriasNegocio();
            CategoriaProducto c = new CategoriaProducto();
            try
            {
                c.Id = int.Parse(Request.QueryString["id"].ToString());
                c.Categoria = txtCategoria.Text;

                if (cn.modificarCategoria(c))
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                        "swal('Categoria modificada', '', 'success')", true);

                    Session["dtCategorias"] = null;
                    Session["alerta"] = "modificado";
                    Response.Redirect("CategoriasABM.aspx");
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
                Response.Redirect("CategoriasABM.aspx?id=" + id);
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
                CategoriasNegocio cn = new CategoriasNegocio();
                GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
                GridView gv = clickedRow.NamingContainer as GridView;
                var id = gv.DataKeys[clickedRow.RowIndex].Values[0].ToString();
                cn.eliminarCategoria(Convert.ToInt32(id));
                Session["alerta"] = "eliminado";
                Session["dtCategorias"] = null;
                Response.Redirect("CategoriasABM.aspx");
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
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "SomeKey", "toastr['success']('Categoria agregada')", true);
                    Session["alerta"] = null;
                    break;
                case "eliminado":
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "SomeKey", "toastr['warning']('Categoria eliminada')", true);
                    Session["alerta"] = null;
                    break;
                case "modificado":
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "SomeKey", "toastr['success']('Categoria modificada')", true);
                    Session["alerta"] = null;
                    break;
            }
        }
    }
}