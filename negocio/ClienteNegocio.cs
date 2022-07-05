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
    public class ClienteNegocio
    {
        public List<Cliente> obtenerClientesTodos()
        {
            List<Cliente> lista = new List<Cliente>();
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("ObtenerClientesTodos");
                conexion.ejecutarConexion();

                while (conexion.Lector.Read())
                {
                    Cliente c = new Cliente();

                    c.Id = (int)conexion.Lector["Id"];
                    c.Codigo = (string)conexion.Lector["Codigo"];
                    c.Nombres = (string)conexion.Lector["Nombres"];
                    c.Apellidos = (string)conexion.Lector["Apellidos"];
                    c.NombreCompleto = (string)conexion.Lector["NombreCompleto"];
                    c.FechaNacimiento = (DateTime)conexion.Lector["FechaNacimiento"];
                    c.Cuit = (string)conexion.Lector["Cuit"];
                    c.Telefono = (string)conexion.Lector["Telefono"];
                    c.Email = (string)conexion.Lector["Email"];
                    c.TipoCliente = (int)conexion.Lector["idTipoCliente"];

                    lista.Add(c);
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
        public DataTable obtenerDireccionCliente(int idCliente)
        {
            ConexionSQL conexion = new ConexionSQL();
            DataTable dt = new DataTable();
            try
            {
                {
                    conexion.setearProcedure("ObtenerDireccionCliente");
                    conexion.setearParametro("@idCliente", idCliente);
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
        public bool agregarCliente(Cliente c, Direccion d, int idTipoCliente)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("AgregarCliente");
                conexion.setearParametro("@idCliente", 0);
                conexion.setearParametro("@Codigo", c.Codigo);
                conexion.setearParametro("@Nombres", c.Nombres);
                conexion.setearParametro("@Apellidos", c.Apellidos);
                conexion.setearParametro("@FechaNacimiento", c.FechaNacimiento);
                conexion.setearParametro("@Cuit", c.Cuit);
                conexion.setearParametro("@Telefono", c.Telefono);
                conexion.setearParametro("@Email", c.Email);
                conexion.setearParametro("@idTipoCliente", idTipoCliente);
                conexion.setearParametro("@Direccion", d.Domicilio);
                conexion.setearParametro("@Localidad", d.Localidad);
                conexion.setearParametro("@CodigoPostal", d.CodigoPostal);
                conexion.setearParametro("@Observaciones", d.Observaciones);

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
        public bool modificarCliente(Cliente c, Direccion d, int idTipoCliente)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("ModificarCliente");
                conexion.setearParametro("@Codigo", c.Codigo);
                conexion.setearParametro("@Nombres", c.Nombres);
                conexion.setearParametro("@Apellidos", c.Apellidos);
                conexion.setearParametro("@FechaNacimiento", c.FechaNacimiento);
                conexion.setearParametro("@Cuit", c.Cuit);
                conexion.setearParametro("@IdDomicilio", c.IdDireccion);
                conexion.setearParametro("@Telefono", c.Telefono);
                conexion.setearParametro("@Email", c.Email);
                conexion.setearParametro("@idTipoCliente", idTipoCliente);
                conexion.setearParametro("@Direccion", d.Domicilio);
                conexion.setearParametro("@Localidad", d.Localidad);
                conexion.setearParametro("@CodigoPostal", d.CodigoPostal);
                conexion.setearParametro("@Observaciones", d.Observaciones);

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
        public bool eliminarCliente(int IdCliente)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("EliminarCliente");
                conexion.setearParametro("@Id", IdCliente);

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
        public DataTable obtenerTipoClientes()
        {
            ConexionSQL conexion = new ConexionSQL();
            DataTable dt = new DataTable();
            try
            {
                {
                    conexion.setearProcedure("ObtenerTipoClientes");
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
    }
}
