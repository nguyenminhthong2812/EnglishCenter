using qltt.Business;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Scripts_Book_Books : System.Web.UI.Page
{
    private bus_Programs bus_p = new bus_Programs();
    private bus_Levels bus_l = new bus_Levels();
    private bus_Book bus_b = new bus_Book();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //LoadBangLoai();
            LoadChuongtrinh();
        }
    }
    private void LoadChuongtrinh()
    {
        
        DataTable dt = new DataTable();
        dt = bus_p.t_Programs_Lst("H001").Tables[0];
        cboChuongtrinh.DataSource = dt;
        cboChuongtrinh.TextField = "Name";
        cboChuongtrinh.ValueField = "ProgramCode";
        cboChuongtrinh.DataBind();
    }
    private void LoadCapdo()
    {
        DataTable dt = new DataTable();
        dt = bus_l.t_Levels_Lst(cboChuongtrinh.Value.ToString()).Tables[0];
        cboCapdo.DataSource = dt;
        cboCapdo.TextField = "Name";
        cboCapdo.ValueField = "LevelCode";
        cboCapdo.DataBind();
    }
    protected void LoadBangLoai()
    {
        DataTable dt = new DataTable();
        dt.Columns.AddRange(new DataColumn[4] { new DataColumn("stt"), new DataColumn("tenloai"), new DataColumn("ghichu"),new DataColumn("id") });

        // thêm dữ liệu demo
        dt.Rows.Add("1", "Bình thường", "", "1");
        dt.Rows.Add("2", "Học viên cũ", "", "2");
        dt.Rows.Add("3", "Học sinh giỏi", "", "3");

        gvDS_sach.DataSource = dt;
        gvDS_sach.DataBind();
    }
    protected void gvDS_sach_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
    {
        string thaoTac = e.Parameters.ToString();
        string BookCode, Name, LevelCode;
        double Price;
        int Total;
        if (thaoTac == "THEMMOI")
        {
            
            int Loai = 1;
            BookCode = "0";
            Name = txtTenSach.Text;
            LevelCode = cboCapdo.Value.ToString();
            Price = Convert.ToDouble(txtGia.Text.ToString());
            Total = Convert.ToInt32(txtSoluong.Text.ToString());

            int kq = bus_b.t_Books_Ins(Loai, BookCode, Name, LevelCode, Price, Total);
            if (kq == 1)
            {
                gvDS_sach.JSProperties.Add("cpTexts", "THEMTHANHCONG");
                //timkiem();
            }
        }
        else if (thaoTac == "CAPNHAT")
        {
            int Loai = 2;
            BookCode = txtMaSach.Text;
            Name = txtTenSach.Text;
            LevelCode = cboCapdo.Value.ToString();
            Price = Convert.ToDouble(txtGia.Text.ToString());
            Total = Convert.ToInt32(txtSoluong.Text.ToString());

            int kq = bus_b.t_Books_Ins(Loai, BookCode, Name, LevelCode, Price, Total);
            if (kq == 1)
            {
                gvDS_sach.JSProperties.Add("cpTexts", "SUATHANHCONG");
                //timkiem();
            }
        }
        else if (thaoTac == "XOA")
        {
            BookCode = txtMaSach.Text;
            int kq = bus_b.t_Books_Del(BookCode);
            if (kq == 1)
            {
                gvDS_sach.JSProperties.Add("cpTexts", "XOATHANHCONG");
            }
        }
        else if (thaoTac == "TIMKIEM")
        {
            timkiem();
        }
    }
    private void timkiem()
    {
        string LevelCode = cboCapdo.Text == "" ? "" : cboCapdo.Value.ToString();
        string Name = txtTenSach.Text;
        string BookCode = txtMaSach.Text;
        double Price = Convert.ToDouble(txtGia.Text == "" ? "-1" : txtGia.Text.ToString());
        int Total = Convert.ToInt32(txtSoluong.Text == "" ? "-1" : txtSoluong.Text.ToString());
        DataTable dt = new DataTable();
        dt = bus_b.t_Books_Lst(LevelCode, Name, BookCode, Price, Total).Tables[0];
        if (dt.Rows.Count > 0)
        {
            gvDS_sach.DataSource = dt;
            gvDS_sach.DataBind();
        }
    }
    protected void cboCapdo_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
    {
        LoadCapdo();
    }
}