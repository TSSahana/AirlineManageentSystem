<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connectionFactory.ConnectionFactory"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- Bootstrap core CSS -->
<link href="./vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="./css/simple-sidebar.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./css/demo.css" />
</head>
<body>
	<div>
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
					<h3 class="mt-4">Flight Details</h3>
					<hr>
					<!--header-->
					<div class="container-fluid">
						<header>
						<h5>Search Flights</h5>
						<hr>
						</header>
						<!--panel-->
						<div class="col-sm-8 col-sm-offset-2">
							<div class="panel-group">
								<div>
									<div class="formDiv">
										<%
											Connection connection = ConnectionFactory.getConnection();
										String FlightId = request.getParameter("flightId");
										String query = "select FlightName,PlaceFrom, PlaceTo, Flight_class from flightdetails ORDER BY FlightName";
										Statement st = connection.createStatement();
										ResultSet rs = st.executeQuery(query);
										List<String> flightNameList = new ArrayList<String>();
										List<String> flightFromList = new ArrayList<String>();
										List<String> flightToList = new ArrayList<String>();
										while (rs.next()) {
											flightNameList.add(rs.getString(1));
											flightFromList.add(rs.getString(2));
											flightToList.add(rs.getString(3));
										}
										Set<String> flightNameSet = new HashSet<String>(flightNameList);
										Set<String> flightFromSet = new HashSet<String>(flightFromList);
										Set<String> flightToSet = new HashSet<String>(flightToList);
										request.setAttribute("flightNameSet", flightNameSet);
										request.setAttribute("flightFromSet", flightFromSet);
										request.setAttribute("flightToSet", flightToSet);
										%>
										<form method="post" name="frm" action="search">
											<table border="0" width="300" align="center">
												<tr>
													<td><b>Flight Name</b></td>
													<td><select class="form-control trans-input-area"
														id="flightName" placeholder="--select--" name="flightName">
															<option>--select--</option>
															<c:forEach items="${flightNameSet}" var="category">
																<option value="${category}">${category}</option>
															</c:forEach>
													</select></td>
												</tr>
												<tr>
													<td><b>Onward</b></td>
													<td><select class="form-control trans-input-area"
														id="placeFrom" placeholder="--select--" name="placeFrom">
															<option>--select--</option>
															<c:forEach items="${flightFromSet}" var="category">
																<option value="${category}">${category}</option>
															</c:forEach>
													</select></td>
												</tr>
												<tr>
													<td><b>Return</b></td>
													<td><select class="form-control trans-input-area"
														id="placeTo" placeholder="--select--" name="placeTo">
															<option>--select--</option>
															<c:forEach items="${flightToSet}" var="category">
																<option value="${category}">${category}</option>
															</c:forEach>
													</select></td>
												</tr>
												<tr>
													<td><b>Class of Travel</b></td>
													<td><select class="form-control trans-input-area"
														id="class" placeholder="--select--" name="flightClass">
															<option>--select--</option>
															<option>Economy</option>
															<option>Business</option>
															<option>First</option>
													</select></td>
												</tr>
												<tr>
													<td colspan=2 align="center"><input type="submit"
														onclick="return checkFormValidation();" name="submit"
														value="Search"></td>
												</tr>
											</table>
										</form>
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

				function checkFormValidation() {
					var x = document.getElementById("placeFrom").value;
					var y = document.getElementById("placeTo").value;
					var z = document.getElementById("flightName").value;
					if (z == "--select--") {
						alert("Select Flight Name field to search");
						return false;
					} else if (x == "--select--" && y == "--select--") {
						alert("Select Onward field to search");
						return false;
					} else if (x == "--select--" && y != ""
							&& y != "--select--") {
						alert("Select Onward field to search");
						return false;
					} else if (x != "--select--" && x != ""
							&& y == "--select--") {
						alert("Select Return field to search");
						return false;
					} else if (x != "" && y != "" && x != "--select--"
							&& y != "--select--") {
						return true;
					}

				}
			</script>
		</div>
	</div>
</body>
</html>
