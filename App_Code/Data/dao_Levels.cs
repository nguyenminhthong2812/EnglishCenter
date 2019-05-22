using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for dao_Levels
/// </summary>
/// 
namespace qltt.Data
{
    public class dao_Levels : DAO
    {
        public dao_Levels()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public DataSet t_Levels_Lst(string ProgramCode)
        {
            SqlConnection cn = Ketnoi();
            SqlDataAdapter da = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand("t_Levels_Lst", cn);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@ProgramCode", ProgramCode));
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