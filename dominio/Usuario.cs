using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominios
{
    public class Usuario
    {
        public int Id { get; set; }
        public string Codigo { get; set; }
        public string User { get; set; }
        public string Contraseña { get; set; }
        public string Email { get; set; }
        public string Telefono { get; set; }
        public TipoUsuario Marca { get; set; }
    }
}
