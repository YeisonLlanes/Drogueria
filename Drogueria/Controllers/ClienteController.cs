using Drogueria.Data;
using Drogueria.Models;
using Microsoft.AspNetCore.Mvc;

namespace Drogueria.Controllers
{
    public class ClienteController : Controller
    {
        ClientesData _ClientesData = new ClientesData();

        public IActionResult ListaClientes()
        {
            var obj_Lista = _ClientesData.ListaClientes();
            return View(obj_Lista);
        }

        public IActionResult CrearCliente()
        {
            return View();
        }

        [HttpPost]
        public IActionResult CrearCliente(ClientesModel obj_Cliente)
        {
            var respuesta = _ClientesData.CrearCliente(obj_Cliente);

            if (respuesta)
            {
                return RedirectToAction("ListaClientes");
            }
            else
            {
                return View();
            }

        }
    }
}
