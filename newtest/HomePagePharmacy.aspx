<%@ Page Title="Homepage" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HomePagePharmacy.aspx.cs" Inherits="newtest.HomePagePharmacy" %>
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
                    </div>
                    <div class="card-body">
                        <center>
                        <asp:ImageButton ID="ImageButton2" runat="server" Height="90px" Width="90px" ImageUrl="~/imgs/prescription.png" OnClick="ImageButton2_Click"/>
                            <h5 class="text-success">View Prescription</h5>
                            </center>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal Underdeveloped -->
    <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel1">Appointment Status</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p class="text-primary">Underdeveloped</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
