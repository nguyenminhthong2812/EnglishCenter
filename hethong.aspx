<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="hethong.aspx.cs" Inherits="hethong" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

        <%-- DXCOMMENT: Configure ASPxGridView control --%>
<dx:ASPxGridView ID="ASPxGridView_khoahoc" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource_khoahoc" ClientInstanceName="ASPxGridView_khoahoc" Width="100%" KeyFieldName="_id">
    <SettingsPager PageSize="32" />
    <SettingsEditing Mode="Inline">
    </SettingsEditing>
    <Settings VerticalScrollBarMode="Visible" VerticalScrollableHeight="350" AutoFilterCondition="Contains" ShowFilterRow="True" ShowFooter="True" />
    <GroupSummary>
        <dx:ASPxSummaryItem FieldName="_id" SummaryType="Count" />
    </GroupSummary>
    <Paddings Padding="0px" />
    <Border BorderWidth="0px" />
    <BorderBottom BorderWidth="1px" />
    <%-- DXCOMMENT: Configure ASPxGridView's columns in accordance with datasource fields --%>
    <SettingsBehavior AllowSelectByRowClick="True" ConfirmDelete="True" />
    <SettingsSearchPanel Visible="True" />
    <EditFormLayoutProperties ColCount="5">
    </EditFormLayoutProperties>
    <Columns>
        <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0" SelectAllCheckboxMode="Page" ShowEditButton="True"
             ShowNewButtonInHeader="True" ShowDeleteButton="True" Width="100px">
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


<%-- DXCOMMENT: Configure your datasource for ASPxGridView --%>
<asp:SqlDataSource ID="SqlDataSource_khoahoc" runat="server"
        ConnectionString="<%$ ConnectionStrings:trungtamngoainguConnectionString %>" 
        SelectCommand="SELECT _id ,_makh,_tenkhoahoc,_ngaybatdau, _ngayketthuc,_hocphi,_lichhoc,_diadiem FROM tblDMKHOAHOC WHERE (_trangthai = 1) ORDER BY _ngaytao DESC" 
    DeleteCommand="UPDATE tblDMKHOAHOC set _trangthai=-1 WHERE _id = @_id" 
    InsertCommand="INSERT INTO tblDMKHOAHOC(_makh,_tenkhoahoc, _ngaybatdau, _ngayketthuc, _hocphi, _diadiem, _lichhoc, _trangthai, _ngaytao) 
    VALUES (@_makh, @_tenkhoahoc, @_ngaybatdau, @_ngayketthuc, @_hocphi, @_diadiem, @_lichhoc, 1, GETDATE())" 
    UpdateCommand="UPDATE tblDMKHOAHOC SET _makh=@_makh, _tenkhoahoc = @_tenkhoahoc, _ngaybatdau = @_ngaybatdau, _ngayketthuc = @_ngayketthuc, _hocphi = @_hocphi, _diadiem = @_diadiem, _lichhoc = @_lichhoc WHERE _id=@_id">
    <DeleteParameters>
        <asp:Parameter Name="_id" /> 
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="_makh" />
        <asp:Parameter Name="_tenkhoahoc" />
        <asp:Parameter Name="_ngaybatdau" />
        <asp:Parameter Name="_ngayketthuc" />
        <asp:Parameter Name="_hocphi" />  
        <asp:Parameter Name="_diadiem" />
        <asp:Parameter Name="_lichhoc" />
    </InsertParameters>
    <UpdateParameters>

        <asp:Parameter Name="_makh" />
        <asp:Parameter Name="_tenkhoahoc" />
        <asp:Parameter Name="_ngaybatdau" />
        <asp:Parameter Name="_ngayketthuc" />
        <asp:Parameter Name="_hocphi" />
        <asp:Parameter Name="_diadiem" />
        <asp:Parameter Name="_lichhoc" />
        <asp:Parameter Name="_id" />
    </UpdateParameters>
</asp:SqlDataSource>

</asp:Content>

