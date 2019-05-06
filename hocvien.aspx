<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="hocvien.aspx.cs" Inherits="hocvien" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

        <%-- DXCOMMENT: Configure ASPxGridView control --%>
<dx:ASPxGridView ID="ASPxGridView_hocvien" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource_hocvien" ClientInstanceName="ASPxGridView_hocvien" Width="100%" KeyFieldName="_id">
    <SettingsPager PageSize="32" />
    <SettingsEditing Mode="Inline">
    </SettingsEditing>
    <Settings VerticalScrollBarMode="Visible" VerticalScrollableHeight="350" AutoFilterCondition="Contains" ShowFilterRow="True" />
    
    <Paddings Padding="0px" />
    <Border BorderWidth="0px" />
    <BorderBottom BorderWidth="1px" />
    <%-- DXCOMMENT: Configure ASPxGridView's columns in accordance with datasource fields --%>
    <SettingsBehavior ConfirmDelete="True" />
    <SettingsSearchPanel Visible="True" />
    <EditFormLayoutProperties ColCount="5">
    </EditFormLayoutProperties>
    <Columns>
        <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0" SelectAllCheckboxMode="Page"
             ShowEditButton="True" ShowNewButtonInHeader="True" ShowDeleteButton="True" Width="100px"> 
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
        <dx:GridViewDataTextColumn FieldName="_email" VisibleIndex="7" Caption="Email" Width="100px">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="_capdo" VisibleIndex="8" Caption="Cấp độ" Width="50px">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn VisibleIndex="9"  FieldName="_ngaytao" Caption="Ngày tạo" Width="80px">
        </dx:GridViewDataDateColumn>
    </Columns>
</dx:ASPxGridView>


<%-- DXCOMMENT: Configure your datasource for ASPxGridView --%>
<asp:SqlDataSource ID="SqlDataSource_hocvien" runat="server"
        ConnectionString="<%$ ConnectionStrings:trungtamngoainguConnectionString %>" 
        SelectCommand="SELECT _id, _mahv, _hoten, _ngaysinh, _diachi, _dienthoai, _email, _capdo, _ngaytao FROM tblHOCVIEN 
WHERE _trangthai=1 ORDER BY _ngaytao DESC" 
    DeleteCommand="UPDATE tblHOCVIEN set _trangthai=-1 WHERE _id = @_id" 
    InsertCommand="INSERT INTO tblHOCVIEN(_mahv, _hoten, _ngaysinh, _diachi, _dienthoai, _email, _capdo, _trangthai, _ngaytao) VALUES (@_mahv, @_hoten, @_ngaysinh, @_diachi, @_dienthoai, @_email, @_capdo, 1, GETDATE())" 
    UpdateCommand="UPDATE tblHOCVIEN SET _mahv = @_mahv, _hoten = @_hoten, _ngaysinh = @_ngaysinh, _diachi = @_diachi, _dienthoai = @_dienthoai, _email = @_email, _capdo = @_capdo where _id=@_id">
    <DeleteParameters>
        <asp:Parameter Name="_id" /> 
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="_mahv" />
        <asp:Parameter Name="_hoten" />
        <asp:Parameter Name="_ngaysinh" />
        <asp:Parameter Name="_diachi" />
        <asp:Parameter Name="_dienthoai" />
        <asp:Parameter Name="_email" />
        <asp:Parameter Name="_capdo" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="_mahv" />
        <asp:Parameter Name="_hoten" />
        <asp:Parameter Name="_ngaysinh" />
        <asp:Parameter Name="_diachi" />
        <asp:Parameter Name="_dienthoai" />
        <asp:Parameter Name="_email" />
        <asp:Parameter Name="_capdo" />
        <asp:Parameter Name="_id" />
    </UpdateParameters>
</asp:SqlDataSource>

</asp:Content>

