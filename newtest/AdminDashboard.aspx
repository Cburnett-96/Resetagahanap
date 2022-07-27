<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="newtest.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <center><h1 class="text-success">Dashboard</h1></center>
    <ul class="nav nav-tabs justify-content-center" id="myTab">
        <li class="nav-item">
            <a class="nav-link active" data-toggle="tab" href="#total">Total Member</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#gender">Gender</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#age">Age</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#town">Town</a>
        </li>
    </ul>
    <div id="myTabContent" class="tab-content">
        <div class="tab-pane fade active show" id="total">
            <div class="container">
                <br />
                <div class="col-md-12">
                    <h2>Total Member</h2>
                    <div class="card bg-success">
                        <asp:GridView class="table" ID="GridViewtotalmember" runat="server">
                            <EditRowStyle Font-Bold="True" HorizontalAlign="Justify" VerticalAlign="Middle" />
                        </asp:GridView>
                        <asp:GridView class="table" ID="GridViewdoctor" runat="server">
                            <EditRowStyle Font-Bold="True" HorizontalAlign="Justify" VerticalAlign="Middle" />
                        </asp:GridView>
                        <asp:GridView class="table" ID="GridViewpharmacy" runat="server">
                            <EditRowStyle Font-Bold="True" HorizontalAlign="Justify" VerticalAlign="Middle" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
            <br />
            <div class="container">
                <div class="row">
                    <div class="col-md-12 mx-auto">
                        <center>
                    <img src="imgs/banner.png" />
                    <h5>
                        A Responsive Web Application for Medicine Prescription Digitalization and Drugstore Locator
                    </h5>
                </center>
                    </div>
                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="gender">
            <div class="container">
                <br />
                <div class="col-md-12">
                    <h3>Patient Gender Distribution</h3>
                    <div class="card bg-success">
                        <asp:GridView class="table" ID="GridViewNormalUser" runat="server">
                            <EditRowStyle Font-Bold="True" HorizontalAlign="Justify" VerticalAlign="Middle" />
                        </asp:GridView>
                    </div>
                    <center>
                    <asp:Chart ID="Chart1" runat="server">
                        <Legends>
                            <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default"
                                LegendStyle="Row" />
                        </Legends>
                        <Series>
                            <asp:Series Name="Default"></asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1" BorderWidth="0"></asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                        </center>
                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="age">
            <div class="container">
                <br />
                <div class="col-md-12">
                    <center>
                        <h2>Patient Age Distribution</h2>
                        <div class="card bg-success">
                <asp:GridView class="table" ID="GridViewAge" runat="server">
                 <EditRowStyle Font-Bold="True" HorizontalAlign="Justify" VerticalAlign="Middle" />
                </asp:GridView>
                            </div>
                </center>
                    <center>
                    <asp:Chart ID="Chart2" runat="server">
                        <Legends>
                            <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default"
                                LegendStyle="Row" />
                        </Legends>
                        <Series>
                            <asp:Series Name="Age"></asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea2" BorderWidth="0">
                                <AxisX Title="Years">
                            <MajorGrid Enabled="false" />
                        </AxisX>
                                <AxisY Title="Number of Patient">
                            <MajorGrid Enabled="false" />
                        </AxisY>
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                        </center>
                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="town">
            <div class="container">
                <br />
                <div class="col-md-12">
                    <center>
                        <h2>Town Distribution</h2>
                    <asp:Chart ID="Chart3" runat="server">
                        <Series>
                            <asp:Series Name="Default"></asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea3" BorderWidth="0"></asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                        </center>
                    <div class="card bg-success">
                        <asp:GridView class="table" ID="GridViewTown" runat="server">
                            <EditRowStyle Font-Bold="True" HorizontalAlign="Justify" VerticalAlign="Middle" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <a href="AdminHomePage.aspx"><< Back to Home</a>
    <br>
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
