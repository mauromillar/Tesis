using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.IO;
using System.Text;
using System.ComponentModel;
using System.Threading.Tasks;
using System.Threading;
using System.Data;

namespace Materiales
{
    public partial class GerAprobacion : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["nom"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {

            }

       


        }
        public override void VerifyRenderingInServerForm(Control control)
        {

        }
       
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Session["id"] = int.Parse(this.GridView1.DataKeys[e.RowIndex].Value.ToString());
            RadioButtonList rbl = (RadioButtonList)this.GridView1.Rows[e.RowIndex].FindControl("RadioButtonList1");
            string aprobado = Convert.ToString(rbl.SelectedValue);
            int id = Convert.ToInt32(Session["id"]);
            if (aprobado == "Aprobado")
            {
                
                DataSetTableAdapters.Solicitud_ResumenTableAdapter obj = new DataSetTableAdapters.Solicitud_ResumenTableAdapter();
                obj.UpdateActuaEstado(id).ToString();
                Thread t = new Thread(EjecutarSP);
                t.Start();
                Response.Write("<script>alert('Se aceptó la solicitud. Email Enviado.');</script>");
                Thread.Sleep(1000);
                



            }
            else if (aprobado == "Rechazado")
            {
                DataSetTableAdapters.Solicitud_mTableAdapter obj = new DataSetTableAdapters.Solicitud_mTableAdapter();
                obj.UpdateActuaRechazado(id).ToString();
                Thread t = new Thread(EjecutarSP2);
                t.Start();
                Response.Write("<script>alert('Se rechazó la solicitud. Email Enviado.');</script>");
                Thread.Sleep(1000);

            }
         
            
           
        }
        private string GridViewToHtml(GridView GridView3)
        {
            StringBuilder sb = new StringBuilder();
            StringWriter sw = new StringWriter(sb);
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            GridView3.AllowPaging = true;
            GridView3.RenderControl(hw);
            return sb.ToString();

        }
        private void EjecutarSP()
        {
            DataSetTableAdapters.UsuarioTableAdapter obj = new DataSetTableAdapters.UsuarioTableAdapter();
            DataSetTableAdapters.Solicitud_mTableAdapter obj1 = new DataSetTableAdapters.Solicitud_mTableAdapter();
            
            int id = Convert.ToInt32(Session["id"]);
            string emailger = obj.UsuarioCorreo(Session["nom"].ToString()).ToString();
            string emailus = obj1.Emailxid(Convert.ToString(id)).ToString();


            MailMessage oMsg = new MailMessage();
            //Desde
            oMsg.From = new MailAddress(""+ emailger);
            //Para
            oMsg.To.Add(""+ emailus);
            //Copia 
            oMsg.Bcc.Add("AdministracionTradis@Falabella.cl");
            //Asunto
            oMsg.Subject = "Solicitud Aprobada";
            //Cuerpo del Mensaje



            oMsg.Body = "Se ha Aprobado la solicitud " + id +" <br />Para revisar la solicitud, ingrese <a href=http://10.38.60.4/Materiales/Login.aspx> Aqui</a>.";
            oMsg.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient("emailsrv.falabella.cl");
            smtp.Port = 25;
            smtp.Send(oMsg);
            oMsg.IsBodyHtml = true;
        }
        private void EjecutarSP2()
        {
            DataSetTableAdapters.UsuarioTableAdapter obj = new DataSetTableAdapters.UsuarioTableAdapter();
            DataSetTableAdapters.Solicitud_mTableAdapter obj1 = new DataSetTableAdapters.Solicitud_mTableAdapter();

            int id = Convert.ToInt32(Session["id"]);
            string emailger = obj.UsuarioCorreo(Session["nom"].ToString()).ToString();
            string emailus = obj1.Emailxid(Convert.ToString(id)).ToString();


            MailMessage oMsg = new MailMessage();
            //Desde
            oMsg.From = new MailAddress("" + emailger);
            //Para
            oMsg.To.Add("" + emailus);
            //Copia 
            oMsg.Bcc.Add("AdministracionTradis@Falabella.cl");
            //Asunto
            oMsg.Subject = "Solicitud Aprobada";
            //Cuerpo del Mensaje



            oMsg.Body = "Se ha Rechazado la solicitud " + id + " <br />Para revisar la solicitud, ingrese <a href=http://10.38.60.4/Materiales/Login.aspx> Aqui</a>.";
            oMsg.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient("emailsrv.falabella.cl");
            smtp.Port = 25;
            smtp.Send(oMsg);
            oMsg.IsBodyHtml = true;
        }

    
    }
   

}