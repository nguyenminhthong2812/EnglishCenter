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
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadBangLoai();
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

        gvDanhSachLoaiHV.DataSource = dt;
        gvDanhSachLoaiHV.DataBind();
    }
    protected void gvDanhSachLoaiHV_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
    {
        string thaoTac = e.Parameters.ToString();
        if (thaoTac == "LUU")
        {
            gvDanhSachLoaiHV.JSProperties.Add("cpTexts", "THANHCONG");
            string ma = maLoai.Text;
            string ten = tenLoai.Text;
        }
    }
    protected void cboCapdo_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
    {
        LoadCapdo();
    }
}