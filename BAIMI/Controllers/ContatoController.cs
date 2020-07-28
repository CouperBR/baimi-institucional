using BAIMI.Context;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;

namespace BAIMI.Controllers
{
    public class ContatoController : Controller
    {
        private static readonly NLog.Logger Logger = NLog.LogManager.GetCurrentClassLogger();

        private BaimiContext db = new BaimiContext();

        [HttpPost]
        public ActionResult Contactar(contato contato)
        {
            try
            {
                using (var ctx = new BaimiContext())
                {
                    contato.data = DateTime.Now;
                    ctx.contato.Add(contato);
                    ctx.SaveChanges();
                }

                if (Convert.ToBoolean(ConfigurationManager.AppSettings["enviarEmail"]))
                {
                    SmtpClient SmtpServer = new SmtpClient(ConfigurationManager.AppSettings["smtp"]);
                    var mail = new MailMessage();
                    mail.From = new MailAddress(ConfigurationManager.AppSettings["enderecoDe"]);
                    mail.To.Add(ConfigurationManager.AppSettings["enderecoPara"]);
                    mail.Subject = ConfigurationManager.AppSettings["Asssunto"];
                    mail.IsBodyHtml = true;
                    string htmlBody;
                    htmlBody = string.Format("<p>Nome: {0} </p> <p>Email: {1} </p> <p>Assunto: {2} </p> <p>Mensagem: {3} </p>", contato.nome, contato.email,contato.assunto, contato.mensagem) ;
                    mail.Body = htmlBody;
                    SmtpServer.Port = Convert.ToInt32(ConfigurationManager.AppSettings["porta"]);
                    SmtpServer.UseDefaultCredentials = false;
                    SmtpServer.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["enderecoDe"], ConfigurationManager.AppSettings["senha"]);
                    SmtpServer.EnableSsl = true;
                    SmtpServer.Send(mail);
                }
                
                return Json(new { success = true, responseText = "Mensagem enviada com sucesso." }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                Logger.Error(ex, "Erro durante a função de contactar.");
                Logger.Info<contato>(contato);
                return Json(new { success = false, responseText = "Ocorreu um erro ao enviar sua mensagem." }, JsonRequestBehavior.AllowGet);

            }
        }

        public ActionResult Index()
        {
            try
            {
                return View(db.contato.OrderByDescending(_ => _.data).ToList());

            }
            catch (Exception ex)
            {
                Logger.Error(ex, "Erro ao tentar mostrar a lista de contatos.");
                return View();
            }
        }

        // GET: Contato/Details/5
        public ActionResult Details(int? id)
        {
            try
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                contato contato = db.contato.Find(id);
                if (contato == null)
                {
                    return HttpNotFound();
                }
                return View(contato);

            }
            catch (Exception ex)
            {
                Logger.Error(ex, "Erro ao tentar mostrar os detalhes do contato. Id: ", id);
                return View();
            }
        }

        // GET: Contato/Delete/5
        public ActionResult Delete(int? id)
        {
            try
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                contato contato = db.contato.Find(id);
                if (contato == null)
                {
                    return HttpNotFound();
                }
                return View(contato);
            }
            catch (Exception ex)
            {
                Logger.Error(ex, "Erro ao tentar deletar um contato. Id:", id);
                return View();
            }

        }

        // POST: Produto/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            contato contato = db.contato.Find(id);
            db.contato.Remove(contato);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}