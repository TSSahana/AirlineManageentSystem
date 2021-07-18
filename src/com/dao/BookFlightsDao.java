package com.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.connectionFactory.ConnectionFactory;
import com.model.PassengerDetails;
import com.model.User;

public class BookFlightsDao {

	public void bookFlight(PassengerDetails passengerDetails, HttpServletRequest request)
			throws ClassNotFoundException {
		String INSERT_PASSENGERS_SQL = "insert into passengerdetails (Booking_id, FlightId, Passenger_name, Age, Gender, emailId, "
				+ "phoneNo, AadharNo, PassportNo, Nationality, Payment) values (?,?,?,?,?,?,?,?,?,?,?);";
		int result = 0;
		HttpSession session = request.getSession();
		int bookingId = generateId();
		session.setAttribute("bookingId", bookingId);
		try {
			Connection connection = ConnectionFactory.getConnection();
			PreparedStatement ps = connection.prepareStatement(INSERT_PASSENGERS_SQL);
			ps.setInt(1, bookingId);
			ps.setInt(2, passengerDetails.getFlightId());
			ps.setString(3, passengerDetails.getPassengerName());
			ps.setString(4, passengerDetails.getAge());
			ps.setString(5, passengerDetails.getGender());
			ps.setString(6, passengerDetails.getEmailId());
			ps.setString(7, passengerDetails.getPhoneNo());
			ps.setString(8, passengerDetails.getAadharNo());
			ps.setString(9, passengerDetails.getPassportNo());
			ps.setString(10, passengerDetails.getNationality());
			ps.setString(11, passengerDetails.getPayment());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		String INSERT_MYBOOKINGS_SQL = "insert into mybookings (mybooking_id, Booking_id, FlightId, Booking_date, userId) values (?,?,?, CURRENT_TIMESTAMP, ?);";
		try {
			int flightId = Integer.parseInt(session.getAttribute("flightId").toString());
			User user = (User) session.getAttribute("user");
			int userId = user.getUserId();
			Connection connection = ConnectionFactory.getConnection();
			PreparedStatement ps = connection.prepareStatement(INSERT_MYBOOKINGS_SQL);
			int myBookingId = generateId();
			ps.setInt(1, myBookingId);
			ps.setInt(2, bookingId);
			ps.setInt(3, flightId);
			ps.setInt(4, userId);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public int generateId() {
		int randomId = 0;
		Random rand = new Random();
		for (int j = 0; j < 10; j++) {
			randomId = rand.nextInt();
		}
		return randomId;
	}

}
