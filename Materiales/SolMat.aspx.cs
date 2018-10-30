using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Materiales
{
    public partial class IngresoMat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["nom"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                string usu = Session["nom"].ToString();
                Lblusu.Text = "" + usu;
            }

          
        }

        protected void BtnIngresar_Click(object sender, EventArgs e)
        {

           
                DataSetTableAdapters.Solicitud_ResumenTableAdapter obj = new DataSetTableAdapters.Solicitud_ResumenTableAdapter();
                DataSetTableAdapters.CentroCostoTableAdapter obj2 = new DataSetTableAdapters.CentroCostoTableAdapter();

            string dcl1 = DlCC0.SelectedValue;
            string cc = "  seleccionar";

            if (obj.Validaid(Lblusu.Text) == null)
            {
                if (dcl1 == cc)
                {
                    lblestado.Text = "Falta Centro de Costo";
                }
                else
                {
                    Session["CC"] = obj2.modificarCC(dcl1).ToString();
                    Session["DescCC"] = obj2.modificarDescCC(dcl1).ToString();
                    string IngresoResu = obj.InsertResumenUser(Lblusu.Text, "0", Session["CC"].ToString()).ToString();
                    Response.Write("<script>alert('Nueva solicitud creada');window.location.href='SolFormu.aspx'</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Se tomara la solicitud sin finalizar');window.location.href='SolFormu.aspx'</script>");
      
            }

            }

       
        }
    }
