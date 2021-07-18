<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
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
				<h4 class="mt-4">Admin View Flights</h4>
				<hr>

				<!--header-->
				<div class="container-fluid">
					<header>
						<h5>Manage Flights</h5>
						<hr>
					</header>
					<!--panel-->
					<div class="col-sm-8 col-sm-offset-2">
						<div class="panel-group">
							<div class="formDiv">
								<table width="700px" align="center" class="displayTable">
									<tr style="border: 1px solid #000000;">
										<td class="displayTd" colspan=12 align="center"
											style="background-color: grey"><b>Flight Record</b></td>
									</tr>
									<tr style="background-color: grey; border: 1px solid #000000;">
										<td class="displayTd"><b>Flight Name</b></td>
										<td class="displayTd"><b>Flight No</b></td>
										<td class="displayTd"><b>From</b></td>
										<td class="displayTd"><b>To</b></td>
										<td class="displayTd"><b>Departure Date</b></td>
										<td class="displayTd"><b>Departure Time</b></td>
										<td class="displayTd"><b>Class</b></td>
										<td class="displayTd"><b>Prices</b></td>
										<td class="displayTd"><b>Capacity</b></td>
										<td class="displayTd"><b>Available Seats</b></td>
										<td class="displayTd"><b>Edit Row</b></td>
										<td class="displayTd"><b>Delete Row</b></td>
									</tr>
									<%
										int count = 0;
									String color = "#F9EBB3";

									if (request.getAttribute("viewFlightsList") != null) {
										ArrayList al = (ArrayList) request.getAttribute("viewFlightsList");
										Iterator itr = al.iterator();
										while (itr.hasNext()) {
											if ((count % 2) == 0) {
										color = "#eeffee";
											} else {
										color = "#F9EBB3";
											}
											count++;
											ArrayList empList = (ArrayList) itr.next();
											System.out.println("" + empList);
									%>
									<tr style="background-color:<%=color%>;">
										<td class="displayTd"><%=empList.get(1)%></td>
										<td class="displayTd"><%=empList.get(2)%></td>
										<td class="displayTd"><%=empList.get(3)%></td>
										<td class="displayTd"><%=empList.get(4)%></td>
										<td class="displayTd"><%=empList.get(5)%></td>
										<td class="displayTd"><%=empList.get(6)%></td>
										<td class="displayTd"><%=empList.get(8)%></td>
										<td class="displayTd"><%=empList.get(7)%></td>
										<td class="displayTd"><%=empList.get(9)%></td>
										<td class="displayTd"><%=empList.get(10)%></td>
										<td class="displayTd"><button>
												<a
													href="AddAndUpdateFlights.jsp?flightId=<%=empList.get(0)%>">Edit</a>
											</button></td>
										<td class="displayTd"><button
												onclick="deleteFlightRecord(<%=empList.get(0)%>)">Delete</button></td>
									</tr>
									<%
										}
									}
									%>
									<%
										if (count == 0) {
									%>
									<tr>
										<td class="displayTd" colspan=12 align="center"
											style="background-color: eeffee"><b>No Record</b></td>
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
				
				function deleteFlightRecord(flightId){
					$.ajax({
						url: "AdminDeleteFlights.jsp?flightId="+flightId,
						type: "post",
						data: {
							flightId : flightId,
						},
						success : function(data){
						alert(data); // alerts the response from jsp
						location.reload();
						}
						});
				}
			</script>
	</div>
</body>
</html>