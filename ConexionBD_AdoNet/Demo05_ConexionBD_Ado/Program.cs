using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
namespace Demo05_ConexionBD_Ado
{
    public enum Tabla_Sql
    {
            Categories = 1,
            CustomerCustomerDemo = 2,
            CustomerDemographics = 3,
            Customers = 4,
            Employees = 5,
            EmployeeTerritories = 6,
            Order_Details = 7,
            Orders = 8,
            Products = 9,
            Region = 10,
            Shippers = 11,
            Suppliers = 12,
            Territories = 13,

    }

   
    class Program
    {

        static void Main(string[] args)
        {
            SqlConnection cn = new SqlConnection(@"Server=.;DataBase=Northwind;Integrated Security=TRUE");
            //cn.StateChange += new System.Data.StateChangeEventHandler(cn_StateChange);
            //cn.Open();
            //cn.Close();
            cn.Open();
            DataTable tblTablas= cn.GetSchema("Tables");
            DataView dv = tblTablas.DefaultView;
            dv.RowFilter="TABLE_TYPE ='BASE TABLE'";
            dv.Sort="TABLE_NAME ASC";
            tblTablas = dv.ToTable();
            Console.WriteLine("seleccione su tabla a visualizar");
             int Posicion =0;
            foreach (DataRow item in tblTablas.Rows)
            {
                Posicion ++;
                Console.WriteLine(Posicion.ToString()+":"+item["TABLE_NAME"].ToString());
            }
            Console.WriteLine("Ingrese el codigo de la tabla a visualizar");
            int intTabla = Convert.ToInt32( Console.ReadLine());
            Tabla_Sql tb = (Tabla_Sql)intTabla;
            string Tabla = Enum.GetName(typeof(Tabla_Sql),tb);
            string SQL = " Select * from " + Tabla;
            SqlDataAdapter dap =new SqlDataAdapter(SQL,cn);
            dap.SelectCommand.CommandType=CommandType.Text;
            DataTable tblInfo = new DataTable();
            dap.Fill(tblInfo);
            for (int i = 0; i < tblInfo.Rows.Count; i++)
            {
                string strInfo = "";
                for (int j = 0; j < tblInfo.Columns.Count; j++)
                {
                    strInfo += tblInfo.Rows[i][j].ToString()+"\t";
                }
                 Console.WriteLine(strInfo);
            }

            
            Console.ReadLine();

        }

        static void cn_StateChange(object sender, System.Data.StateChangeEventArgs e)
        {
            Console.WriteLine(e.OriginalState +"\t" + e.CurrentState);
        }
    }
}
