<%@ Page Title="Homepage" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HomePageDoctor.aspx.cs" Inherits="newtest.HomePageDoctor" %>

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
</asp:Content>
