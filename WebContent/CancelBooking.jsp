<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ page import="com.connectionFactory.ConnectionFactory"%>
<%
	try {
	int mybooking_id = Integer.parseInt(request.getParameter("mybooking_id"));
	int passengerBookingId = Integer.parseInt(request.getParameter("passengerBookingId"));
	Connection connection;
	try {
		connection = ConnectionFactory.getConnection();
		Statement st = connection.createStatement();
		int i = st.executeUpdate("DELETE FROM mybookings WHERE mybooking_id=" + mybooking_id);
		Statement st1 = connection.createStatement();
		int i1 = st1.executeUpdate("DELETE FROM passengerdetails WHERE Booking_id=" + passengerBookingId);
	} catch (ClassNotFoundException e1) {
		e1.printStackTrace();
	} catch (SQLException e1) {
		e1.printStackTrace();
	}
	out.println("Cancelled booking details of passenger Successfully!");
} catch (Exception e) {
	System.out.print(e);
	e.printStackTrace();
}
%>