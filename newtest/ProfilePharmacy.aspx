<%@ Page Title="Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProfilePharmacy.aspx.cs" Inherits="newtest.ProfilePharmacy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
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
                           <h4>Pharmacy Store Profile</h4>
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
                                <label>Pharmacy Store Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txtstorename" runat="server" placeholder="Pharmacy Store Name"></asp:TextBox>
                                    <label>Contact No</label>
                                    <asp:TextBox CssClass="form-control" ID="txtshopcontact" runat="server" placeholder="Contact No" TextMode="Number"></asp:TextBox>
                                    <label>Town</label>
                                    <asp:DropDownList class="form-control" ID="listcity" runat="server">
                                        <asp:ListItem Text="Pangil" Value="Pangil" />
                                        <asp:ListItem Text="Pakil" Value="Pakil" />
                                        <asp:ListItem Text="Paete" Value="Paete" />
                                        <asp:ListItem Text="Siniloan" Value="Siniloan" />
                                        <asp:ListItem Text="Famy" Value="Famy" />
                                        <asp:ListItem Text="Sta Maria" Value="Sta Maria" />
                                        <asp:ListItem Text="Mabitac" Value="Mabitac" />
                                        <asp:ListItem Text="Kalayaan" Value="Kalayaan" />
                                    </asp:DropDownList>
                                    <label>Brgy. Address</label>
                                    <asp:TextBox CssClass="form-control" ID="txtshopaddress" runat="server" placeholder="Brgy. Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                    <label>Store Hours</label>
                                    <asp:TextBox CssClass="form-control" ID="txtstorehours" runat="server" placeholder="Format: Day | Open to Close hour" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                           <span class="btn badge-pill badge-info" data-toggle="modal" data-target="#modallogincre">Change Password</span>
                        </center>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-12 mx-auto">
                                <center>
                           <div class="form-group">
                               <asp:Button ID="btnupdateprofile" class="btn btn-primary" runat="server" Text="Update Profile" OnClick="btnupdateprofile_Click"></asp:Button>
                               </div>
                        </center>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <a href="HomePagePharmacy.aspx"><< Back to Home</a>
                <br>
            </div>
        </div>
    </div>
    <!-- Modal Login Credentials -->
        <div class="modal fade" id="modallogincre" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Login Credentials</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <label>User ID</label>
                        <div class="form-group">
                            <asp:TextBox class="form-control is-invalid" ID="useridpharmacy" runat="server" placeholder="New User ID" ReadOnly="True"></asp:TextBox>
                            <a class="invalid-feedback">Sorry, that userid is not able to be changed!</a>
                            <label>Old Password</label>
                            <asp:TextBox class="form-control" ID="oldpasswordpharmacy" runat="server" placeholder="Old Password" ReadOnly="True"></asp:TextBox>
                            <label>New Password</label>
                            <asp:TextBox class="form-control" ID="newpasswordpharmacy" runat="server" placeholder="New Password" TextMode="Password"></asp:TextBox>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
