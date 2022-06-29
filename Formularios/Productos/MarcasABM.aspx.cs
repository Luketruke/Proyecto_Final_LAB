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
            if (Session["dtMarca"] == null)
            {
                ProductoNegocio pn = new ProductoNegocio();
                Session.Add("dtMarca", pn.obtenerMarcas());
            }

            dgvMarcas.DataSource = Session["dtMarca"];
            dgvMarcas.DataBind();

            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                DataTable dtTemp = (DataTable)Session["dtMarca"];
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
        public void btnAgregar_Click(object sender, EventArgs e)
        {
            ProductoNegocio pn = new ProductoNegocio();
            Marca m = new Marca();

            m.Descripcion = txtMarca.Text;

            if (pn.agregarMarca(m))
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                    "swal('Marca agregada', '', 'success')", true);

                Session["dtMarca"] = null;

                Response.Redirect("MarcasABM.aspx");
            }
        }
        public void btnModificarOk_Click(object sender, EventArgs e)
        {
            ProductoNegocio pn = new ProductoNegocio();
            Marca m = new Marca();

            m.Id = int.Parse(Request.QueryString["id"].ToString());
            m.Descripcion = txtMarca.Text;

            if (pn.modificarMarca(m))
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert",
                    "swal('Marca modificada', '', 'success')", true);

                Session["dtMarca"] = null;

                Response.Redirect("MarcasABM.aspx");
            }
        }
        protected void btnModificar_Click(object sender, EventArgs e)
        {
            GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
            GridView gv = clickedRow.NamingContainer as GridView;
            var id = gv.DataKeys[clickedRow.RowIndex].Values[0].ToString();
            Response.Redirect("MarcasABM.aspx?id=" + id);
        }

        //Falta el cartel de confirmacion y la funcion.
        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            GridViewRow clickedRow = ((LinkButton)sender).NamingContainer as GridViewRow;
            GridView gv = clickedRow.NamingContainer as GridView;
            var id = gv.DataKeys[clickedRow.RowIndex].Values[0].ToString();

        }

    }
}