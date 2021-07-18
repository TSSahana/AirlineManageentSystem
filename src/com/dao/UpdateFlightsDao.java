package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.connectionFactory.ConnectionFactory;
import com.model.FlightDetails;

public class UpdateFlightsDao {
	public int updateFlights(FlightDetails flightDetails) throws ClassNotFoundException {
		String UPDATE_FLIGHTS_SQL = "UPDATE flightDetails SET FlightName = ?, FlightNo = ?, PlaceFrom = ?, PlaceTo = ?, "
				+ "Departure_date = ?, Departure_time = ?, Prices = ?, Flight_class = ?, Capacity = ?, Available_seats = ? where FlightId = ?;";
		int result = 0;

		try {
			Connection connection = ConnectionFactory.getConnection();
			PreparedStatement ps = connection.prepareStatement(UPDATE_FLIGHTS_SQL);

			ps.setString(1, flightDetails.getFlightName());
			ps.setString(2, flightDetails.getFlightNumber());
			ps.setString(3, flightDetails.getDestinationFrom());
			ps.setString(4, flightDetails.getDestinationTo());
			ps.setString(5, flightDetails.getDepartureDate());
			ps.setString(6, flightDetails.getDepartureTime());
			ps.setString(7, flightDetails.getPrice());
			ps.setString(8, flightDetails.getFlightClass());
			ps.setString(9, flightDetails.getCapacity());
			ps.setString(10, flightDetails.getAvailableSeats());
			ps.setInt(11, flightDetails.getFlightId());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
