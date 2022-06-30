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
                    c.Domicilio = (string)conexion.Lector["Domicilio"];
                    c.Telefono = (string)conexion.Lector["Telefono"];
                    c.Email = (string)conexion.Lector["Email"];

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
        public bool agregarCliente(Cliente c)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("AgregarCliente");
                conexion.setearParametro("@Codigo", c.Codigo);
                conexion.setearParametro("@Nombres", c.Nombres);
                conexion.setearParametro("@Apellidos", c.Apellidos);
                conexion.setearParametro("@FechaNacimiento", c.FechaNacimiento);
                conexion.setearParametro("@Cuit", c.Cuit);
                conexion.setearParametro("@Domicilio", c.Domicilio);
                conexion.setearParametro("@Telefono", c.Telefono);
                conexion.setearParametro("@Email", c.Email);

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

        public bool modificarCliente(Cliente c)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("AgregarCliente");
                conexion.setearParametro("@Codigo", c.Codigo);
                conexion.setearParametro("@Nombres", c.Nombres);
                conexion.setearParametro("@Apellidos", c.Apellidos);
                conexion.setearParametro("@FechaNacimiento", c.FechaNacimiento);
                conexion.setearParametro("@Cuit", c.Cuit);
                conexion.setearParametro("@Domicilio", c.Domicilio);
                conexion.setearParametro("@Telefono", c.Telefono);
                conexion.setearParametro("@Email", c.Email);

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
