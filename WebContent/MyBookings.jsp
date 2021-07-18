<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<body>
	<!-- Bootstrap core CSS -->
	<link href="./vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<!-- Custom styles for this template -->
	<link href="./css/simple-sidebar.css" rel="stylesheet">
	<style type="text/css">
label {
	width: 140px;
	display: inline-block;
	text-align: center;
	color: white;
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
	grid-template-columns: 50% 80% 40%;
	padding: 10px;
}

.background-wrapper {
	background-color: #000;
	background-size: cover;
	background-position: center;
}
</style>
</head>
<body>
	<div class="background-wrapper"
		style="background-image: url(./images/A4.jpg);">
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
					<a href="/AirlineManagementSystem/contact"
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
				<div class="container-fluid">
					<h4 class="mt-4">View Bookings</h4>
					<hr>

					<!--header-->
					<div class="container-fluid">
						<!--panel-->
						<div class="col-sm-8 col-sm-offset-2">
							<div class="panel-group">
								<div>
									<div class="panel-body">
										<%
											session.setAttribute("flightId", request.getParameter("id"));
										%>
										<table width="700px" align="center"
											style="border: 1px solid #000000;">
											<tr style="border: 1px solid #000000;">
												<td colspan=15 align="center" style="background-color: grey"><b>Passenger
														Flight Booking Details</b></td>
											</tr>
											<tr
												style="background-color: grey; border: 1px solid #000000;">
												<td><b>Flight Name</b></td>
												<td><b>Flight No</b></td>
												<td><b>From</b></td>
												<td><b>To</b></td>
												<td><b>Prices</b></td>
												<td><b>Class</b></td>
												<td><b>PassengerName</b></td>
												<td><b>Age</b></td>
												<td><b>Gender</b></td>
												<td><b>Nationality</b></td>
												<td><b>PhoneNo</b></td>
												<td><b>Email Id</b></td>
												<td><b>Aadhar Number</b></td>
												<td><b>Passport Number</b></td>
												<td><b>Payment</b></td>
											</tr>
											<%
												int count = 0;
											String color = "#F9EBB3";

											if (request.getAttribute("bookingDetailsList") != null) {
												ArrayList al = (ArrayList) request.getAttribute("bookingDetailsList");
												Iterator itr = al.iterator();
												while (itr.hasNext()) {
													if ((count % 2) == 0) {
												color = "#eeffee";
													} else {
												color = "#F9EBB3";
													}
													count++;
													ArrayList bookingDetailsList = (ArrayList) itr.next();
													System.out.println("" + bookingDetailsList);
											%>
											<tr style="background-color:<%=color%>;">
												<td><%=bookingDetailsList.get(1)%></td>
												<td><%=bookingDetailsList.get(2)%></td>
												<td><%=bookingDetailsList.get(3)%></td>
												<td><%=bookingDetailsList.get(4)%></td>
												<td><%=bookingDetailsList.get(9)%></td>
												<td><%=bookingDetailsList.get(10)%></td>

												<td><%=bookingDetailsList.get(15)%></td>
												<td><%=bookingDetailsList.get(16)%></td>
												<td><%=bookingDetailsList.get(19)%></td>
												<td><%=bookingDetailsList.get(20)%></td>
												<td><%=bookingDetailsList.get(22)%></td>
												<td><%=bookingDetailsList.get(17)%></td>
												<td><%=bookingDetailsList.get(21)%></td>
												<td><%=bookingDetailsList.get(23)%></td>
												<td><%=bookingDetailsList.get(18)%></td>
											</tr>
											<%
												}
											}
											%>
											<%
												if (count == 0) {
											%>
											<tr>
												<td colspan=15 align="center"
													style="background-color: eeffee"><b>No Records
														found</b></td>
											</tr>
											<%
												}
											%>
										</table>
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
	</div>
</body>
</html>