using Avancada.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Avancada.Repositories.Authentication
{
    public class GestaoCookie
    {
        public static void CriarCookie(Usuario usuario)
        {
            HttpCookie cookieUsuarioAvan = new HttpCookie("CookieUsuarioAvan");
            cookieUsuarioAvan.Values["IDUsuario"] = usuario.IdUsuario.ToString();
            cookieUsuarioAvan.Values["TipoUsuario"] = usuario.Tipo.ToString();
            cookieUsuarioAvan.Expires = DateTime.Now.AddDays(1);
            HttpContext.Current.Response.Cookies.Add(cookieUsuarioAvan);
        }
        public static bool ApagarCookie()
        {
            HttpCookie cookieUsuario = HttpContext.Current.Request.Cookies["CookieUsuarioAvan"];
            if (cookieUsuario == null)
            {
                return false;
            }
            else
            {
                HttpContext.Current.Response.Cookies[cookieUsuario.Name].Expires = DateTime.Now.AddDays(-1);
                return true;
            }
        }
    }
}