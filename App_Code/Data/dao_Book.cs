using qltt.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
//using System.Linq;
using System.Web;

/// <summary>
/// Summary description for XLBook
/// </summary>
/// 
namespace qltt.Data
{
    public class dao_Book:DAO
    {
        DBHelp db = new DBHelp();
        public dao_Book()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        //Them moi 1 quyen sach
        public void Themmoi(Book sach)
        {
            SqlConnection cn = Ketnoi();
            SqlCommand cmd = new SqlCommand("XL_Themsach", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@LinhvucID", sach.LinhvucID));
            cmd.Parameters.Add(new SqlParameter("@Tensach", sach.Tensach));
            cmd.Parameters.Add(new SqlParameter("@MaCTLinhVuc", sach.Tensach));
            cmd.Parameters.Add(new SqlParameter("@Tomtac", sach.Tomtac));
            cmd.Parameters.Add(new SqlParameter("@Noidung", sach.Noidung));
            cmd.Parameters.Add(new SqlParameter("@NXB", sach.NXB));
            cmd.Parameters.Add(new SqlParameter("@NamXB", sach.NamXB));
            cmd.Parameters.Add(new SqlParameter("@Tacgia", sach.Tacgia));
            cmd.Parameters.Add(new SqlParameter("@Dichgia", sach.Dichgia));
            cmd.Parameters.Add(new SqlParameter("@Sotrang", sach.Sotrang));
            cmd.Parameters.Add(new SqlParameter("@Kichthuoc", sach.Kichthuoc));
            cmd.Parameters.Add(new SqlParameter("@Trongluong", sach.Trongluong));
            cmd.Parameters.Add(new SqlParameter("@Hinhanh", sach.Hinhanh));
            cmd.Parameters.Add(new SqlParameter("@Giabia", sach.Giabia));
            cmd.Parameters.Add(new SqlParameter("@Soluotxem", sach.Soluotxem));
            cmd.Parameters.Add(new SqlParameter("@Ngaycapnhat", sach.Ngaycapnhat));
            cmd.Parameters.Add(new SqlParameter("@Socomment", sach.Socomment));
            cn.Open();
            try
            {
                cmd.ExecuteNonQuery();
                cn.Close();
            }
            catch
            {

            }
        }
        //cap nhat sach
        public void Capnhatsach(Book sach)
        {
            SqlConnection cn = Ketnoi();
            SqlCommand cmd = new SqlCommand("XL_Capnhatsach", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@SachID", sach.SachID));
            cmd.Parameters.Add(new SqlParameter("@Tensach", sach.Tensach));
            cmd.Parameters.Add(new SqlParameter("@Tomtac", sach.Tomtac));
            cmd.Parameters.Add(new SqlParameter("@Noidung", sach.Noidung));
            cmd.Parameters.Add(new SqlParameter("@NXB", sach.NXB));
            cmd.Parameters.Add(new SqlParameter("@NamXB", sach.NamXB));
            cmd.Parameters.Add(new SqlParameter("@Tacgia", sach.Tacgia));
            cmd.Parameters.Add(new SqlParameter("@Dichgia", sach.Dichgia));
            cmd.Parameters.Add(new SqlParameter("@Hinhanh", sach.Hinhanh));
            cmd.Parameters.Add(new SqlParameter("@Giabia", sach.Giabia));
            cn.Open();
            try
            {
                cmd.ExecuteNonQuery();
                cn.Close();
            }
            catch
            {

            }
        }
        //xoa sach
        public void Xoasach(Book sach)
        {
            SqlConnection cn = Ketnoi();
            SqlCommand cmd = new SqlCommand("XL_Xoasach", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@SachID", sach.SachID));
            cn.Open();
            try
            {
                cmd.ExecuteNonQuery();
                cn.Close();
            }
            catch
            {

            }
        }
        public string thongbao()
        {
            string _Tensach = "";
            SqlDataReader DR = db.Thucthidulieu("sp_test", CommandType.Text);
            DR.Read();
            _Tensach = DR[0].ToString();
            return _Tensach;
        }
        public int t_Books_Ins(int Loai,string BookCode, string Name, string LevelCode, double Price, int Total)
        {
            int kq = 0;
            SqlConnection cn = Ketnoi();
            SqlCommand cmd = new SqlCommand("t_Books_Ins", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@Loai", Loai));
            cmd.Parameters.Add(new SqlParameter("@BookCode", BookCode));
            cmd.Parameters.Add(new SqlParameter("@Name", Name));
            cmd.Parameters.Add(new SqlParameter("@LevelCode", LevelCode));
            cmd.Parameters.Add(new SqlParameter("@Price", Price));
            cmd.Parameters.Add(new SqlParameter("@Total", Total));
            SqlParameter outPutParameter = new SqlParameter();
            outPutParameter.ParameterName = "@tt";
            outPutParameter.SqlDbType = System.Data.SqlDbType.Int;
            outPutParameter.Direction = System.Data.ParameterDirection.Output;
            cmd.Parameters.Add(outPutParameter);
            //cmd.Parameters.Add("@tt", SqlDbType.Int).Direction = ParameterDirection.Output;
            cn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            try
            {
                rd.Read();
                kq = Convert.ToInt32(outPutParameter.Value.ToString());
            }
            catch { }
            
            cn.Close();
            return kq;
        }
        public DataSet t_Books_Lst(string LevelCode, string Name,string BookCode , double Price, int Total)
        {
            SqlConnection cn = Ketnoi();
            SqlDataAdapter da = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand("t_Books_Lst", cn);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@LevelCode", LevelCode));
            cmd.Parameters.Add(new SqlParameter("@Name", Name));
            cmd.Parameters.Add(new SqlParameter("@BookCode", BookCode));
            cmd.Parameters.Add(new SqlParameter("@Price", Price));
            cmd.Parameters.Add(new SqlParameter("@Total", Total));
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
        public int t_Books_Del(string BookCode)
        {
            int kq = 0;
            SqlConnection cn = Ketnoi();
            SqlCommand cmd = new SqlCommand("t_Books_Del", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@BookCode", BookCode));

            SqlParameter outPutParameter = new SqlParameter();
            outPutParameter.ParameterName = "@tt";
            outPutParameter.SqlDbType = System.Data.SqlDbType.Int;
            outPutParameter.Direction = System.Data.ParameterDirection.Output;
            cmd.Parameters.Add(outPutParameter);
            cn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            try
            {
                rd.Read();
                kq = Convert.ToInt32(outPutParameter.Value.ToString());
            }
            catch { }
            cn.Close();
            return kq;
        }

    }
}