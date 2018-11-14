﻿using Avancada.Repositories.Authentication;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Avancada.Controllers
{
    public class AutenticacaoController : Controller
    {
        public JsonResult AutenticarUsuario(string login, string senha)
        {
            if (GestaoUsuario.VerificarUsuarioBD(login, senha))
            {
                return Json(new { OK = true, Mensagem = "Usuário encontrado. Redirecionando..." }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(new { OK = false, Mensagem = "Usuário não encontrado. " }, JsonRequestBehavior.AllowGet);
            }
        }
        public JsonResult DesautenticarUsuario()
        {
            if (GestaoCookie.ApagarCookie())
            {
                return Json(new { OK = true }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(new { OK = false }, JsonRequestBehavior.AllowGet);
            }
        }       
    }
}