using Avancada.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Avancada.Repositories.Authentication
{
    public class GestaoUsuario
    {
        public static bool VerificarUsuarioBD(string login, string senha)
        {
            try
            {
                AvanBDContainer db = new AvanBDContainer();
                var usuario = db.Usuario.Where(x => x.Email == login && x.Senha == senha).SingleOrDefault();
                if (usuario == null)
                {
                    return false;
                }
                else
                {
                    GestaoCookie.CriarCookie(usuario);
                    return true;
                }
            }
            catch(Exception)
            {
                return false;
            }
        }
        public static Usuario RecuperarUsuario(int idUsuario)
        {
            try
            {
                AvanBDContainer db = new AvanBDContainer();
                var usuario = db.Usuario.Where(u => u.IdUsuario == idUsuario).SingleOrDefault();
                return usuario;
            }
            catch (Exception)
            {
                return null;
            }
        }
        public static Usuario VerificarStatusUsuario()
        {
            HttpCookie cookieUsuario = HttpContext.Current.Request.Cookies["CookieUsuarioAvan"];
            if (cookieUsuario == null || Convert.ToInt32(cookieUsuario.Values["TipoUsuario"])!=1)
            {
                return null;
            }
            else
            {
                int idUsuario = Convert.ToInt32(cookieUsuario.Values["IDUsuario"]);
                var usuario = RecuperarUsuario(idUsuario);
                return usuario;
            }
        }
    }
}