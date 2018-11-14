using Avancada.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Avancada.Controllers
{
    public class RefeicaoController : BaseController
    {
        private AvanBDContainer db = new AvanBDContainer();
        public ActionResult Index()
        {
            var refeicoes = db.Refeicao.Include("Usuario").ToList();
            return View(refeicoes);
        }
        public ActionResult Alterar(int id)
        {
            Refeicao refeicao = db.Refeicao.Find(id);
            return View(refeicao);
        }
        [HttpPost]
        public ActionResult Alterar(Refeicao refeicao)
        {
            if (ModelState.IsValid)
            {
                db.Entry(refeicao).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(refeicao);
        }
        public ActionResult Excluir(int id)
        {
            Refeicao refeicao = db.Refeicao.Find(id);
            return View(refeicao);
        }
        [HttpPost, ActionName("Excluir")]
        public ActionResult EfetuarExclusao(int id)
        {
            try
            {
                Refeicao refeicao = db.Refeicao.Find(id);
                db.Refeicao.Remove(refeicao);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return RedirectToAction("ErroExcluir");
            }
        }
        public ActionResult ErroExcluir()
        {
            return View();
        }
    }
}