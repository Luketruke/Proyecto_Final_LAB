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
        public bool agregarProducto(Producto p, int idCategoria, int idMarca)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("AgregarProducto");
                conexion.setearParametro("@Codigo", p.Codigo);
                conexion.setearParametro("@Descripcion", p.Descripcion);
                conexion.setearParametro("@PrevioVenta", p.PrecioVenta);
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
                    p.PrecioVenta = (decimal)conexion.Lector["PrecioVenta"];
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
        public bool modificarProducto(Producto p, int idCategoria, int idMarca)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("ModificarProducto");
                conexion.setearParametro("@Id", p.Id);
                conexion.setearParametro("@Codigo", p.Codigo);
                conexion.setearParametro("@Descripcion", p.Descripcion);
                conexion.setearParametro("@PrevioVenta", p.PrecioVenta);
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

        public bool eliminarProducto(int IdProducto)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("EliminarProducto");
                conexion.setearParametro("@Id", IdProducto);

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
