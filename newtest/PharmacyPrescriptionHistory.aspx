<%@ Page Title="Prescription" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PharmacyPrescriptionHistory.aspx.cs" Inherits="newtest.PharmacyPrescriptionHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <ul class="nav nav-tabs justify-content-center" id="myTab">
        <li class="nav-item">
            <a class="nav-link active" data-toggle="tab" href="#pending">Pending Prescription</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#success">Successful Prescription</a>
        </li>
    </ul>
    <div id="myTabContent" class="tab-content">
        <div class="tab-pane fade active show" id="pending">
            <div class="container">
                <br />
                <div class="col-md-12">
                    <div class="card text-white bg-success">
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <center>
                           <h4>Pending Prescription</h4>
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
                                    <asp:GridView class="table table-hover table-responsive-sm" ID="GridView1" runat="server">
                                        <EditRowStyle Font-Bold="True" HorizontalAlign="Justify" VerticalAlign="Middle" />
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br />
                <div class="col-md-12">
                    <div class="row">
                        <div class="col">
                            <center>
                           <h3>Content</h3>
                        </center>
                        </div>
                    </div>
                    <label>Prescription ID</label>
                    <div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="txtpresid" runat="server" placeholder="Prescription ID"></asp:TextBox>
                        <center>
                            <asp:Button class="btn btn-primary" ID="btnfindpresid" runat="server" Text="Find" OnClick="btnfindpresid_Click"/>
                                </center>
                    </div>
                    <label>Doctor Name</label>
                    <div class="form-group">
                        <asp:TextBox CssClass="form-control" ID="textdoctorname" runat="server" placeholder="Doctor Name" ReadOnly="True"></asp:TextBox>
                        <label>Address</label>
                        <asp:TextBox CssClass="form-control" ID="txtdoctoraddress" runat="server" placeholder="Address" TextMode="MultiLine" Rows="2" ReadOnly="True"></asp:TextBox>
                        <label>Contact No</label>
                        <asp:TextBox CssClass="form-control" ID="txtcontactno" runat="server" placeholder="Contact No" ReadOnly="True"></asp:TextBox>
                        <label>Date of Prescription</label>
                        <asp:TextBox CssClass="form-control" ID="txtdate" runat="server" placeholder="MM/DD/YYYY" ReadOnly="True"></asp:TextBox>
                        <label>Recipe (Rx)</label>
                        <asp:TextBox CssClass="form-control" ID="txtrx" runat="server" placeholder="medication" ReadOnly="True"></asp:TextBox>
                        <asp:TextBox CssClass="form-control" ID="txtrxmgtabs" runat="server" placeholder="mg tabs" ReadOnly="True"></asp:TextBox>
                        <label>Signatura (Sig)</label>
                        <asp:TextBox CssClass="form-control" ID="txtsigntabs" runat="server" placeholder="tabs" ReadOnly="True"></asp:TextBox>
                        <asp:TextBox CssClass="form-control" ID="txtsignhrs" runat="server" placeholder="hours" ReadOnly="True"></asp:TextBox>
                        <label>Dispensing Instruction (Disp)</label>
                        <asp:TextBox CssClass="form-control" ID="txtditabs" runat="server" placeholder="tabs" ReadOnly="True"></asp:TextBox>
                        <label>Number of Refills (Rf)</label>
                        <asp:TextBox CssClass="form-control" ID="txtrefill" runat="server" placeholder="refill" ReadOnly="True"></asp:TextBox>
                        <center>
                                    <label>It is Available?</label>
                                    <br />
                            <asp:Button class="btn btn-success" ID="btnyes" runat="server" Text="Yes" OnClick="btnyes_Click"/>
                                <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                            <asp:Button class="btn btn-danger" ID="btnno" runat="server" Text="Clear" OnClick="btnno_Click"/>
                                </center>
                    </div>
                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="success">
            <div class="container">
                <br />
                <div class="col-md-12">
                    <div class="card text-white bg-success">
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <center>
                           <h4>Successful Prescription Bought</h4>
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
                                    <asp:GridView class="table table-hover table-responsive-sm" ID="GridView2" runat="server">
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
    <a href="HomePagePharmacy.aspx"><< Back to Home</a>
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
