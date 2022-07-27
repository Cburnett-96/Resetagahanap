<%@ Page Title="Prescription" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DoctorPrescription.aspx.cs" Inherits="newtest.DoctorPrescription" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <ul class="nav nav-tabs justify-content-center" id="myTab">
        <li class="nav-item">
            <a class="nav-link active" data-toggle="tab" href="#patient">Patient Info</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#content">Prescription Content</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#history">Prescription History</a>
        </li>
    </ul>
    <div id="myTabContent" class="tab-content">
        <div class="tab-pane fade active show" id="patient">
            <div class="container">
                <br />
                <div class="col-md-12">
                    <div class="row">
                        <div class="col">
                            <center>
                           <h3>Patient</h3>
                        </center>
                        </div>
                    </div>
                    <div class="col-md-0">
                        <label>User ID</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="txtuserid" runat="server" placeholder="User ID"></asp:TextBox>
                            <center>
                            <asp:Button class="btn btn-primary" ID="btnfind" runat="server" Text="Find" OnClick="btnfind_Click"/>
                            </center>
                        </div>
                    </div>
                    <div class="col-md-0">
                        <label>Name</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="txtname" runat="server" placeholder="Name" ReadOnly="True"></asp:TextBox>
                            <label>Age</label>
                            <asp:TextBox CssClass="form-control" ID="dobtxt" runat="server" placeholder="Age" ReadOnly="True"></asp:TextBox>
                            <label>Gender</label>
                            <asp:TextBox CssClass="form-control" ID="txtgender" runat="server" placeholder="Gender" ReadOnly="True"></asp:TextBox>
                            <label>Address</label>
                            <asp:TextBox CssClass="form-control" ID="txtaddress" runat="server" placeholder="Address" TextMode="MultiLine" Rows="2" ReadOnly="True"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="content">
            <div class="container">
                <br />
                <div class="col-md-12">
                    <div class="row">
                        <div class="col">
                            <center>
                           <h3>Content</h3>
                        </center>
                        </div>
                    </div>
                    <div class="col-md-0">
                        <label>Prescription ID</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="txtpresid" runat="server" placeholder="Prescription ID" ReadOnly="True"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-0">
                        <label>Doctor Name</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="txtdoctorname" runat="server" placeholder="First/Middle/Last Name" ReadOnly="True"></asp:TextBox>
                            <label>Doctor Address</label>
                            <asp:TextBox CssClass="form-control" ID="txtdoctoraddress" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="2" ReadOnly="True"></asp:TextBox>
                            <label>Contact No</label>
                            <asp:TextBox CssClass="form-control" ID="txtcontact" runat="server" placeholder="Contact No" TextMode="Number" ReadOnly="True"></asp:TextBox>
                        </div>
                        <label>Date of Prescription</label>
                        <div class="form-group">
                            <asp:TextBox CssClass="form-control" ID="txtdate" runat="server" placeholder="MM/DD/YYYY" TextMode="Date"></asp:TextBox>
                            <label>Recipe (Rx)</label>
                            <asp:TextBox CssClass="form-control" ID="txtrx" runat="server" placeholder="medication"></asp:TextBox>
                            <asp:TextBox CssClass="form-control" ID="txtrxmgtabs" runat="server" placeholder="mg tabs"></asp:TextBox>
                            <label>Signatura (Sig)</label>
                            <asp:TextBox CssClass="form-control" ID="txtsigntabs" runat="server" placeholder="tabs"></asp:TextBox>
                            <asp:TextBox CssClass="form-control" ID="txtsignhrs" runat="server" placeholder="hours"></asp:TextBox>
                            <label>Dispensing Instruction (Disp)</label>
                            <asp:TextBox CssClass="form-control" ID="txtditabs" runat="server" placeholder="tabs"></asp:TextBox>
                            <label>Number of Refills (Rf)</label>
                            <asp:TextBox CssClass="form-control" ID="txtrefill" runat="server" placeholder="refill"></asp:TextBox>
                        </div>
                        <center>
                           <div class="form-group">
                              <asp:Button class="btn btn-success" ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click"/>
                           </div>
                        </center>
                    </div>
                </div>
            </div>
         </div>
        <div class="tab-pane fade" id="history">
            <div class="container">
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
                                    <asp:GridView class="table table-hover table-responsive-sm" ID="GridViewHistory" runat="server">
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
    <a href="HomePageDoctor.aspx"><< Back to Home</a>
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
