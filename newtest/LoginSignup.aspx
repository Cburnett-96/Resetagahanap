<%@ Page Title="Patient Login or Signup" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoginSignup.aspx.cs" Inherits="newtest.Home" %>

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
    <ul class="nav nav-tabs justify-content-center" id="myTab">
        <li class="nav-item">
            <a class="nav-link active" data-toggle="tab" href="#login">Login</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#signup">Sign Up</a>
        </li>
    </ul>
    <div id="myTabContent" class="tab-content">
        <div class="tab-pane fade active show" id="login">
            <br />
            <div class="container">
                <div class="row">
                    <div class="col-md-12 mx-auto">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <center>
                           <img width="100" src="imgs/login.png"/>
                        </center>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <center>
                           <h3>User Login</h3>
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
                                        <label>User ID</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="userid" runat="server" placeholder="User ID"></asp:TextBox>
                                        </div>
                                        <label>Password</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="password" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                            <a class="btn btn-link float-right" href="Forgot.aspx">Forgot Password OR User ID?</a>
                                        </div>
                                        <asp:Button class="btn btn-success btn-block btn-lg" ID="btnlogin" runat="server" Text="Login" OnClick="loginbtn_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="signup">
            <br />
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="alert alert-dismissible alert-success">
                                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                                    <strong>Please fill this form to create an account.</strong>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <center>
                           <img width="100" src="imgs/signup.png"/>
                        </center>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <center>
                           <h4>Create your Profile</h4>
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
                                            <asp:TextBox CssClass="form-control" ID="txtname" runat="server" placeholder="First/Middle/Last Name"></asp:TextBox>
                                            <label>Gender</label>
                                            <asp:DropDownList class="form-control" ID="txtgender" runat="server">
                                                <asp:ListItem Text="Select" Value="N/A" />
                                                <asp:ListItem Text="Male" Value="Male" />
                                                <asp:ListItem Text="Female" Value="Female" />
                                            </asp:DropDownList>
                                            <label>Age</label>
                                            <asp:TextBox CssClass="form-control" ID="txtdob" runat="server" placeholder="Age" TextMode="Number"></asp:TextBox>
                                            <label>Contact No</label>
                                            <asp:TextBox CssClass="form-control" ID="txtcontact" runat="server" placeholder="Contact No" TextMode="Number"></asp:TextBox>
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
                                            <asp:TextBox CssClass="form-control" ID="txtaddress" runat="server" placeholder="Brgy. Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                        <hr />
                                            <center><h5 class="text-info">Email Verification</h5></center>
                                            <div class="row">
                                                <div class="col-6">
                                            <label>Active Email Address</label>
                                            <asp:TextBox CssClass="form-control mr-sm-2" ID="txtemail" runat="server" placeholder="Email Address" TextMode="Email"></asp:TextBox>
                                            <small class="form-text text-muted">We'll never share your email with anyone else.</small>
                                            <br />
                                            <center><asp:Button class="btn btn-primary" ID="btnsend" runat="server" Text="Send" OnClick="btnsend_Click"/></center>
                                            </div>
                                            <div class="col-6">
                                            <label>Your Verification Code</label>
                                            <asp:TextBox CssClass="form-control" ID="txtotp" runat="server" placeholder="Verivication Code" TextMode="Number"></asp:TextBox>
                                            <br />
                                                <center><asp:Button class="btn btn-primary" ID="btnverify" runat="server" Text="Verify" OnClick="btnverify_Click" Visible="false" /></center>
                                            </div>
                                            </div>
                                            <br />
                                            <a id="verify" runat="server"><center><h6 class="text-danger">Note: Verify First Before to Proceed</h6></center></a>
                                        </div>
                                    </div>
                                </div>
                                <hr />
                                <div class="row" id="proceed" runat="server" visible="false">
                                    <div class="col-12 mx-auto">
                                        <center>
                           <div class="form-group">
                            <center><asp:Label ID="Label1" runat="server" Text="Successful Verify! (Please Proceed)"></asp:Label></center>
                               <a class="btn btn-success float-right" data-toggle="modal" data-target="#modallogincre">Proceed <span class="fa fa-arrow-right"></span></a>
                           </div>
                                            </center>
                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal Signup Credentials -->
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
                    <div class="row">
                        <div class="col">
                            <center>
                           <span class="badge badge-pill badge-info">Login Credentials</span>
                        </center>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">

                            <label>New User ID</label>
                            <div class="form-group">
                                <asp:TextBox class="form-control" ID="useridsignup" runat="server" placeholder="New User ID"></asp:TextBox>
                                <label>New Password</label>
                                <asp:TextBox class="form-control" ID="passwordsignup" runat="server" placeholder="New Password" TextMode="Password"></asp:TextBox>
                                <p class="text-success">Minimum of 8 characters</p>
                                <label>Confirm New Password</label>
                                <asp:TextBox class="form-control" ID="confirmpassword" runat="server" placeholder="Confirm New Password" TextMode="Password"></asp:TextBox>
                                <asp:CompareValidator CssClass="btn btn-link text-danger" ID="CompareValidator1" runat="server" ErrorMessage="Password Not Match!" ControlToCompare="passwordsignup" ControlToValidate="confirmpassword">
                                </asp:CompareValidator>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button class="btn btn-primary" ID="btnsignup" runat="server" Text="Sign Up" OnClick="btnsignup_Click" />
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
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
