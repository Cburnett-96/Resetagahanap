<%@ Page Title="Doctor Login or Signup" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DoctorLoginSignup.aspx.cs" Inherits="newtest.DoctorLoginSignup" %>
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
            <a class="nav-link" data-toggle="tab" href="#signup">Signup</a>
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
                           <img width="100" src="imgs/doctor.png"/>
                        </center>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <center>
                           <h3>Doctor User Login</h3>
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
                                        <a class="btn btn-link float-right" data-toggle="modal" data-target="#modalforgot">Forgot Password OR User ID?</a>
                                        </div>
                                    <asp:Button class="btn btn-success btn-block btn-lg" ID="btnlogindoctor" runat="server" Text="Login" OnClick="btnlogindoctor_Click" />
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
            <div class="box container">
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
                           <img width="100px" src="imgs/doctor.png"/>
                        </center>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <center>
                           <h4>Create your Doctor Profile</h4>
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
                                            <asp:TextBox CssClass="form-control" ID="txtdoctorname" runat="server" placeholder="Dr. First/Middle/Last Name"></asp:TextBox>
                                            <label>Contact No</label>
                                            <asp:TextBox CssClass="form-control" ID="txtdoctorcontact" runat="server" placeholder="Contact No" TextMode="Number"></asp:TextBox>
                                            <label>Full Address</label>
                                            <asp:TextBox CssClass="form-control" ID="txtdoctoraddress" runat="server" placeholder="Full Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
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
                                            <asp:TextBox class="form-control" ID="useriddoctor" runat="server" placeholder="New User ID"></asp:TextBox>
                                            <label>New Password</label>
                                            <asp:TextBox class="form-control" ID="passwordoctor" runat="server" placeholder="New Password" TextMode="Password"></asp:TextBox>
                                            <p class="text-success">Minimum of 8 characters</p>
                                            <label>Confirm New Password</label>
                                            <asp:TextBox class="form-control" ID="confirmpassword" runat="server" placeholder="Confirm New Password" TextMode="Password"></asp:TextBox>
                                            <asp:CompareValidator CssClass="btn btn-link text-danger" ID="CompareValidator1" runat="server" ErrorMessage="Password Not Match!" ControlToCompare="passwordoctor" ControlToValidate="confirmpassword">
                                            </asp:CompareValidator>

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
                                                <center><asp:Button class="btn btn-primary" ID="btnverify" runat="server" Text="Verify" OnClick="btnverify_Click" Visible="false"/></center>
                                            </div>
                                            </div>
                                            <br />
                                            <a id="verify" runat="server"><center><h6 class="text-danger">Note: Verify First Before to Proceed</h6></center></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" id="proceed" runat="server" visible="false">
                                    <div class="col-12 mx-auto">
                                        <center>
                           <div class="form-group">
                               <center><asp:Label ID="Label1" runat="server" Text="Successful Verify! (Please Proceed)"></asp:Label></center>
                               <button onclick="javascript:signupdoctor();return false;" type="button" data-toggle="modal" data-target="#exampleModal" class="btn btn-primary btn-block btn-lg">Sign Up</button>
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
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Review Your Profile</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:TextBox class="form-control form-control-sm" ID="TextBox1" runat="server" ReadOnly="True" Wrap="False" ></asp:TextBox>
                    <asp:TextBox class="form-control form-control-sm" ID="TextBox2" runat="server" ReadOnly="True" Wrap="False" ></asp:TextBox>
                    <asp:TextBox class="form-control form-control-sm" ID="TextBox3" runat="server" ReadOnly="True" Wrap="False" ></asp:TextBox>
                    <asp:TextBox class="form-control form-control-sm" ID="TextBox5" runat="server" TextMode="MultiLine" ReadOnly="True" Wrap="False"></asp:TextBox>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <asp:Button class="btn btn-success" ID="signupbtn" runat="server" Text="Proceed" OnClick="signupbtn_Click" />
                </div>
            </div>
        </div>
    </div>
     <!-- Modal Forgot-->
    <div class="modal fade" id="modalforgot" tabindex="-1" role="dialog" aria-labelledby="modalforgot1" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalforgot1">Forgot Password OR User ID?</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <h4 class="text-info">
                        Contact Us for your Account Recovery!
                    </h4>
                    <hr />
                    <address>
                            <strong>John Nicolas Email:</strong> <a href="mailto:johnnicolasvincent.petate@lspu.edu.ph">johnnicolasvincent.petate@lspu.edu.ph</a><br />
                            <strong>Albert Email:</strong> <a href="mailto:albert.pasco@lspu.edu.ph">albert.pasco@lspu.edu.ph</a><br />
                            <strong>Mark Dennis Email:</strong> <a href="mailto:markdennis.vergara@lspu.edu.ph">markdennis.vergara@lspu.edu.ph</a>
                        </address>
                        <p>
                            Pangil, Laguna, Philippines 4018<br />
                            +63936 027 6388
                        </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <script>
        //Function to copy the value
        function signupdoctor() {
            //UserId
            var userid = document.getElementById('<%=useriddoctor.ClientID %>');
            var userid1 = document.getElementById('<%=TextBox1.ClientID %>');
            userid1.value = "User ID: " + userid.value;
            //Name
            var name = document.getElementById('<%=txtdoctorname.ClientID %>');
            var name1 = document.getElementById('<%=TextBox2.ClientID %>');
            name1.value = "Name: " + name.value;
            //Contact
            var contact = document.getElementById('<%=txtdoctorcontact.ClientID %>');
            var contact1 = document.getElementById('<%=TextBox3.ClientID %>');
            contact1.value = "Contact No: " + contact.value;
            //Address
            var address = document.getElementById('<%=txtdoctoraddress.ClientID %>');
            var address1 = document.getElementById('<%=TextBox5.ClientID %>');
            address1.value = "Address: " + address.value;
        }
    </script>
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
