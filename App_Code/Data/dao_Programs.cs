using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for dao_Programs
/// </summary>
/// 
namespace qltt.Data
{
    public class dao_Programs : DAO
    {
        public dao_Programs()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public DataSet t_Programs_Lst(string HeadCode)
        {
            SqlConnection cn = Ketnoi();
            SqlDataAdapter da = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand("t_Programs_Lst", cn);
            
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@HeadCode", HeadCode));
            da.SelectCommand = cmd;
            
            DataSet ds = new DataSet();
            try
            {
                cn.Open();
                da.Fill(ds);
                cn.Close();
            }
            catch { }
            return ds;
        }
    }
}