﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominios
{
    public class CategoriaProducto
    {
        public int Id { get; set; }
        public string Categoria { get; set; }
        public override string ToString()
        {
            return Categoria;
        }
    }
}
