using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Materiales
{
    public partial class SolEstado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = int.Parse(this.GridView1.DataKeys[e.RowIndex].Value.ToString());

            DataSetTableAdapters.Solicitud_mTableAdapter obj = new DataSetTableAdapters.Solicitud_mTableAdapter();
            obj.eliminarTablaDetalleUsuario(id);
            GridView2.DataBind();
            GridView3.DataBind();
            GridView4.DataBind();
        }
    }
}