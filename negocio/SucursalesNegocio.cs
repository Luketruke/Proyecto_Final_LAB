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
    public class SucursalesNegocio
    {
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
                    s.Direccion = (string)conexion.Lector["Direccion"];
                    s.Localidad = (string)conexion.Lector["Localidad"];
                    s.CodigoPostal = (string)conexion.Lector["CodigoPostal"];
                    s.DireccionCompleta = (string)conexion.Lector["DireccionCompleta"];

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
        public DataTable obtenerSucursalesFactura()
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
        public bool agregarSucursal(Sucursal s)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("AgregarSucursal");
                conexion.setearParametro("@Nombre", s.Nombre);
                conexion.setearParametro("@Direccion", s.Direccion);
                conexion.setearParametro("@Localidad", s.Localidad);
                conexion.setearParametro("@CodigoPostal", s.CodigoPostal);
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
        public bool modificarSucursal(Sucursal s)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("ModificarSucursal");
                conexion.setearParametro("@IdSucursal", s.Id);
                conexion.setearParametro("@Nombre", s.Nombre);
                conexion.setearParametro("@Direccion", s.Direccion);
                conexion.setearParametro("@Localidad", s.Localidad);
                conexion.setearParametro("@CodigoPostal", s.CodigoPostal);
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
        public bool eliminarSucursal(int IdSucursal)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("EliminarSucursal");
                conexion.setearParametro("@Id", IdSucursal);
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
        public List<PuntoVenta> obtenerPuntosDeVenta(int IdSucursal)
        {
            List<PuntoVenta> lista = new List<PuntoVenta>();
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("ObtenerPuntosDeVenta");
                conexion.setearParametro("@idSucursal", IdSucursal);
                conexion.ejecutarConexion();

                while (conexion.Lector.Read())
                {
                    PuntoVenta pv = new PuntoVenta();

                    pv.Id = (int)conexion.Lector["Id"];
                    pv.Nombre = (string)conexion.Lector["nombrePuntoVenta"];
                    pv.Numero = (string)conexion.Lector["Numero"];
                    pv.Sucursal = new Sucursal();
                    pv.Sucursal.DireccionCompleta = (string)conexion.Lector["Direccion"];
                    pv.Sucursal.Nombre = (string)conexion.Lector["NombreSucursal"];
               
                    lista.Add(pv);
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
        public DataTable obtenerPuntosDeVentaFactura(int idSucursal)
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
        public int agregarPuntoVenta(PuntoVenta pv)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("AgregarPuntoDeVenta");
                conexion.setearParametro("@Numero", pv.Numero);
                conexion.setearParametro("@Nombre", pv.Nombre);
                conexion.setearParametro("@IdSucursal", pv.Sucursal.Id);

                int idPv = conexion.ejecutarScalar();

                return idPv;
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
        public bool modificarPuntoVenta(PuntoVenta pv)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("ModificarPuntoDeVenta");
                conexion.setearParametro("@Numero", pv.Numero);
                conexion.setearParametro("@Nombre", pv.Nombre);

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
        public bool eliminarPuntoVenta(int id)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("EliminarPuntoDeVenta");
                conexion.setearParametro("@IdPuntoVenta", id);
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
        public bool agregarNumeracion(int pv)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("AgregarNumeracionDocumentos");
                conexion.setearParametro("@IdPuntoVenta", pv);
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
