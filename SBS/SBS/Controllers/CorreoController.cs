using SBS.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net;
using System.Net.Mail;
using System.Web.Configuration;
using System.IO;
using System.Net.Mime;
using System.Configuration;

namespace SBS.Controllers.EnviarCorreo
{
    public class CorreoController : Controller
    {
        //ConfigurationManager.AppSettings["urlRegistraClabe"].ToString();
        //private string correoProveedor = "cristian.perez.garcia.54@gmail.com";
        private string correoProveedor = ConfigurationManager.AppSettings["correoProveedor"].ToString();
        private string socio1 = ConfigurationManager.AppSettings["socio1"].ToString(), socio2 = ConfigurationManager.AppSettings["socio2"].ToString(), socio3 = ConfigurationManager.AppSettings["socio3"].ToString();
        private string contrasenaProveedor = ConfigurationManager.AppSettings["contrasenaProveedor"].ToString();
        // GET: Correo
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult EnviarCorreoConctacto(ElementosCorreo requestForElementosCorreo)
        {
            try
            {
                

                string contrasenaProveedor = "ISC_chris_54";

                System.Net.Mail.MailMessage mmsg = new System.Net.Mail.MailMessage();
                //mmsg.To.Add(correoProveedor); // cuenta Email a la cual sera dirigido el correo
                mmsg.To.Add(socio1);
                //mmsg.To.Add(socio2);
                //mmsg.To.Add(socio3);
                mmsg.Subject = "SBS Servicio de Contacto"; //Asunto del correo
                mmsg.SubjectEncoding = System.Text.Encoding.UTF8; //cambiamos el tipo de texto a UTF8
                //mmsg.Bcc.Add("var901106@gmail.com"); //es para quien este dirigida una copia sobre ese correo
                string logoURL = Server.MapPath("~" + WebConfigurationManager.AppSettings["pathImagenesLogo"].ToString());
                mmsg.IsBodyHtml = true;
                mmsg.Body =
                    "<img src ='cid:SBSLogo'></img>"+
                    "<br>" + "<h3>Nombre del Negocio: </h3>" + "<h2>" + requestForElementosCorreo.nombreNegocio + "</h2>" + 
                    "<br>" + "<h3>Correo de quien nos contacto: </h3>" + "<h2>"+  requestForElementosCorreo.mail + "</h2>" +
                    "<br>" + "<h3>Tipo de proyecto solicitado: </h3>" + "<h2>" + requestForElementosCorreo.tipoProyecto + "</h2>" +
                    "<br>" + "<h3>Número de celular de quien nos contacto: </h3>" + "<h2>" + requestForElementosCorreo.telCelular + "</h2>" +
                    "<br>" + "<h3>Nombre de quien solicito el presupuesto: </h3>" + "<h2>" + requestForElementosCorreo.nombreInteresado + "</h2>" +
                    "<br>" + "<h3>Presupuesto : </h3>" + "<h2>" + requestForElementosCorreo.presupuesto + "</h2>" +
                    "<br>" + "<h3>Medio por el cual conocio nuestros servicios: </h3>" + "<h2>" + requestForElementosCorreo.medioConctacto + "</h2>" ; //Cuerpo del mensaje
                mmsg.BodyEncoding = System.Text.Encoding.UTF8; // tambien encodear a utf8
                mmsg.IsBodyHtml = true; // indicamos que dentro del body viene codigo HTML
                mmsg.From = new System.Net.Mail.MailAddress(correoProveedor); // el email que enviara el correo (proveedor)           
                
                string pathFondoFirma = logoURL;
                string attachmentPath = Path.Combine(pathFondoFirma);  //valoresConfig.AppSettings.Settings["imagenFirma"].Value.ToString();
                string contentID = Path.GetFileName(attachmentPath).Replace(".", "");
                Attachment imagenFirma = new Attachment(attachmentPath);
                imagenFirma.ContentDisposition.Inline = true;
                imagenFirma.ContentDisposition.DispositionType = DispositionTypeNames.Inline;
                imagenFirma.ContentId = contentID;
                imagenFirma.ContentType.MediaType = "image/png";
                imagenFirma.ContentType.Name = Path.GetFileName(attachmentPath);
                mmsg.Attachments.Add(imagenFirma);
                mmsg.Body = mmsg.Body.Replace("SBSLogo", contentID);



                System.Net.Mail.SmtpClient cliente = new System.Net.Mail.SmtpClient(); // se realiza el cliente correo
                cliente.Credentials = new System.Net.NetworkCredential(correoProveedor, contrasenaProveedor);  // Credenciales del correo emisor

                cliente.Port = 587;
                cliente.EnableSsl = true;

                cliente.Host = "smtp.gmail.com"; //mail.dominio.com

                //smtp
                cliente.Send(mmsg);


                return Json(new { estatus = true}, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return new HttpStatusCodeResult(500, ex.Message);
            }
        }

        [HttpPost]
        public ActionResult EnviarCorreoSuscribcion(ElementosCorreo requestForElementosCorreo)
        {
            try
            {
                System.Net.Mail.MailMessage mmsg = new System.Net.Mail.MailMessage();
                //mmsg.To.Add(correoProveedor); // cuenta Email a la cual sera dirigido el correo
                mmsg.To.Add(socio1);
                //mmsg.To.Add(socio2);
                //mmsg.To.Add(socio3);
                mmsg.Subject = "SBS Servicio de Registro"; //Asunto del correo
                mmsg.SubjectEncoding = System.Text.Encoding.UTF8; //cambiamos el tipo de texto a UTF8
                //mmsg.Bcc.Add("var901106@gmail.com"); //es para quien este dirigida una copia sobre ese correo
                string logoURL = Server.MapPath("~" + WebConfigurationManager.AppSettings["pathImagenesLogo"].ToString());
                mmsg.IsBodyHtml = true;
                mmsg.Body =
                    "<img src ='cid:SBSLogo'></img>" +
                    "<br>" + "<h3>Nombre de la persona registrada: </h3>" + "<h2>" + requestForElementosCorreo.nombreInteresado + "</h2>" +
                    "<br>" + "<h3>Correo de la persona registrada: </h3>" + "<h2>" + requestForElementosCorreo.mail + "</h2>" 
                    //"<br>" + "<h3>Tipo de proyecto solicitado: </h3>" + "<h2>" + requestForElementosCorreo.tipoProyecto + "</h2>" +
                    //"<br>" + "<h3>Número de celular de quien nos contacto: </h3>" + "<h2>" + requestForElementosCorreo.telCelular + "</h2>" +
                    //"<br>" + "<h3>Nombre de quien solicito el presupuesto: </h3>" + "<h2>" + requestForElementosCorreo.nombreInteresado + "</h2>" +
                    //"<br>" + "<h3>Presupuesto : </h3>" + "<h2>" + requestForElementosCorreo.presupuesto + "</h2>" +
                    //"<br>" + "<h3>Medio por el cual conocio nuestros servicios: </h3>" + "<h2>" + requestForElementosCorreo.medioConctacto + "</h2>"
                    ; //Cuerpo del mensaje
                mmsg.BodyEncoding = System.Text.Encoding.UTF8; // tambien encodear a utf8
                mmsg.IsBodyHtml = true; // indicamos que dentro del body viene codigo HTML
                mmsg.From = new System.Net.Mail.MailAddress(correoProveedor); // el email que enviara el correo (proveedor)           

                string pathFondoFirma = logoURL;
                string attachmentPath = Path.Combine(pathFondoFirma);  //valoresConfig.AppSettings.Settings["imagenFirma"].Value.ToString();
                string contentID = Path.GetFileName(attachmentPath).Replace(".", "");
                Attachment imagenFirma = new Attachment(attachmentPath);
                imagenFirma.ContentDisposition.Inline = true;
                imagenFirma.ContentDisposition.DispositionType = DispositionTypeNames.Inline;
                imagenFirma.ContentId = contentID;
                imagenFirma.ContentType.MediaType = "image/png";
                imagenFirma.ContentType.Name = Path.GetFileName(attachmentPath);
                mmsg.Attachments.Add(imagenFirma);
                mmsg.Body = mmsg.Body.Replace("SBSLogo", contentID);



                System.Net.Mail.SmtpClient cliente = new System.Net.Mail.SmtpClient(); // se realiza el cliente correo
                cliente.Credentials = new System.Net.NetworkCredential(correoProveedor, contrasenaProveedor);  // Credenciales del correo emisor

                cliente.Port = 587;
                cliente.EnableSsl = true;

                cliente.Host = "smtp.gmail.com"; //mail.dominio.com

                //smtp
                cliente.Send(mmsg);


                return Json(new { estatus = true }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return new HttpStatusCodeResult(500, ex.Message);
            }
        }

    }
}
