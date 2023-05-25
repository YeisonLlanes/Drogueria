using Drogueria.Data;
using Drogueria.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Collections;

namespace Drogueria.Controllers
{
    public class PedidoController : Controller
    {
        PedidosData _PedidosData = new PedidosData();

        public IActionResult ListaPedidos()
        {
            var obj_Lista = _PedidosData.ListaPedidos();
            return View(obj_Lista);
        }

        public IActionResult CrearPedido()
        {
            ViewData["combo"] = new SelectList(GetProducto(), "id_producto", "desc_producto");
            return View();
        }

        private IEnumerable GetProducto()
        {
            var obj_Lista = _PedidosData.ListaProductos();
            return obj_Lista;
        }

        [HttpPost]
        public IActionResult CrearPedido(PedidosModel obj_Pedido)
        {
            var respuesta = _PedidosData.CrearPedido(obj_Pedido);

            if (respuesta)
            {
                return RedirectToAction("ListaPedidos");
            }
            else
            {
                return View();
            }

        }
    }
}
