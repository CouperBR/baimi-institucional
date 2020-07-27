using BAIMI.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using BAIMI.Services;

namespace BAIMI.Controllers
{
    [Authorize]
    public class AdminController : Controller
    {
        private static readonly NLog.Logger Logger = NLog.LogManager.GetCurrentClassLogger();

        private UsuarioService usuarioService = new UsuarioService();
        // GET: Admin
        public ActionResult Index()
        {
            return View();
        }

        [AllowAnonymous]
        public ActionResult LoginScreen()
        {
            return View();
        }

        [AllowAnonymous]
        public ActionResult LogIn(usuario user)
        {
            try
            {
                if (usuarioService.Login(user))
                {
                    FormsAuthentication.SetAuthCookie(user.nome + DateTime.Now.ToString(), false);
                    return RedirectToAction("Index", "Produto");
                }

                return RedirectToAction("LoginScreen");
            }
            catch (Exception ex)
            {
                Logger.Error(ex, "Erro durante o LogIn.");
                return RedirectToAction("Index", "Produto");
            }
            
        }

        public ActionResult LogOut()
        {
            try
            {
                FormsAuthentication.SignOut();
                return RedirectToAction("Index", "Home");
            }
            catch (Exception ex)
            {
                Logger.Error(ex, "Erro durante o LogOut.");
                return RedirectToAction("Index", "Home");
            }
        }
    }
}