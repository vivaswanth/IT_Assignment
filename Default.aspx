<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png" />
	<link rel="icon" type="image/png" href="../assets/img/favicon.png" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Fruit Salads</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />

	<!--     Fonts and icons     -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />

	<!-- CSS Files -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css/material-kit.css" rel="stylesheet"/>
    <link href="assets/css/style.css" rel="stylesheet" />

</head>

<body class="signup-page" style="background-image: url(assets/img/banner.jpg); background-size: cover">
<form id="form1" runat="server">
<div style="background-color: rgba(0,0,0,0.6);">
	<nav class="navbar navbar-transparent navbar-absolute">
    	<div class="container">
        	<!-- Brand and toggle get grouped for better mobile display -->
        	<div class="navbar-header">
        		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example">
            		<span class="sr-only">Toggle navigation</span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
        		</button>
        		<a class="navbar-brand" href="#">Fruit Salads</a>
        	</div>

        	<div class="collapse navbar-collapse" id="navigation-example">
        		<ul class="nav navbar-nav navbar-right">
					<li><a href="#" target="_blank">About</a></li>
    				<li><a href="#" target="_blank">Pricing</a></li>
    				<li><a href="#" target="_blank">Announcements</a></li>
        		</ul>
        	</div>
    	</div>
    </nav>

    <div class="wrapper">
		<div class="header header-filter" style="background-image: url('../assets/img/city.jpg'); background-size: cover; background-position: top center;">
			<div class="container">
				<div class="row">
					<div class="col-sm-5 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>Sign in now</h3>
                            		<p>Only Authorized Managers can Login.</p>
                        		</div>
                        		<div class="form-top-right">
                        			<span aria-hidden="true" class="typcn typcn-pencil"></span>
                        		</div>
                            </div>
                            <div class="form-bottom">
                            	<div class="form-group label-floating has-primary">
									<label class="control-label">Enter your Email</label>
                                    <asp:TextBox runat="server" ID="username" type="email" CssClass="form-control"></asp:TextBox>
								</div>
								<div class="form-group label-floating has-primary">
									<label class="control-label">Your Password</label>
									<asp:TextBox runat="server" ID="password" type="password" CssClass="form-control"></asp:TextBox>
								</div>
                                <asp:CheckBox ID="cb1" runat="server" text=" Remember Password "/>
                                <a href="#" style="margin-left:3%; margin-right:3%">Forgot Password ?</a>
		                        <asp:button ID="signin" Text="Sign in" runat="server" type="submit" class="btn btn-primary" OnClick="login"></asp:button>
		                    </div>
                        </div>
				</div>
			</div>

			<footer class="footer">
		        <div class="container">
		            <nav class="pull-left">
						<ul>
							<li>
								<a href="#">
									Fruits & Salads
								</a>
							</li>
							<li>
								<a href="#">
								   About Us
								</a>
							</li>
							<li>
								<a href="#">
								   Blog
								</a>
							</li>
							<li>
								<a href="#">
									Licenses
								</a>
							</li>
						</ul>
		            </nav>
		            <div class="copyright pull-right">
		                &copy; 2017, made with <i class="fa fa-heart heart"></i> by <a href="#" target="_blank">VV & Abhi & Teja</a>
		            </div>
		        </div>
		    </footer>

		</div>

    </div>

</div>
</form>
</body>
	<!--   Core JS Files   -->
	<script src="assets/js/jquery.min.js" type="text/javascript"></script>
	<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="assets/js/material.min.js"></script>

	<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
	<script src="assets/js/nouislider.min.js" type="text/javascript"></script>

	<!--  Plugin for the Datepicker, full documentation here: http://www.eyecon.ro/bootstrap-datepicker/ -->
	<script src="assets/js/bootstrap-datepicker.js" type="text/javascript"></script>

	<!-- Control Center for Material Kit: activating the ripples, parallax effects, scripts from the example pages etc -->
	<script src="assets/js/material-kit.js" type="text/javascript"></script>

</html>

