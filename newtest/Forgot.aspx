<%@ Page Title="Forgot Password" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Forgot.aspx.cs" Inherits="newtest.Forgot" %>
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
            <div class="container">
                <div class="row">
                    <div class="col-md-12 mx-auto">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <center>
                           <img width="100" src="imgs/forgot.png"/>
                        </center>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <center>
                           <h3>Forgot Password or User ID</h3>
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
                                            <label>Email Address</label>
                                            <asp:TextBox CssClass="form-control mr-sm-2" ID="txtemail" runat="server" placeholder="Email Address" TextMode="Email"></asp:TextBox>
                                            <br />
                                            <center><asp:Button class="btn btn-primary" ID="btnsend" runat="server" Text="Send" OnClick="btnsend_Click"/></center>
                                            <hr />
                                            <label>Verification Code</label>
                                            <asp:TextBox CssClass="form-control" ID="txtotp" runat="server" placeholder="Verivication Code" TextMode="Number"></asp:TextBox>
                                            <br />
                                                <center><asp:Button class="btn btn-primary" ID="btnverify" runat="server" Text="Verify" OnClick="btnverify_Click" Visible="false" /></center>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

</asp:Content>
