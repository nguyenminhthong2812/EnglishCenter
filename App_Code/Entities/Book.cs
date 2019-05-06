using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Book
/// </summary>
/// 
namespace qltt.Entities
{
    public class Book
    {
        public Book()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        private int _SachID;
        private string _LinhvucID;
        private string _Tensach;
        private int _MaCTLinhVuc;
        private string _Tomtac;
        private string _Noidung;
        private string _NXB;
        private string _NamXB;
        private string _Tacgia;
        private string _Dichgia;
        private long _Sotrang;
        private string _Kichthuoc;
        private long _Trongluong;
        private string _Hinhanh;
        private long _Giabia;
        private long _Soluotxem = 0;
        private DateTime _Ngaycapnhat = DateTime.Now;
        private long _Socomment = 0;
        public int SachID
        {
            set
            {
                _SachID = value;
            }
            get
            {
                return _SachID;
            }
        }
        public string LinhvucID
        {
            set
            {
                _LinhvucID = value;
            }
            get
            {
                return _LinhvucID;
            }
        }
        public string Tensach
        {
            set
            {
                _Tensach = value;
            }
            get
            {
                return _Tensach;
            }
        }
        public int MaCTLinhVuc
        {
            set
            {
                _MaCTLinhVuc = value;
            }
            get
            {
                return _MaCTLinhVuc;
            }
        }
        public string Tomtac
        {
            set
            {
                _Tomtac = value;
                if (_Tomtac.Length > 500)
                {
                    _Tomtac = _Tomtac.Substring(0, 500) + ".......";
                }
            }
            get
            {
                return _Tomtac;
            }
        }
        public string Noidung
        {
            set
            {
                _Noidung = value;
            }
            get
            {
                return _Noidung;
            }
        }
        public string NXB
        {
            set
            {
                _NXB = value;
            }
            get
            {
                return _NXB;
            }
        }
        public string NamXB
        {
            set
            {
                _NamXB = value;
            }
            get
            {
                return _NamXB;
            }
        }
        public string Tacgia
        {
            set
            {
                _Tacgia = value;
            }
            get
            {
                return _Tacgia;
            }
        }
        public string Dichgia
        {
            set
            {
                _Dichgia = value;
            }
            get
            {
                return _Dichgia;
            }
        }
        public long Sotrang
        {
            set
            {
                _Sotrang = value;
            }
            get
            {
                return _Sotrang;
            }
        }
        public string Kichthuoc
        {
            set
            {
                _Kichthuoc = value;
            }
            get
            {
                return _Kichthuoc;
            }
        }
        public long Trongluong
        {
            set
            {
                _Trongluong = value;
            }
            get
            {
                return _Trongluong;
            }
        }
        public string Hinhanh
        {
            set
            {
                _Hinhanh = value;
            }
            get
            {
                return _Hinhanh;
            }
        }
        public long Giabia
        {
            set
            {
                _Giabia = value;
            }
            get
            {
                return _Giabia;
            }
        }
        public long Soluotxem
        {
            set
            {
                _Soluotxem = value;
            }
            get
            {
                return _Soluotxem;
            }
        }
        public DateTime Ngaycapnhat
        {
            set
            {
                _Ngaycapnhat = value;
            }
            get
            {
                return _Ngaycapnhat;
            }
        }
        public long Socomment
        {
            set
            {
                _Socomment = value;
            }
            get
            {
                return _Socomment;
            }
        }
    }
}