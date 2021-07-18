<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- Bootstrap core CSS -->
<link href="./vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="./css/simple-sidebar.css" rel="stylesheet">
<link href="./vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="./css/simple-sidebar.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./css/demo.css" />
</head>
<body>
	<div class="d-flex" id="wrapper">
		<!-- Sidebar -->
		<div class="bg-light border-right" id="sidebar-wrapper">
			<div class="sidebar-heading" style="height: 15%;"></div>
			<div class="list-group list-group-flush">
				<a href="http://localhost:8080/AMS/FlightDetails.jsp"
					class="list-group-item list-group-item-action bg-light">Flight
					Details</a> <a href="http://localhost:8080/AMS/ViewMyBookings.jsp"
					class="list-group-item list-group-item-action bg-light">My
					Bookings</a> <a href="http://localhost:8080/AMS/ContactUs.jsp"
					class="list-group-item list-group-item-action bg-light">Contact
					Us</a>
				<%
					String isAdmin = (String) session.getAttribute("isAdmin");
				if (isAdmin != null && isAdmin.equals("Yes")) {
				%>
				<a href="http://localhost:8080/AMS/Admin.jsp"
					class="list-group-item list-group-item-action bg-light">Admin
					Page</a>
				<%
					}
				%>
			</div>
		</div>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div id="page-content-wrapper">

			<nav
				class="navbar navbar-expand-lg navbar-light bg-light border-bottom">

				<div class="grid-container">
					<div class="item1">
						<button class="btn btn-primary" id="menu-toggle">Toggle
							Menu</button>
						<button class="navbar-toggler" type="button"
							data-toggle="collapse" data-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
					</div>
					<div class="item2">
						<div class="sidebar-heading">
							<h2>Airline Management System</h2>
						</div>
					</div>
					<div class="item3">
						<div class="collapse navbar-collapse" id="navbarSupportedContent">
							<ul class="navbar-nav ml-auto mt-2 mt-lg-0">
								<li class="nav-item nav-link">
									<%
										String n = (String) session.getAttribute("UserName");
									out.print("Welcome " + n);
									%>
								</li>
								<li class="nav-item active"><a
									href="http://localhost:8080/AMS/home.jsp" class="nav-link">Home
										<span class="sr-only">(current)</span>
								</a></li>
								<li class="nav-item"><a class="nav-link"
									href="http://localhost:8080/AMS/Logout.jsp"> Logout</a></li>
							</ul>
						</div>
					</div>
				</div>
			</nav>

			<!-- /#page-content-wrapper -->
			<!--panel-->
			<div class="panel-group panel-transparent">
				<h4 class="mt-4">Contact Information</h4>
				<hr>
				<div class="formDiv">
					<form class="form-horizontal" action="ContactUs" method="post">
						<table border="0" width="300" align="center">
							<tr>
								<td><b> <label for="email">Email</label></b></td>
								<td><input type="text"
									class="textBoxWidth form-control trans-input-area"
									placeholder="Email" maxlength="60" required
									pattern=".+@[a-z].com" title="Example: hello@abc.com"
									name="email" id="email" required></td>
							</tr>
							<tr>
								<td><b> <label for="name">Name</label></b></td>
								<td><input type="text" maxlength="20"
									class="textBoxWidth form-control trans-input-area"
									placeholder="Name" name="name" id="name" required></td>
							</tr>
							<tr>
								<td><b> <label for="Country">Country</label></b></td>
								<td><input type="text" maxlength="20"
									class="textBoxWidth form-control trans-input-area"
									placeholder="Country" name="country" id="Country" required></td>
							<tr>
								<td><b> <label for="subject">Message</label></b>
								<td><textarea id="subject"
										class="textBoxWidth trans-input-area" maxlength="500"
										placeholder="Write something.." required name="message"
										style="height: 200px; width: 100%"></textarea></td>
							</tr>
							<tr>
								<td style="text-align: center">
									<button type="submit" value="Send">
										<i class="glyphicon glyphicon-send"></i> Send
									</button>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<br>
		</div>
		<!-- /#wrapper -->

		<!-- Bootstrap core JavaScript -->
		<script src="./vendor/jquery/jquery.min.js"></script>
		<script src="./vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

		<!-- Menu Toggle Script -->
		<script>
			$("#menu-toggle").click(function(e) {
				e.preventDefault();
				$("#wrapper").toggleClass("toggled");
			});
		</script>
	</div>
</body>
</html>