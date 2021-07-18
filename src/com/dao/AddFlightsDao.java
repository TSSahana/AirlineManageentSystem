package com.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;

import com.connectionFactory.ConnectionFactory;
import com.model.FlightDetails;

public class AddFlightsDao {
	public int addFlights(FlightDetails flightDetails) throws ClassNotFoundException {
		String INSERT_FLIGHTS_SQL = "insert into flightDetails (FlightId, FlightName, FlightNo, PlaceFrom, PlaceTo, Departure_date, Departure_time, Prices, "
				+ "Flight_class, Capacity, Available_seats)values (?,?,?,?,?,?,?,?,?,?,?);";
		int result = 0;

		try {
			Connection connection = ConnectionFactory.getConnection();
			PreparedStatement ps = connection.prepareStatement(INSERT_FLIGHTS_SQL);

			ps.setInt(1, generateId());
			ps.setString(2, flightDetails.getFlightName());
			ps.setString(3, flightDetails.getFlightNumber());
			ps.setString(4, flightDetails.getDestinationFrom());
			ps.setString(5, flightDetails.getDestinationTo());
			ps.setString(6, flightDetails.getDepartureDate());
			ps.setString(7, flightDetails.getDepartureTime());
			ps.setString(8, flightDetails.getPrice());
			ps.setString(9, flightDetails.getFlightClass());
			ps.setString(10, flightDetails.getCapacity());
			ps.setString(11, flightDetails.getAvailableSeats());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
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
