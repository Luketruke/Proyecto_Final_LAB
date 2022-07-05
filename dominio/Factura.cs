using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominios
{
    public class Factura
    {
        public int Id { get; set; }
        public string NumeroFactura { get; set; }
        public Cliente Cliente { get; set; }
        public Vendedor Vendedor { get; set; }
        public FormaPago FormaPago { get; set; }
        public decimal SubTotal { get; set; }
        public decimal Descuento { get; set; }
        public decimal Total { get; set; }
        public DateTime Fecha { get; set; }
        public string Observaciones { get; set; }
        public Sucursal Sucursal { get; set; }
        public TipoDocumento TipoDocumento { get; set; }
        public PuntoVenta PuntoVenta { get; set; }
    }
}
