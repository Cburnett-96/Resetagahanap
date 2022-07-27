<%@ Page Title="Members Account Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="newtest.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12 mx-auto">
                <center>
                    <img src="imgs/banner.png" />
                </center>
            </div>
        </div>
    </div>
    <ul class="nav nav-tabs justify-content-center" id="myTab">
        <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#doctor">Doctor</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#pharmacy">Pharmacy Shop</a>
        </li>
        <li class="nav-item">
            <a class="nav-link active" data-toggle="tab" href="#user">Normal User</a>
        </li>
    </ul>
    <div id="myTabContent" class="tab-content">
        <!-- Doctor -->
        <div class="tab-pane fade" id="doctor">
            <div class="box container">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col">
                            <center>
                           <img width="100px" src="imgs/doctor.png"/>
                        </center>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <center>
                           <h4>Doctor User Profile</h4>
                            </center>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <hr>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label>User ID</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="doctoruserid" runat="server" placeholder="User ID"></asp:TextBox>
                                <center>
                            <asp:Button class="btn btn-success" ID="btnfinddoctor" runat="server" Text="Find" OnClick="btnfinddoctor_Click"/>
                        </center>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <label>Doctor Name</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="txtdoctorname" runat="server" placeholder="Full Name" ReadOnly="True"></asp:TextBox>
                                <label>Contact No</label>
                                <asp:TextBox CssClass="form-control" ID="txtdoctorcontact" runat="server" placeholder="Contact No" ReadOnly="True"></asp:TextBox>
                                <label>Full Address</label>
                                <asp:TextBox CssClass="form-control" ID="txtdoctoraddress" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="2" ReadOnly="True"></asp:TextBox>
                                <br />
                                <center>
                             <a class="btn btn-danger" data-toggle="modal" data-target="#confirmdoctor">Delete User Profile</a>
                           </center>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="card text-white bg-success">
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <center>
                                  <h4>Doctor User List</h4>
                                    </center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <hr>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <asp:GridView class="table table-hover table-responsive-sm" ID="GridViewdoctor" runat="server">
                                        <EditRowStyle Font-Bold="True" HorizontalAlign="Justify" VerticalAlign="Middle" />
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Pharmacy Store -->
        <div class="tab-pane fade" id="pharmacy">
            <div class="box container">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col">
                            <center>
                           <img width="100px" src="imgs/pharmacy1.png"/>
                        </center>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <center>
                           <h4>Pharmacy User Profile</h4>
                            </center>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <hr>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label>User ID</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="txtpharmacyuserid" runat="server" placeholder="User ID"></asp:TextBox>
                                <center>
                            <asp:Button class="btn btn-success" ID="btnfindpharmacy" runat="server" Text="Find" OnClick="btnfindpharmacy_Click"/>
                        </center>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <label>Store Name</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="txtpharmacyname" runat="server" placeholder="Store Name" ReadOnly="True"></asp:TextBox>
                                <label>Contact No</label>
                                <asp:TextBox CssClass="form-control" ID="txtpharmacycontact" runat="server" placeholder="Contact No" ReadOnly="True"></asp:TextBox>
                                <label>Full Address</label>
                                <asp:TextBox CssClass="form-control" ID="txtpharmacyaddress" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="2" ReadOnly="True"></asp:TextBox>
                                <br />
                                <center>
                              <a class="btn btn-danger" data-toggle="modal" data-target="#confirmpharmacy">Delete User Profile</a>
                           </center>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="card text-white bg-success">
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <center>
                                <h4>Pharmacy User List</h4>
                                    </center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <hr>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <asp:GridView class="table table-hover table-responsive-sm" ID="GridViewPharmacy" runat="server">
                                        <EditRowStyle Font-Bold="True" HorizontalAlign="Justify" VerticalAlign="Middle" />
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Normal User -->
        <div class="tab-pane fade active show" id="user">
            <div class="box container">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col">
                            <center>
                           <img width="100px" src="imgs/generaluser.png"/>
                        </center>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <center>
                           <h4>User Profile</h4>
                            </center>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <hr>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label>User ID</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="txtuserid" runat="server" placeholder="User ID"></asp:TextBox>
                                <center>
                            <asp:Button class="btn btn-success" ID="btnfinduser" runat="server" Text="Find" OnClick="btnfinduser_Click"/>
                        </center>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <label>Name</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="txtusername" runat="server" placeholder="Full Name" ReadOnly="True"></asp:TextBox>
                                <label>Contact No</label>
                                <asp:TextBox CssClass="form-control" ID="txtusercontact" runat="server" placeholder="Contact No" ReadOnly="True"></asp:TextBox>
                                <label>Full Address</label>
                                <asp:TextBox CssClass="form-control" ID="txtuseraddress" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="2" ReadOnly="True"></asp:TextBox>
                                <br />
                                <center>
                                    <a class="btn btn-danger" data-toggle="modal" data-target="#confirmnormal">Delete User Profile</a>
                           </center>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="card text-white bg-success">
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <center>
                                <h4>Normal User List</h4>
                                    </center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <hr>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <asp:GridView class="table table-hover table-responsive-sm" ID="GridViewNormalUser" runat="server">
                                        <EditRowStyle Font-Bold="True" HorizontalAlign="Justify" VerticalAlign="Middle" />
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <a href="AdminHomePage.aspx"><< Back to Home</a>
    <br>
    <!-- Modal Confirmation Normal User -->
        <div class="modal fade" id="confirmnormal" tabindex="-1" role="dialog" aria-labelledby="confirmnormal1" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="confirmnormal1">Warning!</h5>
                    </div>
                    <div class="modal-body">
                        <p>
                            Are you sure want to delete?
                        </p>
                    </div>
                    <div class="modal-footer">
                        <asp:Button class="btn btn-danger" ID="btndeleteuser" runat="server" Text="Yes" OnClick="btndeleteuser_Click"/>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                    </div>
                </div>
            </div>
        </div>
    <!-- Modal Confirmation Doctor User -->
        <div class="modal fade" id="confirmdoctor" tabindex="-1" role="dialog" aria-labelledby="confirmdoctor1" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="confirmdoctor1">Warning!</h5>
                    </div>
                    <div class="modal-body">
                        <p>
                            Are you sure want to delete doctor account?
                        </p>
                    </div>
                    <div class="modal-footer">
                         <asp:Button class="btn btn-danger" ID="btndoctordelete" runat="server" Text="Yes" OnClick="btndoctordelete_Click"/>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                    </div>
                </div>
            </div>
        </div>
    <!-- Modal Confirmation Pharmacy User -->
        <div class="modal fade" id="confirmpharmacy" tabindex="-1" role="dialog" aria-labelledby="confirmpharmacy1" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="confirmpharmacy1">Warning!</h5>
                    </div>
                    <div class="modal-body">
                        <p>
                            Are you sure want to delete pharmacy account?
                        </p>
                    </div>
                    <div class="modal-footer">
                         <asp:Button class="btn btn-danger" ID="btndeletepharmacy" runat="server" Text="Yes" OnClick="btndeletepharmacy_Click"/>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
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
