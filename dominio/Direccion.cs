using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominios
{
    public class Direccion
    {
        public int Id { get; set; }
        public int IdClienteProveedor { get; set; }
        public string Domicilio { get; set; }
        public string Localidad { get; set; }
        public string CodigoPostal { get; set; }
        public string Observaciones { get; set; }
    }
}
