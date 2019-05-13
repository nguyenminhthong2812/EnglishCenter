<%@ Page Title="" Language="C#" MasterPageFile="~/Scripts/Masters/MasterPage.master" AutoEventWireup="true" CodeFile="StudentType.aspx.cs" Inherits="Scripts_Others_StudentType" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <script type="text/javascript">
        // Xứ lý các nút

        function ThemLoai() {
            if ($('#tenLoai').val() == '')
                ThongBao('Vui lòng nhập tên loại học viên', $('#tbChuY'));
            else
                gvDanhSachLoaiHV.PerformCallback('LUU');
        }

        function Xoa() {
            Confirm('Go to Google', 'Are you sure you want to visit Google', 'Yes', 'No'); /*change*/
        }

        function Huy() {
            $('#btnThem').removeClass('hide');
            $('#btnSua').addClass('hide');
            $('#btnXoa').addClass('hide');
            $('#btnHuy').addClass('hide');

            $('.txt-studentType').val('');
        }
        // hàm click vào dòng trên danh sách
        function gvDanhSachLoaiHVRowClick(s, e) {
            $('#btnThem').addClass('hide');
            $('#btnSua').removeClass('hide');
            $('#btnXoa').removeClass('hide');
            $('#btnHuy').removeClass('hide');
            s.GetRowValues(e.visibleIndex, "id;tenloai;ghichu", GetValue);
        }

        function GetValue(values) {            
            $('#maLoai').val(values[0]);
            $('#tenLoai').val(values[1]);
            $('#ghiChu').val(values[2]);
        }
        
        function gvDanhSachLoaiHVEndCallBack(s, e) {
            if (s.cpTexts == 'THANHCONG') {                
                ThongBao('Đã thêm loại học viên thành công.', $('#tbThanhCong'));
                delete s.cpTexts;
            }
        }

        function ThongBao(mess,id) {            
            id.text(mess);            
            id.fadeIn(1000).removeClass('hide');
            id.fadeOut(2500);
        }


        
        
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">    
    <div>
        <div class=" form-grids row form-grids-right">
            <div class="widget-shadow " data-example-id="basic-forms">
                <div class="form-title">
                    <h4 class="orther-title1">Quản Lý Loại Học Viên :</h4>
                </div>
                <div class="form-body row" >                    
                    <div class="form-horizontal col-md-6" data-toggle="validator">
                        <h4 class="orther-title2">Thông tin loại học viên:</h4>
                        <div class="form-group hide">
                            <span class="col-sm-2 control-label">Mã loại:</span>
                            <div class="col-sm-9">
                                <input type="text" class="form-control txt-studentType" id="maLoai">
                            </div>
                        </div>
                        <div class="form-group">
                            <span class="col-sm-2 control-label">Tên loại:</span>
                            <div class="col-sm-9">
                                <input type="text" class="form-control txt-studentType" id="tenLoai" required>                                
                            </div>
                        </div>
                        <div class="form-group">
                            <span class="col-sm-2 control-label">Ghi chú:</span>
                            <div class="col-sm-9">
                                <input type="text" class="form-control txt-studentType" id="ghiChu">
                            </div>
                        </div>     
                        <div class="alert alert-success col-sm-11 hide" role="alert" id="tbThanhCong"></div>   
                        <div class="alert alert-warning col-sm-11 hide" role="alert" id="tbChuY"></div> 
                        <div class="alert alert-danger col-sm-11 hide" role="alert" id="tbThatBai"></div>                    
                        <div class="col-sm-offset-2">
                            <input type="button" class="btn btn-success" id="btnThem" onclick="ThemLoai()" value="Thêm"/>  
                            <button class="btn btn-success hide" id="btnSua">Sửa</button>   
                            <input type="button" class="btn btn-danger hide" id="btnXoa" onclick="Xoa()" value="Xóa"/> 
                            <%--<button class="btn btn-warning btn-hide" id="btnHuy">Hủy</button>--%>     
                            <input type="button" class="btn btn-warning hide" id="btnHuy" onclick="Huy()" value="Hủy" />                                        
                        </div>
                        
                    </div>
                    <div class="col-md-6">                        
                        <div>
                            <h4 class="orther-title2">Danh sách loại học viên:</h4>
                            <dx:ASPxGridView ID="gvDanhSachLoaiHV" ClientInstanceName="gvDanhSachLoaiHV" runat="server" AutoGenerateColumns="false" UseSubmitBehavior="false"
                                Theme="DevEx" KeyFieldName="id" Width="100%" OnCustomCallback="gvDanhSachLoaiHV_CustomCallback">                                
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
                                <ClientSideEvents RowClick="gvDanhSachLoaiHVRowClick" EndCallback="gvDanhSachLoaiHVEndCallBack" />
                            </dx:ASPxGridView>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>

