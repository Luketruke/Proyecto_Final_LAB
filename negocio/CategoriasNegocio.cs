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
    public class CategoriasNegocio
    {
        public DataTable obtenerCategorias()
        {
            ConexionSQL conexion = new ConexionSQL();
            DataTable dt = new DataTable();
            try
            {
                {
                    conexion.setearProcedure("ObtenerCategoriasProductos");
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
        public bool agregarCategoria(CategoriaProducto c)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("AgregarCategoria");
                conexion.setearParametro("@Descripcion", c.Categoria);

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
        public bool modificarCategoria(CategoriaProducto c)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("ModificarCategoria");
                conexion.setearParametro("@Id", c.Id);
                conexion.setearParametro("@Descripcion", c.Categoria);

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
        public bool eliminarCategoria(int IdCategoria)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("EliminarCategoria");
                conexion.setearParametro("@Id", IdCategoria);

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
