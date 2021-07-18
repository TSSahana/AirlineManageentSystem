<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connectionFactory.ConnectionFactory"%>
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
				<h4 class="mt-4">Manage Users</h4>
				<hr>

				<!--header-->
				<div class="container-fluid">
					<header>
						<h5>View Users</h5>
						<hr>
					</header>
					<!--panel-->
					<div class="col-sm-8 col-sm-offset-2">
						<div class="panel-group">
							<div>
								<div class="formDiv">
									<table width="700px" align="center" class="displayTable">
										<tr style="border: 1px solid #000000;">
											<td class="displayTd" colspan=12 align="center"
												style="background-color: grey"><b>Contact Us
													Records</b></td>
										</tr>
										<tr style="background-color: grey; border: 1px solid #000000;">
											<!-- 												<td class="displayTd"><b>ContactUs Id</b></td> -->
											<td class="displayTd"><b>FirstName</b></td>
											<td class="displayTd"><b>LastName</b></td>
											<td class="displayTd"><b>Email</b></td>
											<td class="displayTd"><b>Password</b></td>
											<td class="displayTd"><b>PhoneNo</b></td>
											<td class="displayTd"><b>isAdmin</b></td>
											<td class="displayTd"><b>Country</b></td>
											<td class="displayTd"><b>Address</b></td>
											<td class="displayTd"><b>Delete Row</b></td>
										</tr>
										<%
											ArrayList usersDetailsList = null;
										ArrayList usersList = new ArrayList();
										try {
											Connection connection = ConnectionFactory.getConnection();
											String getContactUsQuery = "select * from users";
											Statement st = connection.createStatement();
											ResultSet rs1 = st.executeQuery(getContactUsQuery);
											while (rs1.next()) {
												usersDetailsList = new ArrayList();
												usersDetailsList.add(rs1.getString(1));
												usersDetailsList.add(rs1.getString(2));
												usersDetailsList.add(rs1.getString(3));
												usersDetailsList.add(rs1.getString(4));
												usersDetailsList.add(rs1.getString(6));
												usersDetailsList.add(rs1.getString(7));
												usersDetailsList.add(rs1.getString(8));
												usersDetailsList.add(rs1.getString(9));
												usersDetailsList.add(rs1.getString(10));//read single column in row1
												usersList.add(usersDetailsList);//read single row1
											}
											request.setAttribute("usersList", usersList);
										} catch (Exception e) {
											e.printStackTrace();
										}

										int count = 0;
										String color = "#F9EBB3";

										if (request.getAttribute("usersList") != null) {
											ArrayList al = (ArrayList) request.getAttribute("usersList");
											Iterator itr = al.iterator();
											while (itr.hasNext()) {
												if ((count % 2) == 0) {
											color = "#eeffee";
												} else {
											color = "#F9EBB3";
												}
												count++;
												ArrayList msgList = (ArrayList) itr.next();
												System.out.println("" + msgList);
												request.setAttribute("userId", msgList.get(0));
										%>
										<tr style="background-color:<%=color%>;">
											<%-- 												<td class="displayTd"><%=msgList.get(0)%></td> --%>
											<td class="displayTd"><%=msgList.get(1)%></td>
											<td class="displayTd"><%=msgList.get(2)%></td>
											<td class="displayTd"><%=msgList.get(3)%></td>
											<td class="displayTd"><%=msgList.get(4)%></td>
											<td class="displayTd"><%=msgList.get(5)%></td>
											<td class="displayTd"><%=msgList.get(6)%></td>
											<td class="displayTd"><%=msgList.get(7)%></td>
											<td class="displayTd"><%=msgList.get(8)%></td>
											<td class="displayTd"><button
													onclick="deleteUsers(<%=msgList.get(0)%>)">Delete</button></td>
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
				
				function deleteUsers(userId){
					$.ajax({
						url: "AdminDeleteUsers.jsp?userId="+userId,
						type: "post",
						data: {
							userId : userId,
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