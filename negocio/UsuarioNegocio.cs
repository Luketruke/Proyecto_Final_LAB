using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominios;

namespace negocios
{
    public class UsuarioNegocio
    {
        public bool Loguear(Usuario usuario)
        {
            ConexionSQL datos = new ConexionSQL();
            try
            {
                datos.setearQuery("Select Id, idTipoUsuario from usuarios Where usuario = @user AND contraseña = @pass");
                datos.setearParametro("@user", usuario.User);
                datos.setearParametro("@pass", usuario.Contraseña);
                datos.ejecutarConexion();
                while (datos.Lector.Read())
                {
                    usuario.Id = (int)datos.Lector["Id"];
                    usuario.idTipoUsuario = (int)(datos.Lector["idTipoUsuario"]) == 2 ? TipoUsuer.Admin : TipoUsuer.Vendedor;
                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}
