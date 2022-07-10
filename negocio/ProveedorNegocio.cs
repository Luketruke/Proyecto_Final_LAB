using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominios;

namespace negocios
{
    public class ProveedorNegocio
   {
        public DataTable obtenerProveedores()
    {
        ConexionSQL conexion = new ConexionSQL();
        DataTable dt = new DataTable();
        try
        {
            {
                conexion.setearProcedure("ObtenerProveedores");
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
        public List<Proveedor> listar()
        {
            Proveedor aux;
            ConexionSQL conexion = new ConexionSQL();
            List<Proveedor> lista = new List<Proveedor>();
            try
            {

                conexion.setearProcedure("ObtenerProveedoresTodos");
                conexion.ejecutarConexion();

                while (conexion.Lector.Read())
                {
                    Proveedor p = new Proveedor();

                    p.Id = (int)conexion.Lector["Id"];
                    p.Codigo = (string)conexion.Lector["Codigo"];
                    p.RazonSocial = (string)conexion.Lector["RazonSocial"];
                    p.Cuit = (string)conexion.Lector["Cuit"];
                    p.Telefono = (string)conexion.Lector["Telefono"];
                    p.Email = (string)conexion.Lector["Email"];

                    lista.Add(p);
                }
                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conexion.cerrarConexion();
            }
        }



        public bool agregarProveedor(Proveedor pv)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("AgregarProveedor");
                conexion.setearParametro("@Codigo", pv.Codigo);
                conexion.setearParametro("@RazonSocial", pv.RazonSocial);
                conexion.setearParametro("@CUIT", pv.Cuit);
              //  conexion.setearParametro("@domicilio", pv.Domicilio);
                conexion.setearParametro("@telefono", pv.Telefono);
                conexion.setearParametro("@Email", pv.Email);

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

        public bool eliminarProveedor(int IdProveedor)
        {
            ConexionSQL conexion = new ConexionSQL();
            try
            {
                conexion.setearProcedure("EliminarProveedores");
                conexion.setearParametro("@Id", IdProveedor);

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

        public DataTable obtenerDireccionProveedor(int idProveedor)
        {
            ConexionSQL conexion = new ConexionSQL();
            DataTable dt = new DataTable();
            try
            {
                {
                    conexion.setearProcedure("ObtenerDireccionProveedor");
                    conexion.setearParametro("@idProveedor", idProveedor);
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

        /*  public bool modificarProveedor(Proveedor p, int id)
           {
               ConexionSQL conexion = new ConexionSQL();
               try
               {
                   conexion.setearProcedure("ModificarProveedor");
                   conexion.setearParametro("@Id", id);
                   conexion.setearParametro("@Codigo", p.Codigo);
                   conexion.setearParametro("@razonSocial", p.RazonSocial);
                   conexion.setearParametro("@CUIT", p.Cuit);
                   conexion.setearParametro("@domicilio", p.Domicilio);
                   conexion.setearParametro("@Telefono", p.Telefono);
                   conexion.setearParametro("@email", p.Email);

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
           */
    }


}


