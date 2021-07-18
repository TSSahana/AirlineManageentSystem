<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- Bootstrap core CSS -->
<link href="./vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./css/style.css" />
<style>
body {
	font-family: Calibri, Helvetica, sans-serif;
	background: #fff url(./images/bg.jpg) repeat top left;
}

input {
	width: 250px;
}

header, h1, h2, h3 {
	text-align: center;
}

hr {
	margin-bottom: 25px;
}

.item1 {
	grid-area: button;
}

.item2 {
	grid-area: title;
}

.item3 {
	grid-area: sidebuttons;
}

.grid-container {
	display: grid;
	grid-template-areas: 'button title sidebuttons';
	grid-template-columns: 100% 150% 40%;
	padding: 10px;
}
</style>
</head>
<body>
	<!-- Page Content -->
	<div id="page-content-wrapper">
		<nav
			class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
		<div class="grid-container">
			<div class="item1">
			</div>
			<div class="item2">
				<div class="sidebar-heading">
					<h2>Airline Management System</h2>
				</div>
			</div>
			<div class="item3">
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ml-auto mt-2 mt-lg-0">
						<li class="nav-item active"><a
							href="http://localhost:8080/AMS/home.jsp" class="nav-link">Home
								<span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="http://localhost:8080/AMS/Login.jsp"> Login</a></li>
					</ul>
				</div>
			</div>
		</div>
		</nav>
		<!-- /#page-content-wrapper -->
		<div>
			<header>
			<h2>Welcome to Airline Management System</h2>
			</header>
			<hr>
			<!--header-->
			<header>
			<h3>Come!! Fly with us to desired places & we'll take care of
				your comfort and safety!!!!</h3>
			<hr>
			</header>
			<!--panel-->
			<div class="col-sm-8 col-sm-offset-2">
				<div class="panel-group">
					<div>
						<div class="panel-body"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
