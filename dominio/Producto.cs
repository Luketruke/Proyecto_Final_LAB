using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominios
{
    public class Producto
    {
        public int Id { get; set; }
        public string Codigo { get; set; }
        public string Descripcion { get; set; }
        public decimal PrevioVenta { get; set; }
        public decimal Costo { get; set; }
        public CategoriaProducto Categoria { get; set; }
        public Marca Marca { get; set; }
        public string Observaciones { get; set; }
    }
}
