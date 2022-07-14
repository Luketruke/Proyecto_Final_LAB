using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominios;
using negocios;

namespace negocios
{
    public class CompraNegocio
    {
        public DataTable obtenerProveedoresCompra()
        {
            ConexionSQL conexion = new ConexionSQL();
            DataTable dt = new DataTable();
            try
            {
                conexion.setearProcedure("ObtenerProveedoresCompra");
                dt.Load(conexion.ejecutarConexion());

                return dt;
            }
            catch (Exception ex)
            {
                dt = null;
                return dt;
            }
            finally
            {
                conexion.cerrarConexion();
            }
        }



    }
}
