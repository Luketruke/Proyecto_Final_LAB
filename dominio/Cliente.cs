using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominios
{
    public class Cliente
    {
        public int Id { get; set; }
        public int Codigo { get; set; }
        public string Nombres { get; set; }
        public string Apellidos { get; set; }
        public string NombreCompleto { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public string Cuit { get; set; }
        public int IdDireccion { get; set; }
        public string Telefono { get; set; }
        public string Email { get; set; }
        public int TipoCliente { get; set; }
    }
}
