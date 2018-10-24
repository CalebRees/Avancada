using Avancada.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Avancada.Controllers
{
    public class ClienteController : Controller
    {
        private AvanBDContainer db = new AvanBDContainer();

        public ActionResult Index()
        {
            var clientes = db.Cliente();
            return View(clientes);
        }
    }
}