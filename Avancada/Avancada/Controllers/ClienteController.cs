﻿using Avancada.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Avancada.Controllers
{
    public class ClienteController : BaseController
    {
        private AvanBDContainer db = new AvanBDContainer();
        public ActionResult Index()
        {
            return View(db.Cliente.ToList());
        }
        public ActionResult Inserir()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Inserir(Cliente cliente)
        {
            if (ModelState.IsValid)
            {
                db.Cliente.Add(cliente);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(cliente);
        }
        public ActionResult Alterar(int id)
        {
            Cliente cliente = db.Cliente.Find(id);
            return View(cliente);
        }
        [HttpPost]
        public ActionResult Alterar(Cliente cliente)
        {
            if (ModelState.IsValid)
            {
                db.Entry(cliente).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(cliente);
        }
        public ActionResult Excluir(int id)
        {
            Cliente cliente = db.Cliente.Find(id);
            return View(cliente);
        }
        [HttpPost, ActionName("Excluir")]
        public ActionResult EfetuarExclusao(int id)
        {
            try
            {
                Cliente cliente = db.Cliente.Find(id);
                db.Cliente.Remove(cliente);
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