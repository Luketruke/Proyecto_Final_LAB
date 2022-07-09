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
    public class VendedoresNegocio
    {
        public bool agregarVendedor(Vendedor v)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("AgregarVendedor");
                conexion.setearParametro("@Codigo", v.Codigo);
                conexion.setearParametro("@Nombres", v.Nombres);
                conexion.setearParametro("@Apellidos", v.Apellidos);
                conexion.setearParametro("@Telefono", v.Telefono);
                conexion.setearParametro("@Email", v.Email);
                conexion.setearParametro("@FechaAlta", v.FechaAlta);
                conexion.setearParametro("@IdSucursal", v.Sucursal.Id);
                conexion.setearParametro("@PorcentajeXVenta", v.PorcentajeXVenta);

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
        public bool modificarVendedor(Vendedor v)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("ModificarVendedor");
                conexion.setearParametro("@Id", v.Id);
                conexion.setearParametro("@Nombres", v.Nombres);
                conexion.setearParametro("@Apellidos", v.Apellidos);
                conexion.setearParametro("@Telefono", v.Telefono);
                conexion.setearParametro("@Email", v.Email);
                conexion.setearParametro("@FechaAlta", v.FechaAlta);
                conexion.setearParametro("@IdSucursal", v.Sucursal.Id);
                conexion.setearParametro("@PorcentajeXVenta", v.PorcentajeXVenta);

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
        public bool eliminarVendedor(int IdVendedor)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("EliminarVendedor");
                conexion.setearParametro("@Id", IdVendedor);

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
        public List<Vendedor> obtenerVendedoresTodos()
        {
            List<Vendedor> lista = new List<Vendedor>();
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("ObtenerVendedoresTodos");
                conexion.ejecutarConexion();

                while (conexion.Lector.Read())
                {
                    Vendedor v = new Vendedor();

                    v.Id = (int)conexion.Lector["IdVendedor"];
                    v.Codigo = (int)conexion.Lector["Codigo"];
                    v.Nombres = (string)conexion.Lector["Nombres"];
                    v.Apellidos = (string)conexion.Lector["Apellidos"];
                    v.Telefono = (string)conexion.Lector["Telefono"];
                    v.Email = (string)conexion.Lector["Email"];
                    v.NombreCompleto = (string)conexion.Lector["NombreCompleto"];
                    v.FechaAlta = (DateTime)conexion.Lector["FechaAlta"];
                    v.Sucursal = new Sucursal();
                    v.Sucursal.Id = (int)conexion.Lector["IdSucursal"];
                    v.Sucursal.Nombre = (string)conexion.Lector["Nombre"];

                    lista.Add(v);
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
        public int obtenerUltimoCodigo()
        {
            ConexionSQL conexion = new ConexionSQL();
            DataTable dt = new DataTable();
            try
            {
                conexion.setearProcedure("ObtenerUltimoCodigoVendedor");
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
