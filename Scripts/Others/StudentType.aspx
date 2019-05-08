<%@ Page Title="" Language="C#" MasterPageFile="~/Scripts/Masters/MasterPage.master" AutoEventWireup="true" CodeFile="StudentType.aspx.cs" Inherits="Scripts_Others_StudentType" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server">
        <div class=" form-grids row form-grids-right">
            <div class="widget-shadow " data-example-id="basic-forms">
                <div class="form-title">
                    <h4>Quản Lý Loại Học Viên :</h4>
                </div>
                <div class="form-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">Loại học viên</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="inputEmail3">
                            </div>
                        </div>
                        <div class="col-sm-offset-2">
                            <button type="submit" class="btn btn-success">Thêm</button>
                            <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Thêm" CssClass="orther-button" Theme="Aqua"></dx:ASPxButton>
                        </div>

                    </div>
                    <div class="orther-danhsach">
                        <h4>Danh sách loại học viên:</h4>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Loại Học Viên</th>                                    
                                    <th>Thao Tác</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>Mark</td>
                                    <td>Otto</td>                                    
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>Jacob</td>
                                    <td>Thornton</td>                                    
                                </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td>Larry</td>
                                    <td>the Bird</td>                                    
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="orther-danhsach">
                        <h4>Danh sách loại học viên:</h4>
                        <dx:ASPxGridView ID="gv_ctv" ClientInstanceName="gv_ctv" runat="server" AutoGenerateColumns="false" UseSubmitBehavior="false"
                            Theme="Aqua" KeyFieldName="FieldWorker_ID" Width="100%">
                            <%--<TotalSummary>
                            <dx:ASPxSummaryItem FieldName="FieldWorker_ID" SummaryType="count" DisplayFormat="Tổng CTV: {0:0,0}" />
                        </TotalSummary>--%>
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="STT" VisibleIndex="1" FieldName="FieldWorker_ID">
                                    <HeaderStyle Font-Size="Small" HorizontalAlign="Center" />
                                    <CellStyle Font-Size="Small" HorizontalAlign="Left">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Loại Học Viên" VisibleIndex="2" FieldName="FieldWorker_Name">
                                    <HeaderStyle Font-Size="Small" HorizontalAlign="Center" />
                                    <CellStyle Font-Size="Small" HorizontalAlign="Left">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Thao Tác" VisibleIndex="3" FieldName="NgayThamGia">
                                    <HeaderStyle Font-Size="Small" HorizontalAlign="Center" />
                                    <CellStyle Font-Size="Small" HorizontalAlign="Left">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Hire_Date" Visible="false">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <Settings ShowFooter="True" ShowFilterRow="false" ShowFilterBar="Hidden" />
                            <SettingsText EmptyDataRow="Không có loại"></SettingsText>
                            <SettingsPager Mode="ShowAllRecords" ShowNumericButtons="false" ShowDisabledButtons="false" ShowSeparators="true" Summary-Visible="true"></SettingsPager>
                            <SettingsBehavior AllowSelectByRowClick="true" AllowFocusedRow="true" />
                            <%--<ClientSideEvents RowClick="gv_ctv_rowclick" EndCallback="gv_ctv_endcallback" />--%>
                        </dx:ASPxGridView>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

