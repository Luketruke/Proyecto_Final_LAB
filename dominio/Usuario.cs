using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace dominios
{
    public enum TipoUser
    {
        NORMAL = 1,
        ADMIN = 2
    }


    public class Usuario
    {
        public int Id { get; set; }
        public string User { get; set; }
        public string Contraseña { get; set; }
        public TipoUser TipoUser{ get; set; }

        public Usuario(string user, string pass, bool admin)
        {
            User = user;
            Contraseña = pass;
            TipoUser = admin ? TipoUser.ADMIN : TipoUser.NORMAL;
        }
    }
}
