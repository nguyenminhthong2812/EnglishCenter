<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="thongke.aspx.cs" Inherits="thongke" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <br /><br /><br />
        <%-- DXCOMMENT: Configure ASPxGridView control --%>
<dx:ASPxGridView ID="ASPxGridView_thongke" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource_thongke" ClientInstanceName="ASPxGridView_khoahoc" Width="100%">
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
        <dx:GridViewDataTextColumn VisibleIndex="0" FieldName="_makh" Caption="Mã số">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn VisibleIndex="1" FieldName="_tenkhoahoc" Caption="Tên khóa">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn VisibleIndex="2" FieldName="slhv" ReadOnly="True" Caption="Số HV">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn VisibleIndex="3" FieldName="hocphi" ReadOnly="True" Caption="Học phí" UnboundType="Decimal">
            <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="{0:#,###}">
            </PropertiesTextEdit>
            <CellStyle Font-Bold="True" ForeColor="Red">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn VisibleIndex="4" FieldName="phuthu" ReadOnly="True" Caption="Phụ thu" UnboundType="Decimal">
            <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="{0:#,###}">
            </PropertiesTextEdit>
            <CellStyle Font-Bold="True" ForeColor="Green">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn VisibleIndex="5" FieldName="thanhtien" Caption="Tổng" ReadOnly="True" UnboundType="Decimal">
            <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="{0:#,###}">
            </PropertiesTextEdit>
            <CellStyle Font-Bold="True" ForeColor="Blue">
            </CellStyle>
        </dx:GridViewDataTextColumn>
    </Columns>
</dx:ASPxGridView>


<%-- DXCOMMENT: Configure your datasource for ASPxGridView --%>
<asp:SqlDataSource ID="SqlDataSource_thongke" runat="server"
        ConnectionString="<%$ ConnectionStrings:trungtamngoainguConnectionString %>" 
        SelectCommand="dothongkekhoahoc" SelectCommandType="StoredProcedure">
</asp:SqlDataSource>

</asp:Content>

