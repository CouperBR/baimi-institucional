using BAIMI.Context;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;

namespace BAIMI.Controllers
{
    public class ContatoController : Controller
    {
        private static readonly NLog.Logger Logger = NLog.LogManager.GetCurrentClassLogger();

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
    }
}