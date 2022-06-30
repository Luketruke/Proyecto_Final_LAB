using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using dominios;

namespace negocios
{
    public class ConexionSQL
    {
        private SqlConnection conexion;
        private SqlCommand comando;
        private SqlDataReader lector;
        public ConexionSQL()
        {
            try
            {
                comando = new SqlCommand();
               conexion = new SqlConnection("server=localhost; database=COMERCIO_P3; integrated security=true;"); //Lucas
               //conexion = new SqlConnection("server=.\\SQLEXPRESS; database=COMERCIO_P3; integrated security=true;"); //Gaston
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void setearProcedure(string procedure)
        {
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.CommandText = procedure;
        }
        public void setearQuery(string consulta)
        {
            comando.CommandType = System.Data.CommandType.Text;
            comando.CommandText = consulta;
        }

        public void cerrarConexion()
        {
            if (lector != null)
                lector.Close();
            conexion.Close();
        }
        public SqlDataReader ejecutarConexion()
        {
            comando.Connection = conexion;
           
               conexion.Open();
               lector = comando.ExecuteReader();
               return lector;            
        }

        public void ejecutarLector()
        {
            try
            {
                conexion.Open();
                lector = comando.ExecuteReader();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void setearParametro(string nombre, object valor)
        {
            comando.Parameters.AddWithValue(nombre, valor);
        }

        public void setearParametroOutput(string nombre, object valor)
        {
            comando.Parameters.AddWithValue(nombre, valor);
        }
        public SqlDataReader Lector { get { return lector; } }
    }


    
}


