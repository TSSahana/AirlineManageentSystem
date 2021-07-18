<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*,javax.servlet.*"%>
<%@ page import="com.connectionFactory.ConnectionFactory"%>
<%
	try {
	int userId = Integer.parseInt(request.getParameter("userId"));
	Connection connection;
	try {
		connection = ConnectionFactory.getConnection();
		Statement st = connection.createStatement();
		int i = st.executeUpdate("DELETE FROM users WHERE userId=" + userId);
	} catch (ClassNotFoundException e1) {
		e1.printStackTrace();
	} catch (SQLException e1) {
		e1.printStackTrace();
	}
	out.println("Data Deleted Successfully!");
} catch (Exception e) {
	System.out.print(e);
	e.printStackTrace();
}
%>