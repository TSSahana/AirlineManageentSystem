<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
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
			<div class="container-fluid">
				<h3 class="mt-4">
					<%
						String admin = (String) session.getAttribute("UserName");
					out.print("Welcome Admin : " + admin);
					%>
				</h3>
				<h4 class="mt-4" style="text-align: left">Manage Flights</h4>
				<hr>

				<!--header-->
				<div class="container-fluid">
					<!--panel-->
					<div class="col-sm-4 col-sm-offset-2">
						<div class="panel-group">
							<div>
								<div class="panel-body">
									<a href="http://localhost:8080/AMS/AddAndUpdateFlights.jsp"
										class="list-group-item list-group-item-action bg-light">Add
										Flights</a>
									<form action="ViewFlights" method="post">
										<button
											class="list-group-item list-group-item-action bg-light">Manage
											Flights</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>

				<h4 class="mt-4" style="text-align: left">Manage Users</h4>
				<hr>

				<!--header-->
				<div class="container-fluid">
					<!--panel-->
					<div class="col-sm-4 col-sm-offset-2">
						<div class="panel-group">
							<div>
								<div class="panel-body">
									<a href="http://localhost:8080/AMS/ManageUsers.jsp"
										class="list-group-item list-group-item-action bg-light">Manage
										Users</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<h4 class="mt-4" style="text-align: left">View Queries from
					Users</h4>
				<hr>
				<!--header-->
				<div class="container-fluid">
					<!--panel-->
					<div class="col-sm-4 col-sm-offset-2">
						<div class="panel-group">
							<div>
								<div class="panel-body">
									<a href="http://localhost:8080/AMS/ManageMessages.jsp"
										class="list-group-item list-group-item-action bg-light">View
										Messages</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
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
