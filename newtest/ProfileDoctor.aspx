<%@ Page Title="Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProfileDoctor.aspx.cs" Inherits="newtest.ProfileDoctor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col">
                <center>
                  <img width="100px" src="imgs/doctor.png"/>
              </center>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <center>
               <h4>Doctor Profile</h4>
                </center>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <hr>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label>Full Name</label>
                <div class="form-group">
                    <asp:TextBox CssClass="form-control" ID="txtdoctorname" runat="server" placeholder="First/Middle/Last Name"></asp:TextBox>
                    <label>Contact No</label>
                    <asp:TextBox CssClass="form-control" ID="txtcontact" runat="server" placeholder="Contact No" TextMode="Number"></asp:TextBox>
                    <label>Full Address</label>
                    <asp:TextBox CssClass="form-control" ID="txtdoctoraddress" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-6">
                <div class="col">
                    <center>
                           <span class="btn badge-pill badge-info" data-toggle="modal" data-target="#modallogincre">Change Password</span>
                        </center>
                </div>
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
        <br>
    <a href="HomePageDoctor.aspx"><< Back to Home</a>
    <br>
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
                    <asp:TextBox class="form-control is-invalid" ID="useriddoctor" runat="server" placeholder="New User ID" ReadOnly="True"></asp:TextBox>
                    <a class="invalid-feedback">Sorry, that userid is not able to be changed!</a>
                    <label>Old Password</label>
                    <asp:TextBox class="form-control" ID="oldpasswordoctor" runat="server" placeholder="Old Password" ReadOnly="True"></asp:TextBox>
                    <label>New Password</label>
                    <asp:TextBox class="form-control" ID="newpassworddoctor" runat="server" placeholder="New Password" TextMode="Password"></asp:TextBox>
                </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
