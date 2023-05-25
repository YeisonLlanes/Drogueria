using Drogueria.Models;
using System.Data.SqlClient;
using System.Data;

namespace Drogueria.Data
{
    public class ClientesData
    {
        public List<ClientesModel> ListaClientes()
        {
            var obj_Lista = new List<ClientesModel>();

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
                        obj_Lista.Add(new ClientesModel
                        {
                            id_cliente = Convert.ToInt32(dr["id_cliente"]),
                            Nombre_Cliente = dr["Nombre_Cliente"].ToString(),
                            nit_cliente = Convert.ToInt32(dr["nit_cliente"]),
                            Direccion = dr["Direccion"].ToString(),
                            Telefono = dr["Telefono"].ToString(),
                        });
                    }
                }
            }
            return obj_Lista;
        }

        public bool CrearCliente(ClientesModel obj_Cliente)
        {
            bool respuesta;

            try
            {
                var cn = new Conexion();

                using (var conexion = new SqlConnection(cn.GetSqlConexion()))
                {
                    conexion.Open();
                    SqlCommand cmd = new SqlCommand("sp_CrearCliente", conexion);
                    cmd.Parameters.AddWithValue("Nombre_Cliente", obj_Cliente.Nombre_Cliente);
                    cmd.Parameters.AddWithValue("nit_cliente", obj_Cliente.nit_cliente);
                    cmd.Parameters.AddWithValue("Direccion", obj_Cliente.Direccion);
                    cmd.Parameters.AddWithValue("Telefono", obj_Cliente.Telefono);
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
