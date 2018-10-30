using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace Materiales
{
    public partial class Login1 : System.Web.UI.Page
    {
     

        public void Page_Load(object sender, EventArgs e)
        {
            {
                
                
            }



        }

       public void BtnIngresar_Click(object sender, EventArgs e)
        {
            try
            {
                DataSetTableAdapters.UsuarioTableAdapter obj = new DataSetTableAdapters.UsuarioTableAdapter();
                string nombre = obj.Login(txtusu.Text, txtpass.Text).ToString();
                string tipo = obj.IngresoTipo(txtusu.Text).ToString();
              
                if (!nombre.Equals(""))
                
                {
                    switch (tipo)
                    {
                        case "Gerente":
                            Session["nom"] = nombre;
                            Response.Redirect("Gerente.aspx");
                            
                            break;
                        case "Solicitante":
                            Session["nom"] = nombre;
                            Response.Redirect("SolMat.aspx");
                            

                            break;
                        case "Contabilidad":
                            Session["nom"] = nombre;
                            Response.Redirect("Contabilidad.aspx");
                           
                            break;
                    }
                }
            }
            catch
            {
                lblestado.Text = "usario/clave incorrectos";
                
            }


        }

      
    }
}