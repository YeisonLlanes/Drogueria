using Drogueria.Models;
using System.Data.SqlClient;
using System.Data;


namespace Drogueria.Data
{
    public class VentasData
    {

        public List<VentasModel> ListaVentas()
        {
            var obj_Lista = new List<VentasModel>();

            var cn = new Conexion();

            using (var conexion = new SqlConnection(cn.GetSqlConexion()))
            {
                conexion.Open();
                SqlCommand cmd = new SqlCommand("sp_ListaVentas", conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                using (var dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        obj_Lista.Add(new VentasModel
                        {
                            id_venta = Convert.ToInt32(dr["id_venta"]),
                            id_cliente = Convert.ToInt32(dr["id_cliente"]),
                            id_producto = Convert.ToInt32(dr["id_producto"]),
                            cantidad = Convert.ToInt32(dr["cantidad"]),
                            total_venta = Convert.ToInt32(dr["total_venta"]),
                            Nombre_Cliente = dr["Nombre_Cliente"].ToString(),
                            nit_cliente = Convert.ToInt32(dr["nit_cliente"]),
                            desc_producto = dr["desc_producto"].ToString(),
                            tipo_producto = dr["tipo_producto"].ToString(),
                            precio = Convert.ToInt32(dr["precio"]),
                        });
                    }
                }
            }
            return obj_Lista;
        }

        public List<VentasModel> ListaProductos()
        {
            var obj_Lista = new List<VentasModel>();

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
                        obj_Lista.Add(new VentasModel
                        {
                            id_producto = Convert.ToInt32(dr["id_producto"]),
                            desc_producto = dr["desc_producto"].ToString(),
                        });
                    }
                }
            }
            return obj_Lista;
        }

        public List<VentasModel> ListaClientes()
        {
            var obj_Lista = new List<VentasModel>();

            var cn = new Conexion();

            using (var conexion = new SqlConnection(cn.GetSqlConexion()))
            {
                conexion.Open();
                SqlCommand cmd = new SqlCommand("sp_ListaClientes", conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                using (var dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        obj_Lista.Add(new VentasModel
                        {
                            id_cliente = Convert.ToInt32(dr["id_cliente"]),
                            Nombre_Cliente = dr["Nombre_Cliente"].ToString(),
                        });
                    }
                }
            }
            return obj_Lista;
        }

        public bool CrearVenta(VentasModel obj_Venta)
        {
            bool respuesta;

            try
            {
                var cn = new Conexion();

                using (var conexion = new SqlConnection(cn.GetSqlConexion()))
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("sp_CrearVenta", conexion);
                    cmd.Parameters.AddWithValue("id_cliente", obj_Venta.id_cliente);
                    cmd.Parameters.AddWithValue("id_producto", obj_Venta.id_producto);
                    cmd.Parameters.AddWithValue("cantidad", obj_Venta.cantidad);
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

        public VentasModel TotalVentas()
        {
            var obj_Venta = new VentasModel();

            var cn = new Conexion();

            using (var conexion = new SqlConnection(cn.GetSqlConexion()))
            {
                conexion.Open();
                SqlCommand cmd = new SqlCommand("sp_InfoVentas", conexion);
                cmd.CommandType = CommandType.StoredProcedure;

                using (var dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        obj_Venta.total_ventas_drogueria = dr["total_ventas_drogueria"].ToString();
                        obj_Venta.productos_mas_vendido = dr["productos_mas_vendido"].ToString();
                        obj_Venta.productos_menos_vendido = dr["productos_menos_vendido"].ToString();
                    }
                }
            }
            return obj_Venta;
        }


    }
}
