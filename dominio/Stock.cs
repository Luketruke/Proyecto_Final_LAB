﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominios
{
    public class Stock
    {
        public int Id { get; set; }
        public Producto Producto { get; set; }
        public int StockActual { get; set; }
        public int StockMinimo { get; set; }
        public Sucursal Sucursal { get; set; }
    }
}
