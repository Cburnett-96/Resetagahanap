<%@ Page Title="Prescription" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PrescriptionPatientView.aspx.cs" Inherits="newtest.PrescriptionPatientView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <ul class="nav nav-tabs justify-content-center" id="myTab">
        <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#history">Prescription History</a>
        </li>
        <li class="nav-item">
            <a class="nav-link active" data-toggle="tab" href="#content">Prescription Content</a>
        </li>
    </ul>
    <div id="myTabContent" class="tab-content">
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
                                    <asp:GridView class="table table-hover table-responsive-sm" ID="GridView1" runat="server">
                                        <EditRowStyle Font-Bold="True" HorizontalAlign="Justify" VerticalAlign="Middle" />
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        <div class="tab-pane fade active show" id="content">
            <div class="container">
                <br />
                <div class="col-md-12">
                    <div class="row">
                        <div class="col">
                            <center>
                           <h4>Content</h4>
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
                            <asp:TextBox CssClass="form-control" ID="txtdoctorname" runat="server" placeholder="Doctor Name" ReadOnly="True"></asp:TextBox>
                        <label>Doctor Address</label>
                            <asp:TextBox CssClass="form-control" ID="txtdoctoraddress" runat="server" placeholder="Doctor Address" TextMode="MultiLine" Rows="2" ReadOnly="True"></asp:TextBox>
                        <label>Doctor Contact No.</label>
                            <asp:TextBox CssClass="form-control" ID="txtcontactno" runat="server" placeholder="Doctor Contact No." ReadOnly="True"></asp:TextBox>
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
                    </div>
                <br />
                <div class="col-md-12">
                    <h5>Select town to send your Prescription in Available Pharmacy Store</h5>
                    <div class="form-group">
                        <asp:DropDownList class="form-control" ID="citylist" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            <asp:ListItem Text="Select" Value="Select" />
                            <asp:ListItem Text="Pangil" Value="Pangil" />
                            <asp:ListItem Text="Pakil" Value="Pakil" />
                            <asp:ListItem Text="Paete" Value="Paete" />
                            <asp:ListItem Text="Siniloan" Value="Siniloan" />
                            <asp:ListItem Text="Famy" Value="Famy" />
                            <asp:ListItem Text="Sta Maria" Value="Sta Maria" />
                            <asp:ListItem Text="Mabitac" Value="Mabitac" />
                            <asp:ListItem Text="Kalayaan" Value="Kalayaan" />
                        </asp:DropDownList>
                        <br />
                        <center>
                        <asp:DropDownList class="form-control custom-select" ID="DropDownList1" runat="server" DataTextField="storename" DataValueField="storename">
                        </asp:DropDownList>
                        </center>
                        <br />
                        <center>
                        <asp:Button class="btn btn-success" ID="btnsend" runat="server" Text="Send Prescription To Pharmacy Store" OnClick="btnsend_Click"/>
                            </center>
                    </div>
                </div>
                    <br />
                    <a href="Home Page.aspx"><< Back to Home</a><br>
                    <br>
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
