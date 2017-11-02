<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png" />
    <link rel="icon" type="image/png" href="assets/img/favicon.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Manager Dashboard</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <!--  Material Dashboard CSS    -->
    <link href="assets/css/material-dashboard.css?v=1.2.0" rel="stylesheet" />
    
    <link href="assets/css/icons.css" rel="stylesheet" />
    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
    
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-transparent navbar-absolute">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#">Welcome <%:Session["username"]%>!</a>
                    </div>
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <a href="Logout.aspx" class="dropdown-toggle">
                                    <i class="material-icons">power_settings_new</i>
                                    <p class="hidden-lg hidden-md">Profile</p>Logout
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

        <div class="container card col-md-12" style="margin-top:5%">
            <div class="row">
                <asp:RadioButtonList ID="rbl1" runat="server" Height="18px" Width="160px" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rbl1_SelectedIndexChanged">
                    <asp:ListItem> View Bills </asp:ListItem>
                    <asp:ListItem> New Orders </asp:ListItem>
                </asp:RadioButtonList>
                
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                
                <asp:Panel runat="server" ID="panel1">
                    <div class="col-md-6">
                    <h2>New Orders</h2>
                    <asp:SqlDataSource ID="sql1" runat="server" ConnectionString="<%$ ConnectionStrings:constring %>" SelectCommand="Select Distinct(Ptype) from Products"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="Sql2" runat="server" ConnectionString="<%$ ConnectionStrings:constring %>" SelectCommand="Select Pname from Products where Ptype = @ptype1">
                        <SelectParameters>
                            <asp:ControlParameter  Name="ptype1" ControlID="item1" PropertyName="SelectedItem.Text"/>
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="Sql3" runat="server" ConnectionString="<%$ ConnectionStrings:constring %>" SelectCommand="Select Pname from Products where Ptype = @ptype2">
                        <SelectParameters>
                            <asp:ControlParameter  Name="ptype2" ControlID="item2" PropertyName="SelectedItem.Text"/>
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="Sql4" runat="server" ConnectionString="<%$ ConnectionStrings:constring %>" SelectCommand="Select * from Sales"></asp:SqlDataSource>
                    <!--<div
                        <asp:Label ID="lblTime" runat="server" />
                        <asp:Timer runat="server" ID="timer" OnTick="Get_time" Interval="1000"></asp:Timer>
                    </div>-->
                    <div class="form-group label-floating has-primary col-md-6">
				        <label class="control-label">Enter Customer Name</label>
                        <asp:TextBox runat="server" ID="CName" type="text" CssClass="form-control"></asp:TextBox>
			        </div>

                    <div class="form-group label-floating has-primary col-md-6">
				        <label class="control-label">Enter Customer Mobile</label>
                        <asp:TextBox runat="server" ID="CMob" type="text" CssClass="form-control"></asp:TextBox>
			        </div>

                    <div class="form-group label-floating has-primary col-md-6">
                        <asp:DropDownList runat="server" ID="item1" type="text" CssClass="form-control" DataSourceID="sql1" DataTextField="Ptype" AppendDataBoundItems = "true" AutoPostBack="true" EnableViewState="true">
                            <asp:ListItem Text="Please select" Value="" />
                        </asp:DropDownList>
			        </div>

                    <div class="form-group label-floating has-primary col-md-6">
                        <asp:DropDownList runat="server" ID="item2" type="text" CssClass="form-control" DataSourceID="sql1" DataTextField="Ptype" AppendDataBoundItems = "true" AutoPostBack="true" EnableViewState="true">
                            <asp:ListItem Text="Please select" Value="" />
                        </asp:DropDownList>
			        </div>

                    <div class="form-group label-floating has-primary col-md-6">
                        <label class="control-label">item1</label>                        
                        <asp:CheckBoxList runat="server" ID="ci1" DataSourceID="sql2" DataTextField="Pname">
                        </asp:CheckBoxList>
                    </div>
                    
                    <div class="form-group label-floating has-primary col-md-6">
                        <label class="control-label">item2</label>
                        <asp:CheckBoxList runat="server" ID="ci2" DataSourceID="sql3" DataTextField="Pname">
                        </asp:CheckBoxList>
                    </div>

                    <div class="form-group label-floating has-primary col-md-6">
                        <label class="control-label">Payment Mode</label>
                        <asp:RadioButtonList runat="server" ID="rbl" >
                            <asp:ListItem>Cash</asp:ListItem>
                            <asp:ListItem>Paytm</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>

                    <div class="form-group label-floating has-primary col-md-6">
                        <label class="control-label">Quantity</label>
                        <asp:TextBox runat="server" ID="qty" TextMode="Number" CssClass="form-control" Text="1">  
                        </asp:TextBox>
                    </div>

                    <asp:Button runat="server" ID="bill" CssClass="btn btn-primary" Text="Show bill" OnClick="display_price"/>
                    <asp:Button runat="server" ID="submit" CssClass="btn btn-success" Text="Payment done" OnClick="payment_done"/>
                    </div>

                    <div class="col-md-6">
                        <h2>Issue Bills</h2>
                        <h3 class="text-center">Summary of order - Bill</h3>
                        <asp:Label runat="server" ID="lbl1"></asp:Label>
                    </div>
                </asp:Panel>

                <asp:Panel runat="server" ID="panel2" CssClass="col-md-8">
                    <div class="container card margin">
                        <h2>Past orders</h2>
                        <asp:GridView runat="server" AllowPaging="true" PageSize="5" CssClass="table table-bordered table-striped" ID="grid1" AutoGenerateColumns="true" DataSourceID="sql4" EnableSortingAndPagingCallbacks="true"></asp:GridView>
                    </div>            
                </asp:Panel>

                </ContentTemplate>
                </asp:UpdatePanel>
            </div>           
        </div>
        
        
   
    </form>
</body>

    <!--   Core JS Files   -->
<script src="assets/js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
<script src="assets/js/material.min.js" type="text/javascript"></script>
<!--  Charts Plugin -->
<script src="assets/js/chartist.min.js"></script>
<!--  Dynamic Elements plugin -->
<script src="assets/js/arrive.min.js"></script>
<!--  PerfectScrollbar Library -->
<script src="assets/js/perfect-scrollbar.jquery.min.js"></script>
<!--  Notifications Plugin    -->
<script src="assets/js/bootstrap-notify.js"></script>
<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!-- Material Dashboard javascript methods -->
<script src="assets/js/material-dashboard.js?v=1.2.0"></script>

</html>