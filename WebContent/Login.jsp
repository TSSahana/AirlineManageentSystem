<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/signup.css" />
<link rel="stylesheet" type="text/css" href="./css/style.css" />
<link href="./vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<!--background slide image-->
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
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="http://localhost:8080/AMS/Login.jsp"> Login <span
								class="sr-only">(current)</span></a></li>
					</ul>
				</div>
			</div>
		</div>
		</nav>
		<div class="container">
			<hr>
			<div id="container_demo">
				<a class="hiddenanchor" id="toregister"></a> <a class="hiddenanchor"
					id="tologin"></a>
				<div id="wrapper">
					<div id="login" class="animate form">
						<form action="Login" method="post">
							<h1>LOG IN</h1>
							<p>
								<label for="username" class="uname"> Username </label> <input
									id="username" name="uname" required type="text"
									placeholder="Enter First Name" />
							</p>
							<p>
								<label for="password" class="youpasswd"> Password </label> <input
									id="password" name="upass" required type="password"
									placeholder="eg. X8df!90EO" />
							</p>
							<p class="login button">
								<input type="submit" value="Login">
							</p>
							<p class="change_link" style="color: black">
								Not a member yet ? <a
									href="http://localhost:8080/AMS/SignUp.jsp"> SignUp </a>
							</p>
						</form>
					</div>
				</div>
				<hr>
			</div>
		</div>
	</div>
</body>
</html>