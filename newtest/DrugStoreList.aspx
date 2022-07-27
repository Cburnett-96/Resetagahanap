<%@ Page Title="Drug Store or Pharmacy List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DrugStoreList.aspx.cs" Inherits="newtest.DrugStoreList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-12">
        <div class="col-md-12">
            <h3>List Of Drug Store or Pharmacy</h3>
            <div class="form-group">
                <center>
                  <label>Prescription ID:</label>
                        <asp:TextBox style="text-indent: 0px;width: 130px;" ID="txtpresid" CssClass="form-control form-control-sm text-sm-center" runat="server" placeholder="Prescription ID"></asp:TextBox>
                </center>
                <br />
                <center>
                <asp:DropDownList style="text-indent: 0px;width: 130px;" class="form-control custom-select" ID="citylist" runat="server" AutoPostBack="True" OnSelectedIndexChanged="citylist_SelectedIndexChanged">
                    <asp:ListItem Text="Select" Value="Select" />
                    <asp:ListItem Text="Pangil" Value="Pangil" />
                    <asp:ListItem Text="Pakil" Value="Pakil" />
                    <asp:ListItem Text="Paete" Value="Paete" />
                    <asp:ListItem Text="Siniloan" Value="Siniloan" />
                    <asp:ListItem Text="Famy" Value="Famy" />
                    <asp:ListItem Text="Sta Maria" Value="Sta Maria" />
                    <asp:ListItem Text="Mabitac" Value="Mabitac" />
                    <asp:ListItem Text="Kalayaan" Value="Kalayaan" />
                </asp:DropDownList>
                </center>
            </div>
        </div>
        <div class="col-md-12">
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <table class="table table-hover table-responsive-sm">
                        <thead>
                          <tr>
                            <th scope="col">Pharmacy Name</th>
                            <th scope="col">Contact No.</th>
                             <th scope="col">Store Hours</th>
                              <th scope="col">Product Availability</th>
                           </tr>
                         </thead>
                         <tbody>
                            <tr class="table-active">
                            <th scope="row"><%#Eval("storename")%></th>
                            <td><%#Eval("contact")%></td>
                            <td>
                                <%#Eval("storehrs")%>
                            </td>
                                <td>
                                <%#Eval("confirmation")%>
                            </td>
                            </tr>
                        </tbody>
                        </table>
                        <center>
                        <iframe class="embed-responsive" src="<%#Eval("url")%>" height="400" style="border:0;" aria-hidden="false" tabindex="0"></iframe>
                        <hr />
                            <button type="button" data-toggle="modal" data-target="#modalbuy" class="btn btn-primary">Buy Now!</button>
                            </center>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <hr />
        <br />
        <div class="alert alert-dismissible alert-danger" runat="server" id="ohsnap" visible="false">
  <button type="button" class="close" data-dismiss="alert">&times;</button>
  <strong>Oh snap!</strong> <a href="#" class="alert-link">If no Drug Store or Pharmacy Shop showed</a> the product/medicine aren't available!
</div>
    </div>
    <!--Pending Prescription-->
    <div class="container">
        <br />
        <div class="col-md-12">
            <div class="card text-white bg-success">
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <center>
                           <h4>Pending Prescription</h4>
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
                            <asp:GridView class="table table-hover table-responsive-sm" ID="GridView2" runat="server">
                                <EditRowStyle Font-Bold="True" HorizontalAlign="Justify" VerticalAlign="Middle" />
                            </asp:GridView>
                            <center>
                            <asp:Button class="btn btn-danger" runat="server" Text="Delete" OnClick="Unnamed1_Click" data-toggle="tooltip" data-placement="top" title="Use Input Field with Prescription ID to Delete!" />
                            </center>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <a href="Home Page.aspx"><< Back to Home</a><br>
        <br>
    </div>
        <!-- Modal -->
    <div class="modal fade" id="modalbuy" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Product Information</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:Label class="text-success" ID="Label1" runat="server">Recipe (Rx):</asp:Label>
                    <asp:Label ID="rxname" runat="server" Text=""></asp:Label>
                    <asp:Label ID="rxmgtabs" runat="server" Text=""></asp:Label>
                    <br />
                    <asp:Label class="text-success" ID="Label5" runat="server">Signatura (Sig):</asp:Label>
                    <asp:Label ID="signtabs" runat="server" Text=""></asp:Label>
                    <asp:Label ID="signhrs" runat="server" Text=""></asp:Label>
                    <br />
                    <asp:Label class="text-success" ID="Label2" runat="server">Dispensing Instructions (Disp):</asp:Label>
                    <asp:Label ID="di" runat="server" Text=""></asp:Label>
                    <br />
                    <asp:Label class="text-success" ID="Label4" runat="server">Number of Refills (Rf):</asp:Label>
                    <asp:Label ID="refill" runat="server" Text=""></asp:Label>
                </div>
                <div class="modal-footer">
                    <label>BUY NOW?</label>
                    <asp:Button class="btn btn-success" ID="btnyes" runat="server" Text="Yes" OnClick="btnyes_Click" />
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
