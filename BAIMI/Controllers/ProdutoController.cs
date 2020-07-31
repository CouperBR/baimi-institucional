using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.IO;
using BAIMI.Context;
using System.Text.RegularExpressions;
using System.Net.Mail;
using System.Configuration;

namespace BAIMI.Controllers
{
    public class ProdutoController : Controller
    {
        private static readonly NLog.Logger Logger = NLog.LogManager.GetCurrentClassLogger();

        private BaimiContext db = new BaimiContext();

        // GET: Produto
        public ActionResult Index()
        {
            try
            {
                return View(db.produto.ToList());

            }
            catch (Exception ex)
            {
                Logger.Error(ex, "Erro ao tentar mostrar a lista de produtos.");
                return View();
            }
        }

        // GET: Produto/Details/5
        public ActionResult Details(int? id)
        {
            try
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                produto produto = db.produto.Find(id);
                if (produto == null)
                {
                    return HttpNotFound();
                }
                return View(produto);

            }
            catch (Exception ex)
            {
                Logger.Error(ex, "Erro ao tentar mostrar os detalhes do produto. Id: ", id);
                return View();
            }
        }

        // GET: Produto/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Produto/Create
        // Para se proteger de mais ataques, ative as propriedades específicas a que você quer se conectar. Para 
        // obter mais detalhes, consulte https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(produto produto)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    //how many image upload this count using count() and if  ther is no any file that time this code not execute.  
                    if (produto.ImageUpload != null)
                    {
                        produto.url_foto = SaveImage(produto.ImageUpload);
                    }

                    db.produto.Add(produto);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }

                return View(produto);
            }
            catch (Exception ex)
            {
                Logger.Error(ex, "Erro ao tentar criar um produto. Produto: ", produto);
                return View();
            }


        }

        // GET: Produto/Edit/5
        public ActionResult Edit(int? id)
        {
            try
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                produto produto = db.produto.Find(id);
                if (produto == null)
                {
                    return HttpNotFound();
                }
                return View(produto);

            }
            catch (Exception ex)
            {
                Logger.Error(ex, "Erro ao tentar entrar na tela de edição de um produto. Id: ", id);
                return View();
            }
            
        }

        // POST: Produto/Edit/5
        // Para se proteger de mais ataques, ative as propriedades específicas a que você quer se conectar. Para 
        // obter mais detalhes, consulte https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(produto produto)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    //how many image upload this count using count() and if  ther is no any file that time this code not execute.  
                    if (produto.ImageUpload != null)
                    {
                        DeleteFile(produto.url_foto);
                        produto.url_foto = SaveImage(produto.ImageUpload);

                    }

                    db.Entry(produto).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                return View(produto);
            }
            catch (Exception ex)
            {
                Logger.Error(ex, "Erro ao tentar editar um produto.", produto);
                return View();
            }
            
        }

        // GET: Produto/Delete/5
        public ActionResult Delete(int? id)
        {
            try
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                produto produto = db.produto.Find(id);
                if (produto == null)
                {
                    return HttpNotFound();
                }
                return View(produto);
            }
            catch (Exception ex)
            {
                Logger.Error(ex, "Erro ao tentar deletar um produto. Id:", id);
                return View();
            }
            
        }

        // POST: Produto/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            produto produto = db.produto.Find(id);
            DeleteFile(produto.url_foto);
            db.produto.Remove(produto);
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

        private string SaveImage(HttpPostedFileBase image)
        {
            try
            {
                //here filename variable used because each image name store in that filename  
                var fileName = String.Empty;
                //uploaded image filename get using below line  
                fileName = Path.GetFileName(image.FileName);
                //if youwant rename this file this like  
                fileName = fileName.Substring(0, fileName.IndexOf('.')) + "_" + DateTime.Now.Millisecond + "-" + DateTime.Now.Second + "-" + DateTime.Now.Minute + "-" + DateTime.Now.Hour + "." + fileName.Substring(fileName.IndexOf('.') + 1);
                //”Images ” this is folder created we are uploading image in that folder  
                var uploadDir = "~/uploads";
                //your folder name path and image name combined in Server.MapPath()  
                var imagePath = Path.Combine(Server.MapPath(uploadDir), fileName);
                //when you have Saveas() call and imagepath as parameter that time this image store in thif Folder.  
                image.SaveAs(imagePath);

                return fileName;
            }
            catch (Exception e)
            {
                Logger.Error(e, "Erro ao salvar a imagem.");
            }

            return string.Empty;
        }

        private void DeleteFile(string filePath)
        {
            try
            {
                if (string.IsNullOrEmpty(filePath))
                    return;

                var uploadDir = "~/uploads";
                // Check if file exists with its full path    
                if (System.IO.File.Exists(Path.Combine(Server.MapPath(uploadDir), filePath)))
                {
                    // If file found, delete it    
                    System.IO.File.Delete(Path.Combine(Server.MapPath(uploadDir), filePath));
                    Console.WriteLine("File deleted.");
                }
                else Console.WriteLine("File not found");
            }
            catch (Exception e)
            {
                Logger.Error(e, "Erro ao deletar o arquivo.");
            }
        }

        [HttpGet]
        public ActionResult VerProduto(int id)
        {
            try
            {
                ViewBag.HideNavBar = true;
                var produto = db.produto.Find(id);
                return View(produto);
            }
            catch (Exception ex)
            {
                Logger.Error(ex, "Erro ao ver o produto");
                return View();
            }
        }

        [HttpPost]
        [Route("comprar/{id:int}")]
        public ActionResult Comprar(int id)
        {
            try
            {
                var produto = db.produto.Find(id);
                return View(produto);
            }
            catch (Exception ex)
            {
                Logger.Error(ex, "Erro ao ir para tela de compra.");
                return View();
            }
        }

        [HttpPost]
        [Route("checkout")]
        public ActionResult Checkout(compra compra)
        {
            try
            {
                if (compra.produto_id > 0)
                {
                    compra.data_compra = DateTime.Now;
                    compra.cpf = string.IsNullOrEmpty(compra.cpf) ? Regex.Replace(compra.cpf, "[^0-9]", "") : string.Empty;
                    db.compra.Add(compra);
                    db.SaveChanges();

                    db.compra_produto.Add(new compra_produto
                    {
                        produto_id = compra.produto_id,
                        compra_id = compra.id
                    });
                    db.SaveChanges();
                    EnviarEmailNovaCompra(compra);
                    return View();
                }

                return RedirectToAction("VerProduto", new { id = compra.produto_id });
            }
            catch (Exception ex)
            {
                Logger.Error(ex, "Erro ao fechar compra.");
                return RedirectToAction("VerProduto", new { id = compra.produto_id } );
            }
        }

        private void EnviarEmailNovaCompra(compra compra)
        {
            try
            {
                SmtpClient SmtpServer = new SmtpClient(ConfigurationManager.AppSettings["smtp"]);
                var mail = new MailMessage();
                mail.From = new MailAddress(ConfigurationManager.AppSettings["enderecoDe"]);
                mail.To.Add(ConfigurationManager.AppSettings["enderecoPara"]);
                mail.Subject = "BAIMI - NOVA COMPRA";
                mail.IsBodyHtml = true;
                string htmlBody;
                htmlBody = $"<p>Nome: {compra.nome_completo} </p> <p>CPF: {compra.cpf} </p> <p>Data de nascimento: {compra.data_nascimento} </p> <p>Telefone de contato: {compra.telefone_contato} </p> <p> Endereco completo de entrega: {compra.endereco_completo_entrega} </p> <p> Ponto de referência: {compra.ponto_referencia} </p> <p> Email: {compra.email} </p> <p> Indicação: {compra.indicacao} </p> <p> Forma de Pagamento: {compra.forma_pagamento} </p> <p> Observações: {compra.observacoes} </p>";
                mail.Body = htmlBody;
                SmtpServer.Port = Convert.ToInt32(ConfigurationManager.AppSettings["porta"]);
                SmtpServer.UseDefaultCredentials = false;
                SmtpServer.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["enderecoDe"], ConfigurationManager.AppSettings["senha"]);
                SmtpServer.EnableSsl = true;
                SmtpServer.Send(mail);
            }
            catch (Exception ex)
            {
                Logger.Error(ex, "Erro ao enviar email de nova compra");
                return;
            }
        }
    }
}
