using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using dominios;

namespace negocios
{
    public class MarcasNegocio
    {
        public DataTable obtenerMarcas()
        {
            ConexionSQL conexion = new ConexionSQL();
            DataTable dt = new DataTable();
            try
            {
                {
                    conexion.setearProcedure("ObtenerMarcasProductos");
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
        public bool agregarMarca(Marca m)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("AgregarMarca");
                conexion.setearParametro("@Descripcion", m.Descripcion);

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

        public bool modificarMarca(Marca m)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("ModificarMarca");
                conexion.setearParametro("@Id", m.Id);
                conexion.setearParametro("@Descripcion", m.Descripcion);

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
        public bool eliminarMarca(int IdMarca)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("EliminarMarcas");
                conexion.setearParametro("@Id", IdMarca);

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
    }
}
