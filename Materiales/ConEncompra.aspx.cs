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

namespace Materiales
{
    public partial class WebForm1 : System.Web.UI.Page
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
        private string GridViewToHtml(GridView GridView1)
        {
            StringBuilder sb = new StringBuilder();
            StringWriter sw = new StringWriter(sb);
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            GridView1.AllowPaging = true;
            GridView1.RenderControl(hw);
            return sb.ToString();
        }
        public void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Session["id1"] = this.GridView1.DataKeys[e.RowIndex].Value.ToString();
            RadioButtonList RadioButtonList1 = (RadioButtonList)this.GridView1.Rows[e.RowIndex].FindControl("RadioButtonList1");
            string aprobado = Convert.ToString(RadioButtonList1.SelectedValue);
            int id = Convert.ToInt32(Session["id1"]);

            if (aprobado == "Para Retirar")
            {
                DataSetTableAdapters.Solicitud_mTableAdapter obj2 = new DataSetTableAdapters.Solicitud_mTableAdapter();
                obj2.UpdateActuaEstadoPara_Retirar(Convert.ToString(id)).ToString();
                Thread t = new Thread(EjecutarSP);
                t.Start();
                Response.Write("<script>alert('Se ha Enviado correctamente el correo');</script>");
                Thread.Sleep(1000);

            }
            else
            {
               
            }
         

        }


        private void EjecutarSP()
        {
            //Envio de correo

            int id = Convert.ToInt32(Session["id1"]);
            DataSetTableAdapters.Solicitud_mTableAdapter obj = new DataSetTableAdapters.Solicitud_mTableAdapter();
            string emailus = obj.Emailxid(Convert.ToString(id)).ToString();


            MailMessage oMsg = new MailMessage();
            //Desde
            oMsg.From = new MailAddress("Administracion@falabella.cl");
            //Para
            oMsg.To.Add("" + emailus);
            //Copia 
           // oMsg.Bcc.Add("");
            //Asunto
            oMsg.Subject = "Solicitud Comprada";
            //Cuerpo del Mensaje


            oMsg.Body = "Se ha Comprado su solicitud con el numero de identificar "+id+", favor retirar en Administracion," + " <br />Para revisar la solicitud, ingrese <a href=http://10.38.60.4/Materiales/Login.aspx> Aqui</a>.";
            oMsg.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient("emailsrv.falabella.cl");
            smtp.Port = 25;
            smtp.Send(oMsg);
            oMsg.IsBodyHtml = true;


        }


    }
}