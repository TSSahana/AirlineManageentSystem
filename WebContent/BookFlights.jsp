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
			<div class="container-fluid">
				<h4 class="mt-4">Book Flights</h4>
				<hr>

				<!--header-->
				<div class="container-fluid">
					<header>
						<h5>Enter passenger details to book the selected flight!</h5>
						<hr>
					</header>
					<!--panel-->
					<div class="col-sm-8 col-sm-offset-2">
						<div class="panel-group">
							<div>
								<div class="formDiv">
									<%
										session.setAttribute("flightId", request.getParameter("id"));
									%>
									<form class="form-inline" action="bookflights" method="post">
										<table>
											<tr class="input-group">
												<td><label for="passengerName">Passenger Name</label></td>
												<td><input type="text"
													class="form-control trans-input-area"
													placeholder="Passenger Name" name="passengerName"
													id="passengerName" required></td>
											</tr>
											<tr class="input-group">
												<td><label for="age">Age</label></td>
												<td><input type="number" min="1"
													pattern="/^-?\d+\.?\d*$/"
													onKeyPress="if(this.value.length==3) return false;"
													class="form-control trans-input-area" placeholder="Age"
													name="age" id="age" required></td>
											</tr>
											<tr class="input-group">
												<td><label>Gender</label></td>
												<td><input class="form-control trans-input-area"
													type="radio" name="gender" value="male"> Male <input
													class="form-control trans-input-area" type="radio"
													name="gender" value="female"> Female</td>
											</tr>
											<tr class="input-group">
												<td><label for="to">Nationality</label></td>
												<td><input type="text" min="1"
													class="form-control trans-input-area"
													placeholder="Nationality" name="nationality" id="to"
													required></td>
											</tr>
											<tr class="input-group">
												<td><label for="PhoneNumber">Phone Number</label></td>
												<td><input type="number"
													class="form-control trans-input-area" id="phoneNo"
													name="phoneNo" min="1" pattern="/^-?\d+\.?\d*$/"
													onKeyPress="if(this.value.length==10) return false;"
													required placeholder="Phone Number"></td>
											</tr>
											<tr class="input-group">
												<td><label for="EmailId">Email Id</label></td>
												<td><input type="text"
													class="form-control trans-input-area" id="emailId"
													name="emailId" min="1" maxlength="30" required
													pattern=".+@[a-z].com" placeholder="Email Id"></td>
											</tr>
											<tr class="input-group">
												<td><label for="AadharNo">Aadhar Number</label></td>
												<td><input type="number"
													class="form-control trans-input-area" id="aadharNo"
													name="aadharNo" min="1" pattern="/^-?\d+\.?\d*$/"
													onKeyPress="if(this.value.length==12) return false;"
													required placeholder="Aadhar Number"></td>
											</tr>
											<tr class="input-group">
												<td><label for="PassportNo">Passport Number</label></td>
												<td><input type="text"
													class="form-control trans-input-area" id="passportNo"
													name="passportNo" min="1" maxlength="8" required
													placeholder="Passport Number"></td>
											</tr>
											<tr class="input-group">
												<td><label>Payment</label></td>
												<td><select class="form-control trans-input-area"
													id="class" name="payment" placeholder="--select--">
														<option>Yes</option>
														<option>No</option>
												</select></td>
											</tr>
											<tr class="input-group">
												<td></td>
												<td>
													<button type="submit" value="SignUp">Book Flight</button>
												</td>
											</tr>
										</table>
									</form>
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