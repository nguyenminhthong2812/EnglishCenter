<%@ Page Title="" Language="C#" MasterPageFile="~/Scripts/Masters/MasterPage.master" AutoEventWireup="true" CodeFile="Books.aspx.cs" Inherits="Scripts_Book_Books" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <script type="text/javascript">
        // Xứ lý các nút

        function ThemLoai() {
            if (cboChuongtrinh.GetValue() == null)
                ThongBao('Vui lòng chọn chương trình', $('#tbChuY'));
            else if (cboCapdo.GetValue() == null)
                ThongBao('Vui lòng chọn cấp độ', $('#tbChuY'));
            else if(txtTenSach.GetValue() == null)
                ThongBao('Vui lòng nhập tên sách', $('#tbChuY'));
            else if(txtGia.GetValue() == null)
                ThongBao('Vui lòng nhập giá sách', $('#tbChuY'));
            else if (txtSoluong.GetValue() == null)
                ThongBao('Vui lòng nhập số lượng', $('#tbChuY'));
            else
                gvDS_sach.PerformCallback('THEMMOI');
        }
        function Sua() {
            if (cboChuongtrinh.GetValue() == null)
                ThongBao('Vui lòng chọn chương trình', $('#tbChuY'));
            else if (cboCapdo.GetValue() == null)
                ThongBao('Vui lòng chọn cấp độ', $('#tbChuY'));
            else if (txtTenSach.GetValue() == null)
                ThongBao('Vui lòng nhập tên sách', $('#tbChuY'));
            else if (txtGia.GetValue() == null)
                ThongBao('Vui lòng nhập giá sách', $('#tbChuY'));
            else if (txtSoluong.GetValue() == null)
                ThongBao('Vui lòng nhập số lượng', $('#tbChuY'));
            else
                gvDS_sach.PerformCallback('CAPNHAT');
        }
        function Timkiem() {
            gvDS_sach.PerformCallback('TIMKIEM');
        }
        function Xoa() {
            //if (Confirm('Thông báo', 'Bạn có muốn xóa?', 'Yes', 'No') == 'Yes') {
            if (confirm('Bạn có muốn xóa?')){
                gvDS_sach.PerformCallback('XOA');
            }
        }

        function Huy() {
            $('#btnThem').removeClass('hide');
            $('#btnSua').addClass('hide');
            $('#btnXoa').addClass('hide');
            $('#btnHuy').addClass('hide');

            Clear();
        }
        function Clear() {
            cboChuongtrinh.SetValue(null);
            cboCapdo.SetValue(null);
            txtMaSach.SetValue(null);
            txtTenSach.SetValue(null);
            txtGia.SetValue(null);
            txtSoluong.SetValue(null);
        }

        // hàm click vào dòng trên danh sách
        function gvDS_sachRowClick(s, e) {
            $('#btnThem').addClass('hide');
            $('#btnSua').removeClass('hide');
            $('#btnXoa').removeClass('hide');
            $('#btnHuy').removeClass('hide');
            s.GetRowValues(e.visibleIndex, "Name;Price;Total;BookCode;LevelCode;ProgramCode", GetValue);
        }

        function GetValue(values) {            
            txtTenSach.SetValue(values[0]);
            txtGia.SetValue(values[1]);
            txtSoluong.SetValue(values[2]);
            txtMaSach.SetValue(values[3]);
            cboCapdo.SetValue(values[4]);
            cboChuongtrinh.SetValue(values[5]);
        }
        
        function gvDS_sachEndCallBack(s, e) {
            if (s.cpTexts == 'THEMTHANHCONG') {
                ThongBao('Đã thêm thành công.', $('#tbThanhCong'));
                delete s.cpTexts;
                Huy();
                gvDS_sach.PerformCallback('TIMKIEM');

            }
            else if (s.cpTexts == 'SUATHANHCONG') {
                ThongBao('Đã cập nhật thành công.', $('#tbThanhCong'));
                delete s.cpTexts;
                Huy();
                gvDS_sach.PerformCallback('TIMKIEM');
            }
            else if (s.cpTexts == 'XOATHANHCONG') {
                ThongBao('Đã xóa thành công.', $('#tbThanhCong'));
                delete s.cpTexts;
                Huy();
                gvDS_sach.PerformCallback('TIMKIEM');
            }
        }

        function ThongBao(mess,id) {            
            id.text(mess);            
            id.fadeIn(1000).removeClass('hide');
            id.fadeOut(2500);
        }


        // Xử lý dialog Confirm

        function Confirm(title, msg, $true, $false) { /*change*/
            var $content = "<div class='dialog-ovelay'>" +
                            "<div class='dialog'><header>" +
                             " <h3> " + title + " </h3> " +
                             "<i class='fa fa-close'></i>" +
                         "</header>" +
                         "<div class='dialog-msg'>" +
                             " <p> " + msg + " </p> " +
                         "</div>" +
                         "<footer>" +
                             "<div class='controls'>" +
                                 " <button class='button button-danger doAction'>" + $true + "</button> " +
                                 " <button class='button button-default cancelAction'>" + $false + "</button> " +
                             "</div>" +
                         "</footer>" +
                      "</div>" +
                    "</div>";
            $('body').prepend($content);
            $('.doAction').click(function () {
                // do something
                $(this).parents('.dialog-ovelay').fadeOut(500, function () {
                    $(this).remove();
                });
            });
            $('.cancelAction, .fa-close').click(function () {
                $(this).parents('.dialog-ovelay').fadeOut(500, function () {
                    $(this).remove();
                });
            });

        }
        var lastCapdo = null;
        function OnChanged_Capdo(cboChuongtrinh) {
            if (cboCapdo.InCallback()) {
                lastCapdo = cboChuongtrinh.GetValue().toString();
            }
            else {
                cboCapdo.PerformCallback(cboChuongtrinh.GetValue().toString());
            }
        }
        function OnEndCallback_capdo(s, e) {
            if (lastCapdo) {
                cboCapdo.PerformCallback(lastCapdo);
                lastCapdo = null;
            }
        }
        
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server"> 
    
    <div>
        <div class=" form-grids row form-grids-right">
            <div class="widget-shadow " data-example-id="basic-forms">
                <div class="form-title">
                    <h4 class="orther-title1">Quản Lý sách :</h4>
                </div>
                <div class="form-body row" >                    
                    <div class="form-horizontal col-md-6" data-toggle="validator">
                        <h4 class="orther-title2">Thông tin sách:</h4>  
                        <div class="form-group">
                            <span class="col-sm-2 control-label">Chương trình:</span>
                            <div class="col-sm-9">                                
                                <dx:ASPxComboBox ID="cboChuongtrinh" runat="server" ValueType="System.String" ClientInstanceName="cboChuongtrinh"
                                    IncrementalFilteringMode="Contains" IncrementalFilteringDelay="500" Theme="Aqua">
                                    <ClientSideEvents SelectedIndexChanged="function(s, e) { OnChanged_Capdo(s); }" />
                                </dx:ASPxComboBox>
                            </div>
                        </div> 
                        <div class="form-group">
                            <span class="col-sm-2 control-label">Cấp độ:</span>
                            <div class="col-sm-9">                                
                                <dx:ASPxComboBox ID="cboCapdo" runat="server" ValueType="System.String" ClientInstanceName="cboCapdo"
                                    IncrementalFilteringMode="Contains" IncrementalFilteringDelay="500" Theme="Aqua" OnCallback="cboCapdo_Callback">
                                    <ClientSideEvents EndCallback=" OnEndCallback_capdo" />
                                </dx:ASPxComboBox>
                            </div>
                        </div>                      
                        <div class="form-group">
                            <span class="col-sm-2 control-label">Mã sách:</span>
                            <div class="col-sm-9">                                
                                <dx:ASPxTextBox ID="txtMaSach" CssClass="form-control" ClientInstanceName="txtMaSach" runat="server" Width="100%"></dx:ASPxTextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <span class="col-sm-2 control-label">Tên sách:</span>
                            <div class="col-sm-9">                                
                                <dx:ASPxTextBox ID="txtTenSach" CssClass="form-control" ClientInstanceName="txtTenSach" runat="server" Width="100%"></dx:ASPxTextBox>                              
                            </div>
                        </div>
                        <div class="form-group">
                            <span class="col-sm-2 control-label">Giá sách:</span>
                            <div class="col-sm-9">                                
                                <dx:ASPxTextBox ID="txtGia" CssClass="form-control" ClientInstanceName="txtGia" runat="server" Width="100%"></dx:ASPxTextBox>                              
                            </div>
                        </div>  
                        <div class="form-group">
                            <span class="col-sm-2 control-label">Số lượng:</span>
                            <div class="col-sm-9">                                
                                <dx:ASPxTextBox ID="txtSoluong" CssClass="form-control" ClientInstanceName="txtSoluong" runat="server" Width="100%"></dx:ASPxTextBox>                              
                            </div>
                        </div>                                           
                        <div class="col-sm-offset-2">
                            <input type="button" class="btn btn-info" id="btnTim" onclick="Timkiem()" value="Tìm kiếm"/> 
                            <input type="button" class="btn btn-success" id="btnThem" onclick="ThemLoai()" value="Thêm"/>  
                            <input type="button" class="btn btn-success hide" id="btnSua" onclick="Sua()" value="Sửa"/>  
                            <%--<button class="btn btn-success hide" id="btnSua">Sửa</button>--%>   
                            <input type="button" class="btn btn-danger hide" id="btnXoa" onclick="Xoa()" value="Xóa"/> 
                            <%--<button class="btn btn-warning btn-hide" id="btnHuy">Hủy</button>--%>     
                            <input type="button" class="btn btn-warning hide" id="btnHuy" onclick="Huy()" value="Hủy" />                                        
                        </div>
                        <div class="alert alert-success col-sm-11 thongbao hide" role="alert" id="tbThanhCong"></div>   
                        <div class="alert alert-warning col-sm-11 thongbao hide" role="alert" id="tbChuY"></div> 
                        <div class="alert alert-danger col-sm-11 thongbao hide" role="alert" id="tbThatBai"></div> 
                    </div>
                    <div class="col-md-6">                        
                        <div>
                            <h4 class="orther-title2">Danh sách:</h4>
                            <dx:ASPxGridView ID="gvDS_sach" ClientInstanceName="gvDS_sach" runat="server" AutoGenerateColumns="false" UseSubmitBehavior="false"
                                Theme="DevEx" KeyFieldName="BookCode" Width="100%" OnCustomCallback="gvDS_sach_CustomCallback">                                
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="STT" VisibleIndex="1" FieldName="Stt">
                                        <HeaderStyle Font-Size="Medium" HorizontalAlign="Center" />
                                        <CellStyle Font-Size="14px" HorizontalAlign="Left">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Tên sách" VisibleIndex="2" FieldName="Name">
                                        <HeaderStyle Font-Size="Medium" HorizontalAlign="Center" />
                                        <CellStyle Font-Size="Medium" HorizontalAlign="Left">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Giá" VisibleIndex="3" FieldName="Price">
                                        <HeaderStyle Font-Size="Medium" HorizontalAlign="Center" />
                                        <CellStyle Font-Size="Small" HorizontalAlign="Left">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn Caption="Số lượng" VisibleIndex="4" FieldName="Total">
                                        <HeaderStyle Font-Size="Medium" HorizontalAlign="Center" />
                                        <CellStyle Font-Size="Small" HorizontalAlign="Left">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="BookCode" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="LevelCode" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="ProgramCode" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <Settings ShowFooter="True" ShowFilterRow="false" ShowFilterBar="Hidden" />
                                <SettingsText EmptyDataRow="Không có dữ liệu"></SettingsText>
                                <SettingsPager Mode="ShowAllRecords" ShowNumericButtons="false" ShowDisabledButtons="false" ShowSeparators="true" Summary-Visible="true"></SettingsPager>
                                <SettingsBehavior AllowSelectByRowClick="true" AllowFocusedRow="true" />
                                <ClientSideEvents RowClick="gvDS_sachRowClick" EndCallback="gvDS_sachEndCallBack" />
                            </dx:ASPxGridView>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>

