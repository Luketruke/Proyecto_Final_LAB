using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominios
{
    public class ItemFactura
    {
        public int Id { get; set; }
        public string Codigo { get; set; }
        public string Descripcion { get; set; }
        public decimal PrecioVenta { get; set; }
        public int Cantidad { get; set; }
        public decimal SubTotal { get; set; }
        public decimal Descuento { get; set; }
        public decimal PrecioTotal { get; set; }
        public int idFactura { get; set; }
        public int NumeroItem { get; set; }
    }
}
