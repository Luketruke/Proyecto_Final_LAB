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
    public class StockNegocio
    {
        public bool agregarStock(Stock s)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("AgregarStock");
                conexion.setearParametro("@idProducto", s.Producto.Id);
                conexion.setearParametro("@StockMinimo", s.StockMinimo);
                conexion.setearParametro("@IdSucursal", s.Sucursal.Id);

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
        public bool modificarStock(int IdStock, int Cantidad)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("ModificarStock");
                conexion.setearParametro("@IdStock", IdStock);
                conexion.setearParametro("@Cantidad", Cantidad);

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
        public int modificarStockFactura(int IdProducto, int Cantidad, int IdSucursal)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("ModificarStockFactura");
                conexion.setearParametro("@IdProducto", IdProducto);
                conexion.setearParametro("@Cantidad", Cantidad);
                conexion.setearParametro("@IdSucursal", IdSucursal);

                int idStock = conexion.ejecutarScalar();

                return idStock;
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
        public bool agregarMovimientoStock(int IdStock, int Cantidad)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("AgregarMovimientoStock");
                conexion.setearParametro("@IdStock", IdStock);
                conexion.setearParametro("@Cantidad", Cantidad);

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
        public bool agregarMovimientoStockFactura(int IdProducto, int IdStock, int Cantidad, int IdSucursal)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("AgregarMovimientoStock");
                conexion.setearParametro("@IdProducto", IdProducto);
                conexion.setearParametro("@IdStock", IdStock);
                conexion.setearParametro("@Cantidad", Cantidad);
                conexion.setearParametro("@IdSucursal", IdSucursal);

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
        public List<Sucursal> obtenerSucursales()
        {
            List<Sucursal> lista = new List<Sucursal>();
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("ObtenerSucursales");
                conexion.ejecutarConexion();

                while (conexion.Lector.Read())
                {
                    Sucursal s = new Sucursal();

                    s.Id = (int)conexion.Lector["Id"];
                    s.Nombre = (string)conexion.Lector["Nombre"];

                    lista.Add(s);
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
        public List<Stock> obtenerStockProductos(int IdProducto)
        {
            List<Stock> lista = new List<Stock>();
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("ObtenerStockProductos");
                conexion.setearParametro("@idProducto", IdProducto);
                conexion.ejecutarConexion();

                while (conexion.Lector.Read())
                {
                    Stock s = new Stock();

                    s.Id = (int)conexion.Lector["Id"];
                    s.Producto = new Producto();
                    s.Producto.Id = (int)conexion.Lector["IdProducto"];
                    s.Producto.Descripcion = (string)conexion.Lector["Descripcion"];
                    s.StockActual = (int)conexion.Lector["StockActual"];
                    s.StockMinimo = (int)conexion.Lector["StockMinimo"];
                    s.Sucursal = new Sucursal();
                    s.Sucursal.Id = (int)conexion.Lector["idSucursal"];
                    s.Sucursal.Nombre = (string)conexion.Lector["NombreSucursal"];

                    lista.Add(s);
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

        public List<Stock> obtenerStockHistorico(int IdStock)
        {
            List<Stock> lista = new List<Stock>();
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("ObtenerStockHistorico");
                conexion.setearParametro("@IdStock", IdStock);
                conexion.ejecutarConexion();

                while (conexion.Lector.Read())
                {
                    Stock s = new Stock();

                    s.Id = (int)conexion.Lector["Id"];
                    s.Producto = new Producto();
                    s.Producto.Descripcion = (string)conexion.Lector["Descripcion"];
                    s.StockActual = (int)conexion.Lector["Cantidad"];
                    s.Sucursal = new Sucursal();
                    s.Sucursal.Nombre = (string)conexion.Lector["NombreSucursal"];
                    s.FechaMovStock = (DateTime)conexion.Lector["Fecha"];

                    lista.Add(s);
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
