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
    public class ProductoNegocio
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
        public bool agregarProducto(Producto p, int idCategoria, int idMarca)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("AgregarProducto");
                conexion.setearParametro("@Codigo", p.Codigo);
                conexion.setearParametro("@Descripcion", p.Descripcion);
                conexion.setearParametro("@PrevioVenta", p.PrevioVenta);
                conexion.setearParametro("@Costo", p.Costo);
                conexion.setearParametro("@IdCategoria", idCategoria);
                conexion.setearParametro("@IdMarca", idMarca);
                conexion.setearParametro("@Observaciones", p.Observaciones);

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

        public List<Producto> listarProductos()
        {
            List<Producto> lista = new List<Producto>();
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("ObtenerProductosTodos");
                conexion.ejecutarConexion();

                while (conexion.Lector.Read())
                {
                    Producto p = new Producto();

                    p.Id = (int)conexion.Lector["Id"];
                    p.Codigo = (string)conexion.Lector["Codigo"];
                    p.Descripcion = (string)conexion.Lector["Descripcion"];
                    p.PrevioVenta = (decimal)conexion.Lector["PrecioVenta"];
                    p.Costo = (decimal)conexion.Lector["Costo"];

                    p.Marca = new Marca();
                    p.Marca.Descripcion = (string)conexion.Lector["Marca"];
                    p.Marca.Id = (int)conexion.Lector["idMarca"];

                    p.Categoria = new CategoriaProducto();
                    p.Categoria.Categoria = (string)conexion.Lector["Categoria"];
                    p.Categoria.Id = (int)conexion.Lector["idCategoria"];

                    p.Observaciones = (string)conexion.Lector["Observaciones"];

                    lista.Add(p);
                }

                return lista;
            }
            catch (Exception ex)
            {
                lista = null;
                return lista;
            }
            finally
            {
                conexion.cerrarConexion();
            }
        }
    }
}
