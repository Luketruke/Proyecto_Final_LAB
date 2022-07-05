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
    public class FacturasNegocio
    {
        public DataTable obtenerFormasDePago()
        {
            ConexionSQL conexion = new ConexionSQL();
            DataTable dt = new DataTable();
            try
            {
                conexion.setearProcedure("ObtenerFormasDePago");
                dt.Load(conexion.ejecutarConexion());

                return dt;
            }
            catch (Exception ex)
            {
                dt = null;
                return dt;
            }
        }

        public DataTable obtenerPuntosDeVenta(int idSucursal)
        {
            ConexionSQL conexion = new ConexionSQL();
            DataTable dt = new DataTable();
            try
            {
                conexion.setearProcedure("ObtenerPuntosDeVenta");
                conexion.setearParametro("@idSucursal", idSucursal);
                dt.Load(conexion.ejecutarConexion());

                return dt;
            }
            catch (Exception ex)
            {
                dt = null;
                return dt;
            }
        }
        public DataTable obtenerVendedoresFactura(int idSucursal)
        {
            ConexionSQL conexion = new ConexionSQL();
            DataTable dt = new DataTable();
            try
            {
                conexion.setearProcedure("ObtenerVendedoresFactura");
                conexion.setearParametro("@idSucursal", idSucursal);
                dt.Load(conexion.ejecutarConexion());

                return dt;
            }
            catch (Exception ex)
            {
                dt = null;
                return dt;
            }
        }
        public DataTable obtenerClientesFactura()
        {
            ConexionSQL conexion = new ConexionSQL();
            DataTable dt = new DataTable();
            try
            {
                conexion.setearProcedure("ObtenerClientesFactura");
                dt.Load(conexion.ejecutarConexion());

                return dt;
            }
            catch (Exception ex)
            {
                dt = null;
                return dt;
            }
        }

        public DataTable obtenerClientesFacturaFiltrados(string filtro)
        {
            ConexionSQL conexion = new ConexionSQL();
            DataTable dt = new DataTable();
            try
            {
                conexion.setearProcedure("ObtenerClientesFacturaFiltrados");
                conexion.setearParametro("@filtro", filtro);
                dt.Load(conexion.ejecutarConexion());

                return dt;
            }
            catch (Exception ex)
            {
                dt = null;
                return dt;
            }
        }
        public DataTable obtenerSucursales()
        {
            ConexionSQL conexion = new ConexionSQL();
            DataTable dt = new DataTable();
            try
            {
                conexion.setearProcedure("ObtenerSucursales");
                dt.Load(conexion.ejecutarConexion());

                return dt;
            }
            catch (Exception ex)
            {
                dt = null;
                return dt;
            }
        }
        public string obtenerNumeroFactura(int idPuntoVenta, int idTipoDocumento)
        {
            ConexionSQL conexion = new ConexionSQL();
            DataTable dt = new DataTable();
            try
            {
                conexion.setearProcedure("ObtenerNumeroFactura");
                conexion.setearParametro("@idPuntoDeVenta", idPuntoVenta);
                conexion.setearParametro("@idTipoDocumento", idTipoDocumento);
                dt.Load(conexion.ejecutarConexion());

                string numeroFactura = dt.Rows[0]["Factura"].ToString();
                return numeroFactura;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public int obtenerTipoClienteEspecifico(int idCliente)
        {
            ConexionSQL conexion = new ConexionSQL();
            DataTable dt = new DataTable();
            try
            {
                conexion.setearProcedure("ObtenerTipoClienteEspecifico");
                conexion.setearParametro("@idCliente", idCliente);
                dt.Load(conexion.ejecutarConexion());

                int tipoCliente = Convert.ToInt32(dt.Rows[0]["idTipoCliente"]);
                return tipoCliente;
            }
            catch (Exception ex)
            {
                dt = null;
                return -1;
            }
        }    
        public int agregarFactura(Factura f, int idCliente, int idVendedor, int idFormaPago, int idSucursal, int idPuntoVenta, int idTipoDocumento)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("AgregarFactura");
                conexion.setearParametro("@NumeroFactura", f.NumeroFactura);
                conexion.setearParametro("@idCliente", idCliente);
                conexion.setearParametro("@idVendedor", idVendedor);
                conexion.setearParametro("@idFormaDePago", idFormaPago);
                conexion.setearParametro("@Subtotal", f.SubTotal);
                conexion.setearParametro("@Descuento", f.Descuento);
                conexion.setearParametro("@Total", f.Total);
                conexion.setearParametro("@Fecha", f.Fecha);
                conexion.setearParametro("@Observaciones", f.Observaciones);
                conexion.setearParametro("@idSucursal", idSucursal);
                conexion.setearParametro("@idTipoDocumento", idTipoDocumento);
                conexion.setearParametro("@idPuntoDeVenta", idPuntoVenta);
                SqlCommand command = conexion.ejecutarComando();

                //int idFactura = (int)command.ExecuteScalar();
                int idFactura = 1;

                return idFactura;
            }
            catch (Exception ex)
            {
                return -1;
            }
        }

        public List<Producto> listarProductosFactura()
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
