using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dangky : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ASPxGridView_khoahoc_SelectionChanged(object sender, EventArgs e)
    {
       //ASPxTextBox_hocphi.Text = ASPxGridView_khoahoc.GetSelectedFieldValues("_hocphi")[0].ToString(); 
    }
    protected void ASPxGridView_khoahoc_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
    {

    }
}