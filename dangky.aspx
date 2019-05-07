<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="dangky.aspx.cs" Inherits="dangky" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <table style="width:100%;">
        <tr>
            <td style="width: 2px">&nbsp;</td>
            <td>Học phí<dx:ASPxTextBox ID="ASPxTextBox_hocphi" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
            <td style="width: 2px">&nbsp;</td>
            <td>
                <asp:Button ID="Button_luulai" runat="server" Text="Lưu lại" />
            </td>
        </tr>
        <tr>
            <td style="width: 2px">&nbsp;</td>
            <td>Phụ thu<dx:ASPxTextBox ID="ASPxTextBox_phuthu" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
            <td style="width: 2px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 2px">&nbsp;</td>
            <td>Thành tiền<dx:ASPxTextBox ID="ASPxTextBox_thanhtien" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
            <td style="width: 2px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 2px">&nbsp;</td>
            <td>&nbsp;Khóa học</td>
            <td style="width: 2px">&nbsp;</td>
            <td>Học viên</td>
        </tr>
        <tr>
            <td style="width: 2px">&nbsp;</td>
            
            <td style="vertical-align:text-top;vertical-align:top"> 
<dx:ASPxGridView ID="ASPxGridView_khoahoc" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource_khoahoc" ClientInstanceName="ASPxGridView_khoahoc" Width="100%" KeyFieldName="_id" EnableCallBacks="False"  OnSelectionChanged="ASPxGridView_khoahoc_SelectionChanged">
 
    <SettingsPager PageSize="32" />
    <SettingsEditing Mode="Inline">
    </SettingsEditing>
    <Settings VerticalScrollBarMode="Visible" VerticalScrollableHeight="350"  ShowFilterRow="True" ShowFooter="True" />
    
    <Paddings Padding="0px" />
    <Border BorderWidth="0px" />
    <BorderBottom BorderWidth="1px" />
    <%-- DXCOMMENT: Configure ASPxGridView's columns in accordance with datasource fields --%>
    <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True"   />
    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
    <%--<SettingsSearchPanel Visible="True" />
    <EditFormLayoutProperties ColCount="5">
    </EditFormLayoutProperties>--%>
    <Columns>
        <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0" SelectAllCheckboxMode="Page"   Width="30px" ShowSelectCheckbox="True">
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn Caption="_id" VisibleIndex="1" FieldName="_id" ReadOnly="true"  Width="50px">
            <EditFormSettings Visible="False" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Mã số" VisibleIndex="2" FieldName="_makh" Width="100px">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Tên Khóa học" VisibleIndex="3" FieldName="_tenkhoahoc" Width="250px">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn Caption="Bắt đầu" VisibleIndex="4"  FieldName="_ngaybatdau"  Width="80px">
            <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy">
            </PropertiesDateEdit>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataDateColumn Caption="Kết thúc" VisibleIndex="5" FieldName="_ngayketthuc" Width="80px">
            <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy">
            </PropertiesDateEdit>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn Caption="Học phí" VisibleIndex="6" FieldName="_hocphi" Width="70px" UnboundType="Decimal">
            <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="{0:#,###}">
            </PropertiesTextEdit>
            <CellStyle Font-Bold="True" ForeColor="Red">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Lịch học" VisibleIndex="7" FieldName="_lichhoc"  Width="70px">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Địa điểm" VisibleIndex="8" FieldName="_diadiem">
        </dx:GridViewDataTextColumn>
    </Columns>
</dx:ASPxGridView>
            </td>
            <td style="width: 2px"></td>
            <td  style="vertical-align:text-top;vertical-align:top"> 
<dx:ASPxGridView ID="ASPxGridView_hocvien" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource_hocvien" ClientInstanceName="ASPxGridView_hocvien" Width="100%" KeyFieldName="_id">
    <SettingsPager PageSize="32" />
    <SettingsEditing Mode="Inline">
    </SettingsEditing>
    <Settings VerticalScrollBarMode="Visible" VerticalScrollableHeight="250"  ShowFilterRow="True" />
    
    <Paddings Padding="0px" />
    <Border BorderWidth="0px" />
    <BorderBottom BorderWidth="1px" />
    <%-- DXCOMMENT: Configure ASPxGridView's columns in accordance with datasource fields --%>
    <SettingsBehavior ConfirmDelete="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
    <%--<SettingsSearchPanel Visible="True" />
    <EditFormLayoutProperties ColCount="5">
    </EditFormLayoutProperties>--%>
    <Columns>
        <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0" SelectAllCheckboxMode="Page"   Width="30px" ShowSelectCheckbox="True"> 
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn VisibleIndex="0" FieldName="_id" ReadOnly="True"  Width="40px"  >
            <EditFormSettings Visible="False" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn VisibleIndex="1" FieldName="_mahv" Caption="Mã số" Width="80px">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn VisibleIndex="2" FieldName="_hoten" Caption="Họ tên" Width="200px">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn VisibleIndex="4" FieldName="_ngaysinh" Caption="Ngày sinh" Width="80px">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn VisibleIndex="5" FieldName="_diachi" Caption="Địa chỉ" Width="250px">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn VisibleIndex="6" FieldName="_dienthoai" Caption="Điện thoại" Width="90px">
        </dx:GridViewDataTextColumn> 
    </Columns>
</dx:ASPxGridView>
            </td>
        </tr>
        <tr>
            <td style="width: 2px">&nbsp;</td>
            <td>
            </td>
            <td style="width: 2px">&nbsp;</td>
            <td>
            </td>
        </tr>
        <tr>
            <td style="width: 2px">&nbsp;</td>
            <td>&nbsp;</td>
            <td style="width: 2px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 2px">&nbsp;</td>
            <td>&nbsp;</td>
            <td style="width: 2px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <br /> 
<dx:ASPxGridView ID="ASPxGridView_dangky" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource_dangky" ClientInstanceName="ASPxGridView_dangky" Width="100%" KeyFieldName="_id">
     <SettingsPager PageSize="32" />
    <SettingsEditing Mode="Inline">
    </SettingsEditing>
    <Settings VerticalScrollBarMode="Visible" VerticalScrollableHeight="350"  ShowFilterRow="True" />
     
    <Paddings Padding="0px" />
    <Border BorderWidth="0px" />
    <BorderBottom BorderWidth="1px" /> 
    <SettingsBehavior ConfirmDelete="True" />
    <%--<SettingsSearchPanel Visible="True" />
    <EditFormLayoutProperties ColCount="5">
    </EditFormLayoutProperties>--%>
    <Columns>
        <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0" SelectAllCheckboxMode="Page"
             ShowEditButton="True" ShowNewButtonInHeader="True" ShowDeleteButton="True" Width="100px"> 
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn VisibleIndex="0" FieldName="_id" ReadOnly="True"  >
            <EditFormSettings Visible="False" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn VisibleIndex="1" FieldName="_mahv">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn VisibleIndex="2" FieldName="_makh">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn VisibleIndex="3"  FieldName="_ngaytao">
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn VisibleIndex="4" FieldName="_hocphi">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn VisibleIndex="5" FieldName="_phuthu">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn VisibleIndex="6" FieldName="_miengiam">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="_thucthu" VisibleIndex="7">
        </dx:GridViewDataTextColumn> 
    </Columns>
</dx:ASPxGridView>
     
<asp:SqlDataSource ID="SqlDataSource_dangky" runat="server"
        ConnectionString="<%$ ConnectionStrings:trungtamngoainguConnectionString %>" 
        SelectCommand="SELECT _id, _mahv, _makh, _hocphi, _phuthu, _miengiam, _thucthu, _ngaytao FROM tblDANGKY" 
    DeleteCommand="DELETE tblDANGKY  WHERE _id = @_id" 
    InsertCommand="INSERT INTO tblDANGKY(_mahv, _makh, _hocphi, _phuthu, _miengiam, _thucthu, _ngaytao) VALUES (@_mahv, @_makh, @_hocphi, @_phuthu, @_miengiam, @_thucthu, GETDATE() )" 
    UpdateCommand="UPDATE tblDANGKY SET _mahv = @_mahv, _makh = @_makh,  _hocphi = @_hocphi, _phuthu = @_phuthu, _miengiam = @_miengiam, _thucthu = @_thucthu WHERE (_id = @_id)">
    <DeleteParameters>
        <asp:Parameter Name="_id" /> 
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="_mahv" />
        <asp:Parameter Name="_makh" />
        <asp:Parameter Name="_hocphi" />
        <asp:Parameter Name="_phuthu" />
        <asp:Parameter Name="_miengiam" />
        <asp:Parameter Name="_thucthu" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="_mahv" />
        <asp:Parameter Name="_makh" />
        <asp:Parameter Name="_hocphi" />
        <asp:Parameter Name="_phuthu" />
        <asp:Parameter Name="_miengiam" />
        <asp:Parameter Name="_thucthu" />
        <asp:Parameter Name="_id" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource_hocvien" runat="server"
        ConnectionString="<%$ ConnectionStrings:trungtamngoainguConnectionString %>" 
        SelectCommand="SELECT _id, _mahv, _hoten, _ngaysinh, _diachi, _dienthoai  FROM tblHOCVIEN 
WHERE _trangthai=1 ORDER BY _ngaytao DESC" >
      
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource_khoahoc" runat="server"
        ConnectionString="<%$ ConnectionStrings:trungtamngoainguConnectionString %>" 
        SelectCommand="SELECT _id ,_makh,_tenkhoahoc,_ngaybatdau, _ngayketthuc,_hocphi,_lichhoc,_diadiem FROM tblDMKHOAHOC WHERE (_trangthai = 1) ORDER BY _ngaytao DESC" >
    
</asp:SqlDataSource>


</asp:Content>

