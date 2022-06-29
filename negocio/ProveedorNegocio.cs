﻿using System;
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

                conexion.setearProcedure("ObtenerProveedores");
                conexion.ejecutarConexion();

                while (conexion.Lector.Read())
                {
                    aux = new Proveedor((int)conexion.Lector["Id"], (string)conexion.Lector["Codigo"], (string)conexion.Lector["RazonSocial"], (string)conexion.Lector["Cuit"], (string)conexion.Lector["Domicilio"], (string)conexion.Lector["Telefono"], (string)conexion.Lector["Email"]);
                    lista.Add(aux);
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
                conexion.setearParametro("@domicilio", pv.Domicilio);
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

    }
}

