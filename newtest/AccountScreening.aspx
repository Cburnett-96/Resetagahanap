<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AccountScreening.aspx.cs" Inherits="newtest.AccountScreening" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col">
                <center>
                   <h4>Account Screening</h4>
                 </center>
            </div>
        </div>
    </div>
    <ul class="nav nav-tabs justify-content-center" id="myTab">
        <li class="nav-item">
            <a class="nav-link active" data-toggle="tab" href="#doctor">Doctor</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#pharmacy">Pharmacy</a>
        </li>
    </ul>
    <div id="myTabContent" class="tab-content">
        <!-- Doctor -->
        <br />
        <div class="tab-pane fade active show" id="doctor">
            <div class="col-md-12">
                <div class="card text-white bg-success">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                           <h5>Doctor</h5>
                            </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:GridView class="table table-hover table-responsive-sm" ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="6" OnRowCancelingEdit="GridView1_RowCancelingEdit"
                                    OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Button class="btn btn-info" ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit" />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:Button class="btn btn-secondary" ID="btn_Update" runat="server" Text="Update" CommandName="Update" />
                                                <hr />
                                                <asp:Button class="btn btn-danger" ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel" />
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ID">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_ID" runat="server" Text='<%#Eval("userid") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Activated">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_Activate" runat="server" Text='<%#Eval("legit") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="DropDownList1" runat="server" class="form-control custom-select">
                                                    <asp:ListItem Text="No" Value="no"></asp:ListItem>
                                                    <asp:ListItem Text="Yes" Value="yes"></asp:ListItem>
                                                </asp:DropDownList>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_Name" runat="server" Text='<%#Eval("doctorname") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Contact">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_Contact" runat="server" Text='<%#Eval("contact") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Address">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_Address" runat="server" Text='<%#Eval("address") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Pharmacy Store -->
        <div class="tab-pane fade" id="pharmacy">
            <div class="col-md-12">
                <div class="card text-white bg-success">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                           <h5>Pharmacy</h5>
                            </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:GridView class="table table-hover table-responsive-sm" ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="6" OnRowCancelingEdit="GridView2_RowCancelingEdit"
                                    OnRowEditing="GridView2_RowEditing" OnRowUpdating="GridView2_RowUpdating">
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Button class="btn btn-info" ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit" />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:Button class="btn btn-secondary" ID="btn_Update" runat="server" Text="Update" CommandName="Update" />
                                                <hr />
                                                <asp:Button class="btn btn-danger" ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel" />
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ID">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_PID" runat="server" Text='<%#Eval("userid") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Activated">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_PActivate" runat="server" Text='<%#Eval("legit") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="DropDownList2" runat="server" class="form-control custom-select">
                                                    <asp:ListItem Text="No" Value="no"></asp:ListItem>
                                                    <asp:ListItem Text="Yes" Value="yes"></asp:ListItem>
                                                </asp:DropDownList>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_StoreName" runat="server" Text='<%#Eval("storename") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Contact">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_Contact" runat="server" Text='<%#Eval("contact") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Address">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_ShopAddress" runat="server" Text='<%#String.Format("{0} {1}", Eval("address"), Eval("town")) %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Google Map src(url)">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_GoogleMap" runat="server" Text='<%#Eval("url") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox CssClass="form-control" ID="txt_Url" runat="server" Text='<%#Eval("url") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
                localStorage.setItem('activeTab', $(e.target).attr('href'));
            });
            var activeTab = localStorage.getItem('activeTab');
            if (activeTab) {
                $('#myTab a[href="' + activeTab + '"]').tab('show');
            }
        });
    </script>
</asp:Content>
