namespace Drogueria.Models
{
    public class PedidosModel
    {
        public int id_pedido { get; set; }

        public int id_producto { get; set; }

        public int cantidad { get; set; }

        public string? desc_producto { get; set; }

        public string? tipo_producto { get; set; }

        public int stock_bodega { get; set; }


    }
}
