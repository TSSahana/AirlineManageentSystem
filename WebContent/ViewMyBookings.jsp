<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connectionFactory.ConnectionFactory"%>
<%@ page import="com.model.PassengerDetails"%>
<%@ page import="com.model.User"%>
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
			<div class="sidebar-heading"></div>
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
				<h3 class="mt-4">My Bookings</h3>
				<hr>

				<!--header-->
				<div class="container-fluid">
					<header>
						<h5>View Bookings</h5>
						<hr>
					</header>
					<!--panel-->
					<div class="col-sm-8 col-sm-offset-2">
						<div class="panel-group">
							<div>
								<div class="panel-body">
									<%
										session.setAttribute("flightId", request.getParameter("id"));
									try {
										Connection connection = ConnectionFactory.getConnection();
										User user = (User) session.getAttribute("user");
										int userId = user.getUserId();
										String getMyBookingsQuery = "select * from mybookings where userId=" + userId;
										List<Integer> bookingIdList = new ArrayList<Integer>();
										List<Integer> flightIdList = new ArrayList<Integer>();
										ArrayList myBookingsDetailsList = new ArrayList();
										System.out.println("getMyBookingsQuery " + getMyBookingsQuery);
										Statement st = connection.createStatement();
										ResultSet rs = st.executeQuery(getMyBookingsQuery);
										int bookingId = 0;
										int flightId = 0;
										while (rs.next()) {
											bookingId = rs.getInt(2);
											flightId = rs.getInt(3);
										}
										bookingIdList.add(bookingId);
										flightIdList.add(flightId);
										String q = "select f.FlightName, f.FlightNo, p.Passenger_name, p.Payment, p.Nationality, p.emailId, p.phoneNo, f.PlaceFrom, f.PlaceTo, f.Prices,f.Flight_class, p.AadharNo, p.PassportNo, m.Booking_date, m.userId, m.mybooking_id, m.Booking_id from flightdetails f, passengerdetails p, mybookings m where f.FlightId=m.flightId and p.Booking_id= m.Booking_id and m.userId="
										+ userId;
										Statement st1 = connection.createStatement();
										ResultSet rs1 = st1.executeQuery(q);
										ArrayList flightdetailsList = null;
										while (rs1.next()) {
											flightdetailsList = new ArrayList();
											flightdetailsList.add(rs1.getString(1));
											flightdetailsList.add(rs1.getString(2));
											flightdetailsList.add(rs1.getString(3));
											flightdetailsList.add(rs1.getString(4));
											flightdetailsList.add(rs1.getString(5));
											flightdetailsList.add(rs1.getString(6));
											flightdetailsList.add(rs1.getString(7));
											flightdetailsList.add(rs1.getString(8));
											flightdetailsList.add(rs1.getString(9));
											flightdetailsList.add(rs1.getString(10));
											flightdetailsList.add(rs1.getString(11));
											flightdetailsList.add(rs1.getString(12));
											flightdetailsList.add(rs1.getString(13));
											flightdetailsList.add(rs1.getString(14));
											flightdetailsList.add(rs1.getString(15));
											flightdetailsList.add(rs1.getString(16));
											flightdetailsList.add(rs1.getString(17));
											System.out.println("al :: " + flightdetailsList);
											myBookingsDetailsList.add(flightdetailsList);
										}
										request.setAttribute("bookingDetailsList", myBookingsDetailsList);
										connection.close();
									} catch (Exception e) {
										e.printStackTrace();
									}
									%>
									<table width="700px" align="center" class="displayTable">
										<tr style="border: 1px solid #000000;">
											<td class="displayTd" colspan=15 align="center"
												style="background-color: grey"><b>Passenger Booking
													Details</b></td>
										</tr>
										<tr style="background-color: grey; border: 1px solid #000000;">
											<td class="displayTd"><b>Flight Name</b></td>
											<td class="displayTd"><b>Flight No</b></td>
											<td class="displayTd"><b>PassengerName</b></td>
											<td class="displayTd"><b>Payment</b></td>
											<td class="displayTd"><b>Nationality</b></td>
											<td class="displayTd"><b>Email Id</b></td>
											<td class="displayTd"><b>PhoneNo</b></td>
											<td class="displayTd"><b>From</b></td>
											<td class="displayTd"><b>To</b></td>
											<td class="displayTd"><b>Prices</b></td>
											<td class="displayTd"><b>Class</b></td>
											<td class="displayTd"><b>Aadhar Number</b></td>
											<td class="displayTd"><b>Passport Number</b></td>
											<td class="displayTd"><b>Booking Date</b></td>
											<td class="displayTd"><b>Cancel Booking</b></td>
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
												request.setAttribute("mybooking_id", bookingDetailsList.get(15));
												request.setAttribute("passengerBookingId", bookingDetailsList.get(16));
										%>
										<tr style="background-color:<%=color%>;">
											<td class="displayTd"><%=bookingDetailsList.get(0)%></td>
											<td class="displayTd"><%=bookingDetailsList.get(1)%></td>
											<td class="displayTd"><%=bookingDetailsList.get(2)%></td>
											<td class="displayTd"><%=bookingDetailsList.get(3)%></td>
											<td class="displayTd"><%=bookingDetailsList.get(4)%></td>
											<td class="displayTd"><%=bookingDetailsList.get(5)%></td>
											<td class="displayTd"><%=bookingDetailsList.get(6)%></td>

											<td class="displayTd"><%=bookingDetailsList.get(7)%></td>
											<td class="displayTd"><%=bookingDetailsList.get(8)%></td>
											<td class="displayTd"><%=bookingDetailsList.get(9)%></td>
											<td class="displayTd"><%=bookingDetailsList.get(10)%></td>
											<td class="displayTd"><%=bookingDetailsList.get(11)%></td>
											<td class="displayTd"><%=bookingDetailsList.get(12)%></td>
											<td class="displayTd"><%=bookingDetailsList.get(13)%></td>
											<td class="displayTd">
												<button
													onclick="cancelBooking(<%=bookingDetailsList.get(15)%>,<%=bookingDetailsList.get(16)%> )">Cancel
													Booking</button>
											</td>
										</tr>
										<%
											}
										}
										%>
										<%
											if (count == 0) {
										%>
										<tr>
											<td class="displayTd" colspan=15 align="center"
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
				function cancelBooking(mybooking_id, passengerBookingId){
					$.ajax({
						url: "CancelBooking.jsp?id="+mybooking_id+"passengerBookingId="+passengerBookingId,
						type: "post",
						data: {
							mybooking_id : mybooking_id,
							passengerBookingId: passengerBookingId
						},
						success : function(data){
						alert(data); // alerts the response from jsp
						location.reload();
						}
						});
				}
			</script>
		</div>
	</div>
</body>
</html>