<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/signup.css" />
<link href="./vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
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
		<div id="container_demo" style="color: black !important">
			<!--background slide image-->
			<div id="wrapper">
				<div id="login" class="animate form">
					<form action="SignUp" method="post">
						<hr>
						<h3>USER SIGN UP</h3>
						<hr>
						<table border="0" cellpadding="5" cellspacing="0" width="500"
							align="center">
							<tr>
								<td><b>First Name*:</b></td>
								<td><input id="FirstName" name="firstName"
									placeholder="First Name" type="text" maxlength="60" required /></td>
							</tr>
							<tr>
								<td><b>Last Name*:</b></td>
								<td><input id="LastName" name="lastName"
									placeholder="Last Name" type="text" maxlength="60" required /></td>
							</tr>
							<tr>
								<td><b>Email address*:</b></td>
								<td><input id="email" placeholder="Email Address"
									name="email" type="text" maxlength="60" required
									title="Example: hello@abc.com" /></td>
							</tr>
							<tr>
								<td><b>Phone*:</b></td>
								<td><input id="phoneNumber" name="phoneNumber" required
									title="Enter 10 digits mobile number"
									placeholder="Phone Number" type="text" maxlength="10" /></td>
							</tr>
							<tr>
								<td><b>Address*:</b></td>
								<td><input id="Address1" name="address" required
									placeholder="Address" type="text" maxlength="200"
									style="width: 250px; height: 50px; border: 1px solid #999999" /></td>
							</tr>
							<tr>
								<td><b>Country*:</b></td>
								<td><input id="Country" name="country" required
									placeholder="Country" type="text" maxlength="120" /></td>
							</tr>
							<tr>
								<td><b>Password*:</b></td>
								<td><input type="password" placeholder="Enter Password"
									name="password" maxlength="200" id="password" required required /></td>
							</tr>
							<tr>
								<td><b>Confirm Password*:</b></td>
								<td><input type="password" placeholder="Confirm Password"
									required name="confirmPassword" maxlength="200"
									id="confirmPassword" required /></td>
							</tr>
							<tr>
								<td>
									<button type="submit" value="SignUp"
										onclick="return checkFormValidation();">SignUp</button>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<hr>
			<script>
				function checkFormValidation() {
					var password = document.getElementById("password").value;
					var confirmPassword = document
							.getElementById("confirmPassword").value;
					if (password != confirmPassword) {
						alert("Password(s) does not match");
						return false;
					}
				}
			</script>
		</div>
	</div>
</body>
</html>