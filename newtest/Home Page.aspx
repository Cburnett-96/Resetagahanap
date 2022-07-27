<%@ Page Title="Homepage" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home Page.aspx.cs" Inherits="newtest.Home_Page" %>

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
    <br />
    <div id="banner-wrapper" class="box container">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <center>
                        <a href="#" data-toggle="modal" data-target="#exampleModal2"><asp:ImageButton ID="ImageButton1" runat="server" Height="90px" Width="90px" ImageUrl="~/imgs/how.png"/></a>
                            </center>
                        <center>
                        <asp:LinkButton ID="LinkButton1" data-toggle="modal" data-target="#exampleModal2" runat="server">HOW to use?</asp:LinkButton>
                            </center>
                    </div>
                    <br />
                         <div class="card-body">
                        <center>
                        <asp:ImageButton ID="ImageButton2" runat="server" Height="90px" Width="90px" ImageUrl="~/imgs/prescription.png" OnClick="ImageButton2_Click"/>
                            <h5 class="text-success">View Prescription</h5>
                            </center>
                    </div>
                    <div class="card-body">
                        <center>
                        <asp:ImageButton ID="ImageButton3" runat="server" Height="90px" Width="90px" ImageUrl="~/imgs/pharmacy.png" OnClick="ImageButton3_Click"/>
                            <h5 class="text-success">View Pharmacy Store</h5>
                            </center>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal How -->
    <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel1">HOW to Use?</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p class="text-danger">Note: You can proceed if you're already prescribed by Doctor</p>
                    <center><img src="imgs/how/ViewPrescriptionHistory.jpeg" height="400" width="300" /></center>
                    <p class="text-primary">Click this View Prescription History</p>
                    <hr />
                    <center><img src="imgs/how/PrescriptionHistory.jpeg" height="300" width="300" /></center>
                    <p class="text-primary">This Prescription History containing: Prescription ID, Date and Doctor Name</p>
                    <hr />
                    <center><img src="imgs/how/PrescriptionContent.jpeg" height="1100" width="310" /></center>
                    <p class="text-primary">This Prescription Content containing all of medication and Doctor Information.</p>
                    <p>(Find Button)Input your last Prescribed, Prescription ID to find information.</p>
                    <p>(Send Button)Below you can send it on your desire town.(All Pharmacy store within your chosen town will recieve the prescription)</p>
                    <hr />
                    <center><img src="imgs/how/ViewPharmacyStore.jpeg" height="400" width="300" /></center>
                    <p class="text-primary">Click this View Pharmacy Store</p>
                    <hr />
                    <center><img src="imgs/how/TownPharmacyStore.png" width="300" /></center>
                    <p>(List Box) Select your desired town then (Input Box) input your Prescription ID to find your prescription based on town automatically</p>
                <p>(Table List) List of all Pending Prescription based on your prevoius send to desired town</p>
                    <hr />
                    <center><img src="imgs/how/TownPharmacyStoreInfo.png" width="300"/></center>
                    <p>(Buy Button) Show the Detailed Prescription and Process.</p>
                    <p>Below are information of Pharmacy Store and Location based on (Google Map)</p>
                    <hr />
                    <center><img src="imgs/how/ProductInfo.png" width="300"/></center>
                    <p class="text-primary">Here's your Medicine Product information if it available</p>
                    <p>(Yes Button) You can Now Proceed into the store physicaly to Buy the Product (No Button) it is just close</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
