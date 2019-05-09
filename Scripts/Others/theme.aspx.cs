using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Scripts_Others_StudentType : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadBangLoai();
        }
    }

    protected void LoadBangLoai()
    {
        DataTable dt = new DataTable();
        dt.Columns.AddRange(new DataColumn[4] { new DataColumn("stt"), new DataColumn("tenloai"), new DataColumn("ghichu"),new DataColumn("id") });

        // thêm dữ liệu demo
        dt.Rows.Add("1", "Bình thường", "", "1");
        dt.Rows.Add("2", "Học viên cũ", "", "1");
        dt.Rows.Add("3", "Học sinh giỏi", "", "1");

        gvDanhSachLoaiHV.DataSource = dt;
        gvDanhSachLoaiHV.DataBind();
    }
}