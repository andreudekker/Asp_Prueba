using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Configuration;
using System.Data.SqlClient;


namespace Demo05_WinformsBD
{
    public partial class frmMantenimiento : Form
    {
          SqlConnection Cn = null;
       
        public frmMantenimiento()
        {
            InitializeComponent();
            string strCadenadeConexion = ConfigurationManager.ConnectionStrings["NWCN"].ConnectionString;
            Cn = new SqlConnection(strCadenadeConexion);
        }
        
        
       
        private void frmMantenimiento_Load(object sender, EventArgs e)
        {
           

            try
            {
                Cn.Open();
                DataTable tbltablas = Cn.GetSchema("Tables");
                DataView dv = tbltablas.AsDataView();
                dv.RowFilter = "TABLE_TYPE='BASE TABLE'";
                tbltablas = dv.ToTable();
                dv.Sort = "TABLE_NAME ASC";
                tbltablas = dv.ToTable();
                cboTabla.DataSource = tbltablas;
                cboTabla.DisplayMember = "TABLE_NAME";

                Cn.Close();

            }
            catch (SqlException sqlEx)
            {

                MessageBox.Show("Ocurrio un error:" + sqlEx.Message);
            }
            catch (NullReferenceException nullEX)
            {
                MessageBox.Show("Ocurrio un error:" + nullEX.Message);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ocurrio un error:" + ex.Message);
            }

        }

        private void btnListar_Click(object sender, EventArgs e)
        {
            SqlDataAdapter dap = new SqlDataAdapter("usp_mostrarInformacion", Cn);
            dap.SelectCommand.CommandType = CommandType.StoredProcedure;
            dap.SelectCommand.Parameters.AddWithValue("tabla", cboTabla.Text);
            DataTable tbl = new DataTable();

            try
            {
                dap.Fill(tbl);
            }
            catch (SqlException sqlEx)
            {
                
               MessageBox.Show("Esto es un error"+ sqlEx.Message);
            }
            catch(Exception ex)
            {
                MessageBox.Show("Es es un error:"+ex.Message);
            }
           
            dgvTabla.DataSource = tbl;
        }
    }
}