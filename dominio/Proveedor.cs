using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominios
{
    public class Proveedor
    {
        public int Id { get; set; }
        public string Codigo { get; set; }
        public string RazonSocial { get; set; }
        public string Cuit { get; set; }
        public int IdDireccion { get; set; }
        public string Telefono { get; set; }
        public string Email { get; set; }
        public Proveedor() { }

        public Proveedor(int id, string cod, string rs, string cuit,int dom, string tel, string email)
        {
            Id = id;
            Codigo = cod;
            RazonSocial = rs;
            Cuit = cuit;
            IdDireccion = dom;
            Telefono = tel;
            Email = email;
        }
    }
}
