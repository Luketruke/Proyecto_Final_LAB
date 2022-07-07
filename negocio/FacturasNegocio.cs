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
            finally
            {
                conexion.cerrarConexion();
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
            finally
            {
                conexion.cerrarConexion();
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
            finally
            {
                conexion.cerrarConexion();
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
            finally
            {
                conexion.cerrarConexion();
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
            finally
            {
                conexion.cerrarConexion();
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
            finally
            {
                conexion.cerrarConexion();
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
            finally
            {
                conexion.cerrarConexion();
            }
        }
        public string obtenerTipoFactura(int idTipoDocumento)
        {
            ConexionSQL conexion = new ConexionSQL();
            DataTable dt = new DataTable();
            try
            {
                conexion.setearProcedure("ObtenerTipoFactura");
                conexion.setearParametro("@idTipoDocumento", idTipoDocumento);
                dt.Load(conexion.ejecutarConexion());

                string tipoDocumento = dt.Rows[0]["tipoDocumento"].ToString();
                return tipoDocumento;
            }
            catch (Exception ex)
            {
                return null;
            }
            finally
            {
                conexion.cerrarConexion();
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
            finally
            {
                conexion.cerrarConexion();
            }
        }
        public int agregarFactura(Factura f)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("AgregarFactura");
                conexion.setearParametro("@NumeroFactura", f.NumeroFactura);
                conexion.setearParametro("@idCliente", f.Cliente.Id);
                conexion.setearParametro("@idVendedor", f.Vendedor.Id);
                conexion.setearParametro("@idFormaDePago", f.FormaPago.Id);
                conexion.setearParametro("@Subtotal", f.SubTotal);
                conexion.setearParametro("@Descuento", f.Descuento);
                conexion.setearParametro("@Total", f.Total);
                conexion.setearParametro("@Fecha", f.Fecha);
                conexion.setearParametro("@Observaciones", f.Observaciones);
                conexion.setearParametro("@idSucursal", f.Sucursal.Id);
                conexion.setearParametro("@idTipoDocumento", f.TipoDocumento.Id);
                conexion.setearParametro("@idPuntoDeVenta", f.PuntoVenta.Id);

                int idFactura = conexion.ejecutarScalar();
        
                return idFactura;
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

        public bool agregarItemsFactura(ItemFactura i, int idFactura)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("AgregarItemFactura");
                conexion.setearParametro("@idFactura", idFactura);
                conexion.setearParametro("@idProducto", i.IdProducto);
                conexion.setearParametro("@Cantidad", i.Cantidad);
                conexion.setearParametro("@Subtotal", i.SubTotal);
                conexion.setearParametro("@Descuento", i.Descuento);
                conexion.setearParametro("@Total", i.PrecioTotal);
                conexion.setearParametro("@codigo", i.Codigo);
                conexion.setearParametro("@PrecioUnitario", i.PrecioVenta);
                conexion.setearParametro("@Descripcion", i.Descripcion);

                SqlCommand command = conexion.ejecutarComando();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
            finally
            {
                conexion.cerrarConexion();
            }
        }

        public bool modificarNumeracion(int idTipoDocumento, int idPuntoVenta)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("ModificarNumeracion");
                conexion.setearParametro("@idTipoDocumento", idTipoDocumento);
                conexion.setearParametro("@idPuntoVenta", idPuntoVenta);

                SqlCommand command = conexion.ejecutarComando();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
            finally
            {
                conexion.cerrarConexion();
            }
        }

        public bool anularFacturaFallada(int idFactura)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("AnularFacturaFallada");
                conexion.setearParametro("@idFactura", idFactura);

                SqlCommand command = conexion.ejecutarComando();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
            finally
            {
                conexion.cerrarConexion();
            }
        }
        public List<Factura> obtenerFacturasTodas()
        {
            List<Factura> lista = new List<Factura>();
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("ObtenerFacturasTodas");
                conexion.ejecutarConexion();

                while (conexion.Lector.Read())
                {
                    Factura f = new Factura();

                    f.Id = (int)conexion.Lector["Id"];
                    f.NumeroFactura = (string)conexion.Lector["NumeroFactura"];
                    f.Fecha = (DateTime)conexion.Lector["Fecha"];
                    f.TipoDocumento = new TipoDocumento();
                    f.TipoDocumento.Tipo = (string)conexion.Lector["TipoDocumento"];
                    f.Cliente = new Cliente();
                    f.Cliente.NombreCompleto = (string)conexion.Lector["NombreCompleto"];
                    f.SubTotal = (decimal)conexion.Lector["SubTotal"];
                    f.Descuento = (decimal)conexion.Lector["Descuento"];
                    f.Total = (decimal)conexion.Lector["Total"];

                    lista.Add(f);
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
