using Avancada.Repositories.Authentication;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Avancada.Filters
{
    public class FiltroAcesso:ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filtroContexto)
        {
            var controller = filtroContexto.ActionDescriptor.ControllerDescriptor.ControllerName;
            var action = filtroContexto.ActionDescriptor.ActionName;
            if(controller!="Comum" || action != "LoginCadastro")
            {
                if (GestaoUsuario.VerificarStatusUsuario() == null)
                {
                    filtroContexto.RequestContext.HttpContext.Response.Redirect("/Comum/LoginCadastro");
                }
            }
        }
    }
}