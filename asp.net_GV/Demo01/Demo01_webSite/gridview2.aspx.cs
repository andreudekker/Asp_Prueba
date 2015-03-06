using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


namespace Demo01_webSite
{
    public partial class gridview2 : System.Web.UI.Page
    {
        SqlConnection Cn = new SqlConnection(ConfigurationManager.ConnectionStrings["NorthwindConnectionString"].ConnectionString);

        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                listarProductos();    
            }
            
        }


        public void listarProductos()
        {
            SqlDataAdapter dap = new SqlDataAdapter("usp_listarProductos", Cn);
            dap.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable tblProductos = new DataTable();
            dap.Fill(tblProductos);
            gvProductos.DataSource = tblProductos;
            gvProductos.DataBind();


        }
            
        protected void gvProductos_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvProductos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvProductos.PageIndex = e.NewPageIndex;
            listarProductos();
        }

        protected void gvProductos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvProductos.EditIndex = e.NewEditIndex;
            listarProductos();
        }
    }
}