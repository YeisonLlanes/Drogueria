namespace Drogueria.Models
{
    public class VentasModel
    {

        public int id_venta { get; set; }

        public int id_cliente { get; set; }

        public int id_producto { get; set; }

        public int cantidad { get; set; }

        public int total_venta { get; set; }

        public string? Nombre_Cliente { get; set; }

        public int nit_cliente { get; set; }

        public string? Direccion { get; set; }

        public string? Telefono { get; set; }

        public string? desc_producto { get; set; }

        public string? tipo_producto { get; set; }

        public int precio { get; set; }

        public int stock_bodega { get; set; }

        public int stock_minimo { get; set; }

        public string? total_ventas_drogueria { get; set; }

        public string? productos_mas_vendido { get; set; }

        public string? productos_menos_vendido { get; set; }
    }
}
