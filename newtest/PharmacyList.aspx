<%@ Page Title="Drug Store or Pharmacy List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PharmacyList.aspx.cs" Inherits="newtest.PharmacyList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="col-md-12">
        <div class="col-md-12">
            <h3>List Of Drug Store or Pharmacy</h3>
            <div class="form-group">
                <center>
                <asp:DropDownList style="text-indent: 0px;width: 130px;" class="form-control custom-select" ID="citylist" runat="server" AutoPostBack="True" OnSelectedIndexChanged="citylist_SelectedIndexChanged">
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
                           </tr>
                         </thead>
                         <tbody>
                            <tr class="table-active">
                            <th scope="row"><%#Eval("storename")%></th>
                            <td><%#Eval("contact")%></td>
                            <td>
                                <%#Eval("storehrs")%>
                            </td>
                            </tr>
                        </tbody>
                        </table>
                        <center>
                            <h5><%#Eval("address")%> <%#Eval("town")%>, Laguna</h5>
                        <iframe class="embed-responsive" src="<%#Eval("url")%>" height="400" style="border:0;" aria-hidden="false" tabindex="0"></iframe>
                    </center>
                    <hr />
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

</asp:Content>
