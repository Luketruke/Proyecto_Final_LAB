using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominios
{
    public enum TipoUsuer
    {
        Vendedor = 1,
        Admin = 2
    }

    public class Usuario
    {
        public int Id { get; set; }
        public string User { get; set; }
        public string Contraseña { get; set; }
        public string Email { get; set; }
        public string Telefono { get; set; }
        public DateTime FechaNacimiento { get; set; }

        public TipoUsuer idTipoUsuario{ get; set; }

       public Usuario(string user, string pass, bool admin) 
        { 
        User = user;
        Contraseña = pass;
        idTipoUsuario = admin ? TipoUsuer.Admin : TipoUsuer.Vendedor;
        Email = " ";
        Telefono = " ";
        }
    }
}
