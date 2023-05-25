using Microsoft.AspNetCore.Mvc;

using Drogueria.Data;
using Drogueria.Models;

namespace Drogueria.Controllers
{
    public class ProductoController : Controller
    {
        ProductosData _ProductosData = new ProductosData();

        public IActionResult ListaProductos()
        {
            var obj_Lista = _ProductosData.ListaProductos();
            return View(obj_Lista);
        }

        public IActionResult CrearProducto()
        {
            return View();
        }

        [HttpPost]
        public IActionResult CrearProducto(ProductosModel obj_Producto)
        {
            var respuesta = _ProductosData.CrearProducto(obj_Producto);

            if (respuesta)
            {
                return RedirectToAction("ListaProductos");
            }
            else
            {
                return View();
            }
            
        }
    }
}
