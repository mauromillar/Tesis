using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Materiales
{
    public partial class Contabilidad1 : System.Web.UI.Page
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
    }
}