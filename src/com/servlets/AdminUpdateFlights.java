package com.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UpdateFlightsDao;
import com.model.FlightDetails;

/**
 * Servlet implementation class AdminDeleteFlights
 */
@WebServlet("/updateflights")
public class AdminUpdateFlights extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminUpdateFlights() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

		String flightNumber = request.getParameter("flightNumber");
		String flightName = request.getParameter("flightName");
		String destinationFrom = request.getParameter("destinationFrom");
		String destinationTo = request.getParameter("destinationTo");
		String departureDate = request.getParameter("departureDate");
		String departureTime = request.getParameter("departureTime");
		String flightClass = request.getParameter("flightClass");
		String price = request.getParameter("price");
		String capacity = request.getParameter("capacity");
		String availableSeats = request.getParameter("availableSeats");
		int flightId = Integer.parseInt(request.getParameter("flightId"));

		FlightDetails flightDetails = new FlightDetails();
		flightDetails.setFlightNumber(flightNumber);
		flightDetails.setFlightName(flightName);
		flightDetails.setDestinationFrom(destinationFrom);
		flightDetails.setDestinationTo(destinationTo);
		flightDetails.setDepartureDate(departureDate);
		flightDetails.setDepartureTime(departureTime);
		flightDetails.setFlightClass(flightClass);
		flightDetails.setPrice(price);
		flightDetails.setCapacity(capacity);
		flightDetails.setAvailableSeats(availableSeats);
		flightDetails.setFlightId(flightId);
		UpdateFlightsDao updateFlightsDao = new UpdateFlightsDao();
		try {
			updateFlightsDao.updateFlights(flightDetails);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("/ViewFlights");
		dispatcher.forward(request, response);
	}

}
