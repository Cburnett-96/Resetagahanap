<%@ Page Title="Admin Homepage" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminHomePage.aspx.cs" Inherits="newtest.AdminHomePage" %>

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
                        <asp:ImageButton ID="ImageButton2" runat="server" Height="90px" Width="90px" ImageUrl="~/imgs/dashboard.png" OnClick="ImageButton2_Click"/>
                            </center>
                        <center>
                            <h3 class="text-success">Dashboard</h3>
                            </center>
                    </div>
                    <div class="card-body">
                        <center>
                        <asp:ImageButton ID="ImageButton1" runat="server" Height="90px" Width="90px" ImageUrl="~/imgs/management.jpg" OnClick="ImageButton1_Click"/>
                            <h5 class="text-success">Manage User Account</h5>
                        </center>
                    </div>
                    <div class="card-body">
                        <center>
                        <asp:ImageButton ID="ImageButton4" runat="server" Height="90px" Width="90px" ImageUrl="~/imgs/prescription.png" OnClick="ImageButton4_Click"/>
                            <h5 class="text-success">Manage Prescription</h5>
                            </center>
                    </div>
                    <div class="card-body">
                        <center>
                        <asp:ImageButton ID="ImageButton5" runat="server" Height="90px" Width="90px" ImageUrl="~/imgs/generaluser.png" OnClick="ImageButton5_Click"/>
                            <h5 class="text-success">Review Pharmacy/Doctor</h5>
                            </center>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <center>
    <asp:Button class="btn btn-outline-danger" ID="Button1" runat="server" Text="Logout" OnClick="Button1_Click"></asp:Button>
        </center>
        <br />
    </div>
</asp:Content>
