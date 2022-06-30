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
                datos.setearQuery("Select Id, TipoUser from usuarios Where usuario = @user AND pass = @pass");
                datos.setearParametro("@user", usuario.User);
                datos.setearParametro("@pass", usuario.Contraseña);
                datos.ejecutarLector();
                while (datos.Lector.Read())
                {
                    usuario.Id = (int)datos.Lector["Id"];
                    usuario.TipoUser = (int)(datos.Lector["TipoUser"]) == 2 ? TipoUser.ADMIN : TipoUser.NORMAL;
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
