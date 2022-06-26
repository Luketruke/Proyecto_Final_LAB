using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominios;

namespace negocios
{
    public class ProveedorNegocio
   {
        public DataTable obtenerProveedores()
    {
        ConexionSQL conexion = new ConexionSQL();
        DataTable dt = new DataTable();
        try
        {
            {
                conexion.setearProcedure("ObtenerProveedores");
                dt.Load(conexion.ejecutarConexion());
            }
            return dt;
        }
        catch (Exception ex)
        {
            dt = null;
            return dt;
        }
    }
   }
}

