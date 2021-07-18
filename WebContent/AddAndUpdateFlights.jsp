<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connectionFactory.ConnectionFactory"%>
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
			<div class="container-fluid">
				<h4 class="mt-4">Admin Manage Flights</h4>
				<hr>

				<!--header-->
				<div class="container-fluid">
					<!--panel-->
					<div class="col-sm-8 col-sm-offset-2">
						<div class="panel-group">
							<div>
								<div class="formDiv">
									<%
										if (request.getParameter("flightId") == null) {
									%>
									<header>
										<h5>Add flights details</h5>
										<hr>
									</header>
									<form action="addflights" method="post">
										<table>
											<tr class="input-group">
												<td><label for="from">Flight Number</label></td>
												<td><input type="text"
													class="form-control trans-input-area"
													placeholder="Flight Number" name="flightNumber"
													id="flightNumber" required></td>
											</tr>
											<tr class="input-group">
												<td><label for="from">Flight Name</label></td>
												<td><input type="text"
													class="form-control trans-input-area"
													placeholder="Flight Name" name="flightName" id="flightName"
													required></td>
											</tr>
											<tr class="input-group">
												<td><label for="from">From</label></td>
												<td><input type="text"
													class="form-control trans-input-area"
													placeholder="Destination From" name="destinationFrom"
													id="destinationFrom" required></td>
											</tr>
											<tr class="input-group">
												<td><label for="from">To</label></td>
												<td><input type="text"
													class="form-control trans-input-area"
													placeholder="Destination To" name="destinationTo"
													id="destinationTo" required></td>
											</tr>
											<tr class="input-group">
												<td><label for="departureDate">Departure Date</label></td>
												<td><input type="date" class="form-control"
													name="departureDate" name="date1" min="2020-12-15"
													id="departureDate" required></td>
											</tr>
											<tr class="input-group">
												<td><label for="departureTime">Departure Time</label></td>
												<td><input type="time" class="form-control"
													name="departureTime" id="departureTime"></td>
											</tr>
											<tr class="input-group">
												<td><label for="flightClass">Flight Class</label></td>
												<td><select id="flightClass" name="flightClass"
													class="form-control">
														<option>--select--</option>
														<option>Economy</option>
														<option>Business</option>
														<option>First</option>
												</select></td>
											</tr>
											<tr class="input-group">
												<td><label for="prices">Price</label></td>
												<td><input type="text"
													class="form-control trans-input-area" id="price"
													name="price" required placeholder="Price"></td>
											</tr>
											<tr class="input-group">
												<td><label for="capacity">Capacity</label></td>
												<td><input type="text"
													class="form-control trans-input-area" id="capacity"
													name="capacity" required placeholder="Seat Capacity"></td>
											</tr>
											<tr class="input-group">
												<td><label for="availableSeats">Available Seats</label></td>
												<td><input type="text"
													class="form-control trans-input-area" id="availableSeats"
													name="availableSeats" required
													placeholder="Available Seats"></td>
											</tr>
											<tr class="input-group">
												<td></td>
												<td>
													<button type="submit" value="SignUp">Add Flight</button>
												</td>
											</tr>
										</table>
									</form>
									<%
										} else {
									Connection connection = ConnectionFactory.getConnection();
									String FlightId = request.getParameter("flightId");
									String query = "select * from flightdetails where FlightId = " + FlightId;
									Statement st = connection.createStatement();
									ResultSet rs = st.executeQuery(query);
									while (rs.next()) {
									%>
									<header>
										<h5>Edit flights details</h5>
										<hr>
									</header>
									<form class="form-inline" action="updateflights" method="post">
										<table>
											<tr class="input-group">
												<td><label for="from">Flight Id</label></td>
												<td><input type="text" readonly
													class="form-control trans-input-area"
													value="<%=rs.getString("FlightId")%>"
													placeholder="Flight Id" name="flightId" id="flightId"
													required></td>
											</tr>
											<tr class="input-group">
												<td><label for="from">Flight Number</label></td>
												<td><input type="text"
													class="form-control trans-input-area"
													value="<%=rs.getString("FlightNo")%>"
													placeholder="Flight Number" name="flightNumber"
													id="flightNumber" required></td>
											</tr>
											<tr class="input-group">
												<td><label for="from">Flight Name</label></td>
												<td><input type="text"
													value="<%=rs.getString("FlightName")%>"
													class="form-control trans-input-area"
													placeholder="Flight Name" name="flightName" id="flightName"
													required></td>
											</tr>
											<tr class="input-group">
												<td><label for="from">From</label></td>
												<td><input type="text"
													value="<%=rs.getString("PlaceFrom")%>"
													class="form-control trans-input-area"
													placeholder="Destination From" name="destinationFrom"
													id="destinationFrom" required></td>
											</tr>
											<tr class="input-group">
												<td><label for="from">To</label></td>
												<td><input type="text"
													value="<%=rs.getString("PlaceTo")%>"
													class="form-control trans-input-area"
													placeholder="Destination To" name="destinationTo"
													id="destinationTo" required></td>
											</tr>
											<tr class="input-group">
												<td><label for="departureDate">Departure Date</label></td>
												<td><input type="date" class="form-control"
													value="<%=rs.getString("Departure_date")%>"
													name="departureDate" min="2020-12-15" id="departureDate"
													required></td>
											</tr>
											<tr class="input-group">
												<td><label for="departureTime">Departure Time</label></td>
												<td><input type="time" class="form-control"
													value="<%=rs.getString("Departure_time")%>"
													name="departureTime" id="departureTime"></td>
											</tr>
											<tr class="input-group">
												<td><label for="flightClass">Flight Class</label></td>
												<td><select id="flightClass" name="flightClass"
													required class="form-control">
														<option><%=rs.getString("Flight_class")%></option>
														<option>--select--</option>
														<option>Economy</option>
														<option>Business</option>
														<option>First</option>
												</select></td>
											</tr>
											<tr class="input-group">
												<td><label for="prices">Price</label></td>
												<td><input type="text"
													value="<%=rs.getString("Prices")%>"
													class="form-control trans-input-area" id="price"
													name="price" required placeholder="Price"></td>
											</tr>
											<tr class="input-group">
												<td><label for="capacity">Capacity</label></td>
												<td><input type="text"
													value="<%=rs.getString("Capacity")%>"
													class="form-control trans-input-area" id="capacity"
													name="capacity" required placeholder="Seat Capacity"></td>
											</tr>
											<tr class="input-group">
												<td><label for="availableSeats">Available Seats</label></td>
												<td><input type="text"
													value="<%=rs.getString("Available_seats")%>"
													class="form-control trans-input-area" id="availableSeats"
													name="availableSeats" required
													placeholder="Available Seats"></td>
											</tr>
											<tr class="input-group">
												<td></td>
												<td>
													<button type="submit" value="SignUp">Update Flight</button>
												</td>
											</tr>
										</table>
									</form>
									<%
										}
									}
									%>
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