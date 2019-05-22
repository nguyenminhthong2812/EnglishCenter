using qltt.Data;
using qltt.Entities;
using System;
using System.Collections.Generic;
using System.Data;
//using System.Linq;
using System.Web;

/// <summary>
/// Summary description for bus_Book
/// </summary>
/// 
namespace qltt.Business
{
    public class bus_Book
    {
        public bus_Book()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public static void Themsach(Book sach)
        {
            dao_Book xuly = new dao_Book();
            xuly.Themmoi(sach);
        }
        public static void Capnhatsach(Book sach)
        {
            dao_Book xuly = new dao_Book();
            xuly.Capnhatsach(sach);
        }
        public static void Xoasach(Book sach)
        {
            dao_Book xuly = new dao_Book();
            xuly.Xoasach(sach);
        }
        public  string thongbao()
        {
            dao_Book xuly = new dao_Book();
            return xuly.thongbao();
        }
        public int t_Books_Ins(int Loai, string BookCode, string Name, string LevelCode, double Price, int Total)
        {
            dao_Book xuly = new dao_Book();
            return xuly.t_Books_Ins(Loai,BookCode,Name,LevelCode,Price,Total);
        }
        public DataSet t_Books_Lst(string LevelCode, string Name, string BookCode, double Price, int Total)
        {
            dao_Book xuly = new dao_Book();
            return xuly.t_Books_Lst(LevelCode,Name,BookCode,Price,Total);
        }
        public int t_Books_Del(string BookCode)
        {
            dao_Book xuly = new dao_Book();
            return xuly.t_Books_Del(BookCode);
        }
    }
}