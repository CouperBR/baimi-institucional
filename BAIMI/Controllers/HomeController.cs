using BAIMI.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace BAIMI.Controllers
{
    public class HomeController : Controller
    {
        private static readonly NLog.Logger Logger = NLog.LogManager.GetCurrentClassLogger();

        public ActionResult Index()
        {
            try
            {
                List<produto> produtos = new List<produto>();
                using (var ctx = new BaimiContext())
                {
                    produtos = ctx.produto.ToList();
                }
                ViewBag.Produtos = produtos;
                return View();
            }
            catch (Exception ex )
            {
                Logger.Error(ex, "Erro durante ao tentar mostrar a tela principal.");
                return View();
            }
            
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        
    }
}