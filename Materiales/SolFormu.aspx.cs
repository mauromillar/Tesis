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
    public partial class SolFormu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["nom"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {

                DataSetTableAdapters.Solicitud_ResumenTableAdapter obj4 = new DataSetTableAdapters.Solicitud_ResumenTableAdapter();
                DataTable dt = obj4.seleccionarID(Session["nom"].ToString());
                Lblid.Text = dt.Rows[0][0].ToString();
                Lblusu.Text = dt.Rows[0][1].ToString();
                lblcc.Text = dt.Rows[0][2].ToString();
            }

         

        }
        protected void dlmat_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataSetTableAdapters.Listado_MaterialesTableAdapter obj11 = new DataSetTableAdapters.Listado_MaterialesTableAdapter();
            string mostarUnidad = obj11.MuestraCantidaProd(dlmat.SelectedValue).ToString();
            string mostrarut = obj11.MuestraUT(dlmat.SelectedValue).ToString();
            lblut.Text = "" + mostrarut;
            //LblCant.Text = "" + mostarUnidad;
        }

        public override void VerifyRenderingInServerForm(Control control)
        {

        }


        protected void BtnIngresar_Click(object sender, EventArgs e)
        {
            string cc, Material, pendiente, fecha, nombre;
            int cantidad, id_solicitud;

            if (txtcant.Text == "")
            {
                LblEstado.Text = "Ingresar La cantadidad";
            }
            else
            {
                fecha = DateTime.Today.ToString("dd-MM-yyyy");
                id_solicitud = Convert.ToInt32(Lblid.Text);
                pendiente = "En Proceso";
                Material = dlmat.SelectedValue;
                cantidad = Convert.ToInt32(txtcant.Text);


                //covierte la ref
                DataSetTableAdapters.Listado_MaterialesTableAdapter obj1 = new DataSetTableAdapters.Listado_MaterialesTableAdapter();
                string ing_ref = obj1.modificarRef(Material).ToString();
                string ing_dec = obj1.modificarDescrp(Material).ToString();
                string ing_untranf = obj1.unidadTransferencia(Material).ToString();


                //inserta datos
                DataSetTableAdapters.Solicitud_mTableAdapter obj = new DataSetTableAdapters.Solicitud_mTableAdapter();
                string descc = obj.DESCCC(lblcc.Text).ToString();

                obj.InsertMaterial(id_solicitud, lblcc.Text, descc, Session["nom"].ToString(), ing_ref, ing_dec, cantidad, pendiente, fecha, ing_untranf);

                if (cantidad <= 1)
                {
                    //consulta precio y updateo
                    DataSetTableAdapters.PreciosMaterialesTableAdapter obj3 = new DataSetTableAdapters.PreciosMaterialesTableAdapter();
                    string precio = obj3.SelectPrecio(Session["nom"].ToString()).ToString();
                    obj.UpdatePrecio(precio);
                    obj.UpdatePrecioUnitario(precio);
                }
                else
                {
                    //genera suma y total
                    DataSetTableAdapters.PreciosMaterialesTableAdapter obj3 = new DataSetTableAdapters.PreciosMaterialesTableAdapter();
                    string precio = obj3.SelectPrecio(Session["nom"].ToString()).ToString();
                    int resultado = Convert.ToInt32(precio) * cantidad;
                    string resultadostring = Convert.ToString(resultado);
                    obj.UpdatePrecio(resultadostring);
                    obj.UpdatePrecioUnitario(precio);
                }

                txtcant.Text = "";
                LblEstado.Text = "Ingreso de Material Correcto";
                GridView1.DataBind();
                DataSetTableAdapters.Solicitud_ResumenTableAdapter obj7 = new DataSetTableAdapters.Solicitud_ResumenTableAdapter();
                obj7.UpdateSolicitud_Resu(Lblid.Text);
            }



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

        protected void Btnfinal_Click1(object sender, EventArgs e)

        {
            DataSetTableAdapters.Solicitud_ResumenTableAdapter obj = new DataSetTableAdapters.Solicitud_ResumenTableAdapter();
        

            if (obj.ConsultoparaFinalizar(Lblid.Text) == null)
            {
                LblEstado.Text = "Ingresar un Suministro";
                
            }

            else
            {
                string cc, nombre, fecha, pendiente;
                pendiente = "Pendiente";
                fecha = DateTime.Today.ToString("dd-MM-yyyy");
                string usu = Lblusu.Text;


                //ConsultarPrecioTotal
                DataSetTableAdapters.SumaPrecioTableAdapter obj6 = new DataSetTableAdapters.SumaPrecioTableAdapter();
                string SumaPrecio = obj6.PrecioTotal(usu).ToString();
                // finalizo solicitud
                DataSetTableAdapters.Solicitud_ResumenTableAdapter obj5 = new DataSetTableAdapters.Solicitud_ResumenTableAdapter();
                obj5.UpdateSolicitud_resufinal(lblcc.Text, fecha, SumaPrecio,Lblid.Text, pendiente);


                Thread t = new Thread(EjecutarSP);
                t.Start();
                Lblid.Focus();
                GridView1.DataBind();
                Thread.Sleep(500);
                Response.Write("<script>alert('Solicitud Ingresada');window.location.href='SolEstado.aspx'</script>");

            }
        }
        private void EjecutarSP()
        {
            string cc, nombre, fecha, pendiente;
            pendiente = "Pendiente";
            fecha = DateTime.Today.ToString("dd-MM-yyyy");
            string usu = Session["nom"].ToString();




            // envio el correo del usuario
            DataSetTableAdapters.UsuarioTableAdapter obj = new DataSetTableAdapters.UsuarioTableAdapter();
            string email = obj.UsuarioCorreo(Lblusu.Text).ToString();



            // consulto y envio el correo del gerente x el CC
            DataSetTableAdapters.CD_GERENCIATableAdapter obj3 = new DataSetTableAdapters.CD_GERENCIATableAdapter();
            string correoGer = obj3.UsuarioCorreoGerente(lblcc.Text).ToString();

            // actualizo el estado de la tabla 

            DataSetTableAdapters.Solicitud_mTableAdapter obj4 = new DataSetTableAdapters.Solicitud_mTableAdapter();
            obj4.UpdatePendiente(usu);

            MailMessage oMsg = new MailMessage();


            //Desde
            oMsg.From = new MailAddress("AdministracionTradis@Falabella.cl");
            //Parañdigame

            oMsg.To.Add("" + email);
            //Copia 
            oMsg.Bcc.Add("" + correoGer);
            oMsg.Bcc.Add("AdministracionTradis@Falabella.cl");
            //Asunto
            oMsg.Subject = "Nueva Solicitud de Materiales";
            //Cuerpo del Mensaje
            oMsg.Body = "Se ha generado una nueva solicitud de materiales del usuario " + Lblusu.Text + " y su numero de solicitud es el  " + Lblid.Text + "<br /><br/>" + GridViewToHtml(GridView1) + "<br /> Para poder revisar su solicitud, Ingrese <a href=http://10.38.60.4/Materiales/Login.aspx >Aqui</a>.";
            oMsg.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient("emailsrv.falabella.cl");
            smtp.Port = 25;
            smtp.Send(oMsg);
            oMsg.IsBodyHtml = true;
        }


    }
}