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
        public int agregarProducto(Producto p)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("AgregarProducto");
                conexion.setearParametro("@Codigo", p.Codigo);
                conexion.setearParametro("@Descripcion", p.Descripcion);
                conexion.setearParametro("@PrevioVenta", p.PrecioVenta);
                conexion.setearParametro("@Costo", p.Costo);
                conexion.setearParametro("@IdCategoria", p.Categoria.Id);
                conexion.setearParametro("@IdMarca", p.Marca.Id);
                conexion.setearParametro("@Observaciones", p.Observaciones);

                int idProducto = conexion.ejecutarScalar();

                return idProducto;
            }
            catch (Exception)
            {
                return -1;
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
                conexion.setearParametro("@IdSucursal", 0);
                conexion.ejecutarConexion();

                while (conexion.Lector.Read())
                {
                    Producto p = new Producto();

                    p.Id = (int)conexion.Lector["Id"];
                    p.Codigo = (int)conexion.Lector["Codigo"];
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
        public List<Producto> listarProductosFactura(int IdSucursal)
        {
            List<Producto> lista = new List<Producto>();
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("ObtenerProductosTodos");
                conexion.setearParametro("@IdSucursal", IdSucursal);
                conexion.ejecutarConexion();

                while (conexion.Lector.Read())
                {
                    Producto p = new Producto();

                    p.Id = (int)conexion.Lector["Id"];
                    p.Codigo = (int)conexion.Lector["Codigo"];
                    p.Descripcion = (string)conexion.Lector["Descripcion"];
                    p.PrecioVenta = (decimal)conexion.Lector["PrecioVenta"];
                    p.Stock = new Stock();
                    p.Stock.StockActual = (int)conexion.Lector["StockActual"];

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
        public List<Producto> listarProductosFacturaFiltrados(string filtro, int IdSucursal)
        {
            List<Producto> lista = new List<Producto>();
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("ObtenerProductosFiltrados");
                conexion.setearParametro("@filtro", filtro);
                conexion.setearParametro("@IdSucursal", IdSucursal);
                conexion.ejecutarConexion();

                while (conexion.Lector.Read())
                {
                    Producto p = new Producto();

                    p.Id = (int)conexion.Lector["Id"];
                    p.Codigo = (int)conexion.Lector["Codigo"];
                    p.Descripcion = (string)conexion.Lector["Descripcion"];
                    p.PrecioVenta = (decimal)conexion.Lector["PrecioVenta"];
                    p.Stock = new Stock();
                    p.Stock.StockActual = (int)conexion.Lector["StockActual"];

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
        public int obtenerUltimoCodigo()
        {
            ConexionSQL conexion = new ConexionSQL();
            DataTable dt = new DataTable();
            try
            {
                conexion.setearProcedure("ObtenerUltimoCodigoProducto");
                dt.Load(conexion.ejecutarConexion());

                int codigo = Convert.ToInt32(dt.Rows[0]["Codigo"]);

                return codigo;
            }
            catch (Exception ex)
            {
                return -1;
            }
            finally
            {
                conexion.cerrarConexion();
            }
        }
    }
}
