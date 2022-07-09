﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominios
{
    public class Vendedor
    {
        public int Id { get; set; }
        public int Codigo { get; set; }
        public string Nombres { get; set; }
        public string Apellidos { get; set; }
        public string NombreCompleto { get; set; }
        public string Telefono { get; set; }
        public string Email { get; set; }
        public decimal PorcentajeXVenta { get; set; }
        public DateTime FechaAlta { get; set; }
        public Sucursal Sucursal { get; set; }
    }
}
