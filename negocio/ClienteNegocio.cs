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
    public class ClienteNegocio
    {
        public bool agregarCliente(Cliente c)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("AgregarCliente");
                conexion.setearParametro("@Codigo", c.Codigo);
                conexion.setearParametro("@Nombres", c.Nombres);
                conexion.setearParametro("@Apellidos", c.Apellidos);
                conexion.setearParametro("@FechaNacimiento", c.FechaNacimiento);
                conexion.setearParametro("@Cuit", c.Cuit);
                conexion.setearParametro("@Domicilio", c.Domicilio);
                conexion.setearParametro("@Telefono", c.Telefono);
                conexion.setearParametro("@Email", c.Email);

                conexion.ejecutarConexion();

                return true;
            }
            catch (Exception)
            {
                return false;
            }
            finally
            {
                conexion.cerrarConexion();
            }
        }
        public DataTable obtenerClientesTodos()
        {
            ConexionSQL conexion = new ConexionSQL();
            DataTable dt = new DataTable();
            try
            {
                {
                    conexion.setearProcedure("ObtenerClientesTodos");
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
