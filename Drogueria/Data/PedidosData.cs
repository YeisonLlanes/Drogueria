using Drogueria.Models;
using System.Data.SqlClient;
using System.Data;

namespace Drogueria.Data
{
    public class PedidosData
    {
        public List<PedidosModel> ListaPedidos()
        {
            var obj_Lista = new List<PedidosModel>();

            var cn = new Conexion();

            using (var conexion = new SqlConnection(cn.GetSqlConexion()))
            {
                conexion.Open();
                SqlCommand cmd = new SqlCommand("sp_ListaPedidos", conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                using (var dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        obj_Lista.Add(new PedidosModel
                        {
                            id_pedido = Convert.ToInt32(dr["id_pedido"]),
                            id_producto = Convert.ToInt32(dr["id_producto"]),
                            cantidad = Convert.ToInt32(dr["cantidad"]),
                            desc_producto = dr["desc_producto"].ToString(),
                            tipo_producto = dr["tipo_producto"].ToString(),
                            stock_bodega = Convert.ToInt32(dr["stock_bodega"]),
                        });
                    }
                }
            }
            return obj_Lista;
        }

        public List<PedidosModel> ListaProductos()
        {
            var obj_Lista = new List<PedidosModel>();

            var cn = new Conexion();

            using (var conexion = new SqlConnection(cn.GetSqlConexion()))
            {
                conexion.Open();
                SqlCommand cmd = new SqlCommand("sp_ListaProductos", conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                using (var dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        obj_Lista.Add(new PedidosModel
                        {
                            id_producto = Convert.ToInt32(dr["id_producto"]),
                            desc_producto = dr["desc_producto"].ToString(),
                        });
                    }
                }
            }
            return obj_Lista;
        }



        public bool CrearPedido(PedidosModel obj_Pedido)
        {
            bool respuesta;

            try
            {
                var cn = new Conexion();

                using (var conexion = new SqlConnection(cn.GetSqlConexion()))
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("sp_CrearPedido", conexion);
                    cmd.Parameters.AddWithValue("id_producto", obj_Pedido.id_producto);
                    cmd.Parameters.AddWithValue("cantidad", obj_Pedido.cantidad);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.ExecuteNonQuery();
                }
                respuesta = true;
            }
            catch (Exception ex)
            {
                string msg = ex.Message;
                respuesta = false;
            }
            return respuesta;
        }
    }
}
