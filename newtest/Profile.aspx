<%@ Page Title="Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="newtest.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="banner-wrapper">
        <div id="banner" class="box container">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <center>
                           <img width="100px" src="imgs/profile.png"/>
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
                                    <label>Full Name</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="txtfullname" runat="server" placeholder="Full Name"></asp:TextBox>
                                    <label>Gender</label>
                                        <asp:DropDownList class="form-control" ID="genderlist" runat="server">
                                            <asp:ListItem Text="Select" Value="N/A" />
                                            <asp:ListItem Text="Male" Value="Male" />
                                            <asp:ListItem Text="Female" Value="Female" />
                                        </asp:DropDownList>
                                    <label>Age</label>
                                        <asp:TextBox CssClass="form-control" ID="txtdob" runat="server" placeholder="Age" TextMode="Number"></asp:TextBox>
                                    <label>Contact No</label>
                                        <asp:TextBox CssClass="form-control" ID="txtcontact" runat="server" placeholder="Contact No" TextMode="Number"></asp:TextBox>
                                    <label>Email Address</label>
                                        <asp:TextBox CssClass="form-control" ID="txtemail" runat="server" placeholder="Email Address" TextMode="Email"></asp:TextBox>
                                    <label>Town</label>
                                        <asp:DropDownList class="form-control" ID="citylist" runat="server">
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
                                        <asp:TextBox CssClass="form-control" ID="txtaddress" runat="server" placeholder="Brgy. Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
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
                              <asp:Button class="btn btn-primary btn-block btn-lg" ID="btnupdate" runat="server" Text="Update Profile" OnClick="btnupdate_Click"/>
                           </div>
                                </center>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br>
                    <a href="Home Page.aspx"><< Back to Home</a>
                    <br>
                </div>
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
                            <asp:TextBox class="form-control is-invalid" ID="userid" runat="server" placeholder="User ID" ReadOnly="True"></asp:TextBox>
                            <a class="invalid-feedback">Sorry, that userid is not able to be changed!</a>
                            <label>Old Password</label>
                            <asp:TextBox class="form-control" ID="oldpassword" runat="server" placeholder="Old Password" ReadOnly="True"></asp:TextBox>
                            <label>New Password</label>
                            <asp:TextBox class="form-control" ID="newpassword" runat="server" placeholder="New Password" TextMode="Password"></asp:TextBox>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
