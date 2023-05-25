using Drogueria.Models;
using System.Data.SqlClient;
using System.Data;


namespace Drogueria.Data
{
    public class ProductosData
    {
        public List<ProductosModel> ListaProductos()
        {
            var obj_Lista = new List<ProductosModel>();
            
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
                        obj_Lista.Add(new ProductosModel
                        {
                            id_producto = Convert.ToInt32(dr["id_producto"]),
                            desc_producto = dr["desc_producto"].ToString(),
                            tipo_producto = dr["tipo_producto"].ToString(),
                            precio = Convert.ToDecimal(dr["precio"]),
                            stock_bodega = Convert.ToInt32(dr["stock_bodega"]),
                            stock_minimo = Convert.ToInt32(dr["stock_minimo"])
                        });
                    }
                }
            }
            return obj_Lista;
        }

        public ProductosModel ObtenerProducto(int id_producto)
        {
            var obj_Producto = new ProductosModel();

            var cn = new Conexion();

            using (var conexion = new SqlConnection(cn.GetSqlConexion()))
            {
                conexion.Open();
                SqlCommand cmd = new SqlCommand("sp_ObtenerProducto", conexion);
                cmd.Parameters.AddWithValue("id_producto", id_producto);
                cmd.CommandType = CommandType.StoredProcedure;

                using (var dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        obj_Producto.id_producto = Convert.ToInt32(dr["id_producto"]);
                        obj_Producto.desc_producto = dr["desc_producto"].ToString();
                        obj_Producto.tipo_producto = dr["tipo_producto"].ToString();
                        obj_Producto.precio = Convert.ToDecimal(dr["precio"]);
                        obj_Producto.stock_bodega = Convert.ToInt32(dr["stock_bodega"]);
                        obj_Producto.stock_minimo = Convert.ToInt32(dr["stock_minimo"]);
                    }
                }
            }
            return obj_Producto;
        }

        public bool CrearProducto(ProductosModel obj_Producto)
        {
            bool respuesta;

            try
            {
                var cn = new Conexion();

                using (var conexion = new SqlConnection(cn.GetSqlConexion()))
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("sp_CrearProducto", conexion);
                    cmd.Parameters.AddWithValue("desc_producto", obj_Producto.desc_producto);
                    cmd.Parameters.AddWithValue("tipo_producto", obj_Producto.tipo_producto);
                    cmd.Parameters.AddWithValue("precio", obj_Producto.precio);
                    cmd.Parameters.AddWithValue("stock_bodega", obj_Producto.stock_bodega);
                    cmd.Parameters.AddWithValue("stock_minimo", obj_Producto.stock_minimo);
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


        public bool EditarProducto(ProductosModel obj_Producto)
        {
            bool respuesta;

            try
            {
                var cn = new Conexion();

                using (var conexion = new SqlConnection(cn.GetSqlConexion()))
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("sp_EditarProducto", conexion);
                    cmd.Parameters.AddWithValue("id_producto", obj_Producto.id_producto);
                    cmd.Parameters.AddWithValue("desc_producto", obj_Producto.desc_producto);
                    cmd.Parameters.AddWithValue("tipo_producto", obj_Producto.tipo_producto);
                    cmd.Parameters.AddWithValue("precio", obj_Producto.precio);
                    cmd.Parameters.AddWithValue("stock_bodega", obj_Producto.stock_bodega);
                    cmd.Parameters.AddWithValue("stock_minimo", obj_Producto.stock_minimo);
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


        public bool EliminarProducto(int id_producto)
        {
            bool respuesta;

            try
            {
                var cn = new Conexion();

                using (var conexion = new SqlConnection(cn.GetSqlConexion()))
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("sp_EliminarProducto", conexion);
                    cmd.Parameters.AddWithValue("id_producto", id_producto);
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
