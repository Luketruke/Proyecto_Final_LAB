﻿using System;
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
    public partial class CompraProveedores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    CompraNegocio CN = new CompraNegocio();
                    ListItem li;
                    DataTable dtProveedor = CN.obtenerProveedoresCompra();
                    ddlProveedores.Items.Add("Seleccione...");



                    txtFechaTicket.Text = DateTime.Now.ToString("yyyy-MM-dd");


                    foreach (DataRow r in dtProveedor.Rows)
                    {
                        li = new ListItem(r["nombreProveedor"].ToString(), r["Id"].ToString());
                        ddlProveedores.Items.Add(li);
                    }

                }
            }
            catch (Exception ex)
            {

            }

        }
}

}
  