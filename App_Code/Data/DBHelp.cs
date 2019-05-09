using System;
using System.Data;
using System.Collections.Generic;
using System.Web;
using System.Configuration;
using System.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using qltt.Entities;
/// <summary>
/// Summary description for DBHelp
/// </summary>
namespace qltt.Data
{
    public class DBHelp:DAO
    {      
        //public string Chuoiketnoi = "";
        public DBHelp()
        {
            ////khoi tao chuoi ket noi
            //Chuoiketnoi = ConfigurationManager.ConnectionStrings["Ket_Noi"].ConnectionString;
        }
        // thhuc thi du lieu truy van kieu truyen gia tri
        public SqlDataReader Thucthidulieu(string Cautruyvan, CommandType Kieutruyvan)
        {
            SqlDataReader Doc = null;
            SqlConnection cn = Ketnoi();
            SqlCommand cmd = new SqlCommand(Cautruyvan, cn);
            try
            {
                cn.Open();
                cmd.CommandText = Cautruyvan;
                cmd.CommandType = Kieutruyvan;
                Doc = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            }
            catch
            {
            }
            return Doc;
        }
        //thuc thi du lieu kieu parameter gia tri truyen vao
        public SqlDataReader Thucthidulieu(string Cautruyvan, CommandType Kieutruyvan, params SqlParameter[] parameter)
        {
            SqlConnection cn = Ketnoi();
            SqlCommand cmd = new SqlCommand(Cautruyvan, cn);
            cn.Open();
            cmd.CommandType = Kieutruyvan;
            cmd.Parameters.Clear();
            for (int i = 0; i < parameter.Length - 1; i++)
            {
                cmd.Parameters.Add(parameter);
            }
            return cmd.ExecuteReader(CommandBehavior.CloseConnection);
        }
        //thuc thi lay du lieu theo linh vuc
        
    }
}