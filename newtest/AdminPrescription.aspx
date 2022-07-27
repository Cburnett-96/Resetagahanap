<%@ Page Title="Admin Prescription" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminPrescription.aspx.cs" Inherits="newtest.AdminPrescription" %>

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
            <a class="nav-link active" data-toggle="tab" href="#prescription">Prescription</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#town">Prescription Patient Status</a>
        </li>
    </ul>
    <div id="myTabContent" class="tab-content">
        <!-- Prescription Content -->
        <div class="tab-pane fade active show" id="prescription">
            <div class="container">
                <br />
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col">
                                <center>
                           <h4>Prescription</h4>
                                </center>
                            </div>
                        </div>
                        <label>Prescription ID</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="txtpresid" runat="server" placeholder="Prescription ID"></asp:TextBox>
                            <br />
                            <center>
                            <asp:Button class="btn btn-primary" ID="btnfindpresid" runat="server" Text="Find" OnClick="btnfindpresid_Click"/>
                        </center>
                            <label>Doctor Name</label>
                            <asp:TextBox CssClass="form-control" ID="txtdoctorname" runat="server" placeholder="Full Name" ReadOnly="True"></asp:TextBox>
                            <label>Date of Prescription</label>
                            <asp:TextBox CssClass="form-control" ID="txtdate" runat="server" placeholder="MM/DD/YYYY" ReadOnly="True"></asp:TextBox>
                            <br />
                            <center>
                              <asp:Button class="btn btn-danger" ID="btndeletepres" runat="server" Text="Delete Prescription" OnClick="btndeletepres_Click"/>
                           </center>
                        </div>
                        <br />
                        <div class="col-md-12">
                            <div class="card text-white bg-success">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col">
                                            <center>
                                        <h4>Prescription History</h4>
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
                                            <asp:GridView class="table table-hover table-responsive-sm" ID="GridViewpres" runat="server">
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
        </div>
        <!-- Prescription Patient Status -->
        <div class="tab-pane fade" id="town">
            <div class="container">
                <br />
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col">
                                <center>
                           <h4>Prescription Patient Status</h4>
                                </center>
                            </div>
                        </div>
                        <label>ID</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="txtid" runat="server" placeholder="ID"></asp:TextBox>
                            <br />
                            <center>
                            <asp:Button class="btn btn-primary" ID="btnfindtown" runat="server" Text="Find" OnClick="btnfindtown_Click"/>
                        </center>
                            <label>Patient Name</label>
                            <asp:TextBox CssClass="form-control" ID="txtname" runat="server" placeholder="Patient Name" ReadOnly="True"></asp:TextBox>
                            <br />
                            <center>
                              <asp:Button class="btn btn-danger" ID="btndeletetown" runat="server" Text="Delete Prescription" OnClick="btndeletetown_Click"/>
                           </center>
                        </div>
                        <br />
                        <div class="col-md-12">
                            <div class="card text-white bg-success">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col">
                                            <center>
                                        <h4>Prescription History</h4>
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
                                            <asp:GridView class="table table-hover table-responsive-sm" ID="GridViewTown" runat="server">
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
        </div>
    </div>
    <br>
    <a href="AdminHomePage.aspx"><< Back to Home</a>
    <br>
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
