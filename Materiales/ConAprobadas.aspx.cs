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


namespace Materiales
{
    public partial class ConAprobadas : System.Web.UI.Page
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
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = int.Parse(this.GridView1.DataKeys[e.RowIndex].Value.ToString());
            RadioButtonList rbl = (RadioButtonList)this.GridView1.Rows[e.RowIndex].FindControl("RadioButtonList1");  
            string aprobado = Convert.ToString(rbl.SelectedValue);

            if ( aprobado == "En Compra")
            {
                DataSetTableAdapters.Solicitud_mTableAdapter obj = new DataSetTableAdapters.Solicitud_mTableAdapter();
                string updateaprobado = obj.UpdateActuaEstadoEn_Compra(id).ToString();
            }
            else
            {

            }
                
               
         

        }
    }
}