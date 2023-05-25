using Drogueria.Data;
using Drogueria.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Collections;

namespace Drogueria.Controllers
{
    public class VentaController : Controller
    {
        VentasData _VentasData = new VentasData();
        public IActionResult ListaVentas()
        {
            var obj_Lista = _VentasData.ListaVentas();
            return View(obj_Lista);
        }

        public IActionResult CrearVenta()
        {
            ViewData["combo"] = new SelectList(GetProducto(), "id_producto", "desc_producto");
            ViewData["combo2"] = new SelectList(GetClientes(), "id_cliente", "Nombre_Cliente");
            return View();
        }

        private IEnumerable GetProducto()
        {
            var obj_Lista = _VentasData.ListaProductos();
            return obj_Lista;
        }

        private IEnumerable GetClientes()
        {
            var obj_Lista = _VentasData.ListaClientes();
            return obj_Lista;
        }


        [HttpPost]
        public IActionResult CrearVenta(VentasModel obj_Venta)
        {
            var respuesta = _VentasData.CrearVenta(obj_Venta);

            if (respuesta)
            {
                return RedirectToAction("ListaVentas");
            }
            else
            {
                return View();
            }

        }

        public IActionResult TotalVentas()
        {
            var obj_Venta = _VentasData.TotalVentas();
            return View(obj_Venta);
        }


    }
}
