using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Materiales
{
    public partial class ConEstado : System.Web.UI.Page
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

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = int.Parse(this.GridView1.DataKeys[e.RowIndex].Value.ToString());

            DataSetTableAdapters.Solicitud_ResumenTableAdapter obj = new DataSetTableAdapters.Solicitud_ResumenTableAdapter();
            string updateaprobado = obj.UpdateActuaEstado(id).ToString();
        }
    }
}