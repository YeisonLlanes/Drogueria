namespace Drogueria.Models
{
    public class ProductosModel
    {
        public int id_producto { get; set; }

        public string? desc_producto { get; set; }

        public string? tipo_producto { get; set; }

        public decimal precio { get; set; }

        public int stock_bodega { get; set; }

        public int stock_minimo { get; set; }
    }
}
