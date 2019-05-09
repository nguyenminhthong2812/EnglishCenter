<%@ Page Title="" Language="C#" MasterPageFile="~/Scripts/Masters/MasterPage.master" AutoEventWireup="true" CodeFile="StudentType.aspx.cs" Inherits="Scripts_Others_StudentType" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server">
        <div class=" form-grids row form-grids-right">
            <div class="widget-shadow " data-example-id="basic-forms">
                <div class="form-title">
                    <h4 class="orther-title1">Quản Lý Loại Học Viên :</h4>
                </div>
                <div class="form-body row">                    
                    <div class="form-horizontal col-md-6">
                        <h4 class="orther-title2">Thông tin loại học viên:</h4>
                        <div class="form-group">
                            <span class="col-sm-2 control-label">Tên loại:</span>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="tenLoai">
                            </div>
                        </div>
                        <div class="form-group">
                            <span class="col-sm-2 control-label">Ghi chú:</span>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="ghiChu">
                            </div>
                        </div>
                        <div class="col-sm-offset-2">
                            <button class="btn btn-success">Thêm</button>  
                            <button class="btn btn-success">Sửa</button>   
                            <button class="btn btn-danger">Xóa</button> 
                            <button class="btn btn-warning">Hủy</button>                          
                        </div>

                    </div>
                    <div class="col-md-6">
                        <div>
                            <h4 class="orther-title2">Danh sách loại học viên:</h4>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Loại Học Viên</th>
                                        <th>Ghi Chú</th>
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
                        <div>
                            <h4 class="orther-title2">Danh sách loại học viên:</h4>
                            <dx:ASPxGridView ID="gvDanhSachLoaiHV" ClientInstanceName="gvDanhSachLoaiHV" runat="server" AutoGenerateColumns="false" UseSubmitBehavior="false"
                                Theme="DevEx" KeyFieldName="id" Width="100%">                                
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="STT" VisibleIndex="1" FieldName="stt">
                                        <HeaderStyle Font-Size="Medium" HorizontalAlign="Center" />
                                        <CellStyle Font-Size="14px" HorizontalAlign="Left">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Loại Học Viên" VisibleIndex="2" FieldName="tenloai">
                                        <HeaderStyle Font-Size="Medium" HorizontalAlign="Center" />
                                        <CellStyle Font-Size="Medium" HorizontalAlign="Left">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Ghi Chú" VisibleIndex="3" FieldName="ghichu">
                                        <HeaderStyle Font-Size="Medium" HorizontalAlign="Center" />
                                        <CellStyle Font-Size="Small" HorizontalAlign="Left">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="id" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <Settings ShowFooter="True" ShowFilterRow="false" ShowFilterBar="Hidden" />
                                <SettingsText EmptyDataRow="Không có loại học viên"></SettingsText>
                                <SettingsPager Mode="ShowAllRecords" ShowNumericButtons="false" ShowDisabledButtons="false" ShowSeparators="true" Summary-Visible="true"></SettingsPager>
                                <SettingsBehavior AllowSelectByRowClick="true" AllowFocusedRow="true" />
                                <ClientSideEvents RowClick="gvDanhSachLoaiHVRowClick(s,e)" />
                            </dx:ASPxGridView>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </form>
</asp:Content>

