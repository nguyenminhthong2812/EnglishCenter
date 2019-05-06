using qltt.Data;
using qltt.Entities;
using System;
using System.Collections.Generic;
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
    }
}