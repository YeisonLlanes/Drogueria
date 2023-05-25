using System.Data.SqlClient;

namespace Drogueria.Data
{
    public class Conexion
    {
        private string SqlConexion = string.Empty;

        public Conexion()
        {
            var builder = new ConfigurationBuilder().SetBasePath(Directory.GetCurrentDirectory()).AddJsonFile("appsettings.json").Build();

            SqlConexion = builder.GetSection("ConnectionStrings:SqlConexion").Value;
        }

        public string GetSqlConexion()
        {
            return SqlConexion;
        }

    }
}
