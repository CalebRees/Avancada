using Avancada.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Avancada.Controllers
{
    public class SACController : BaseController
    {
        AvanBDContainer db = new AvanBDContainer();
        public ActionResult Index()
        {
            return View(db.SAC.Include("Usuario").ToList());
        }
    }
}