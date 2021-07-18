package com.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BookFlightsDao;
import com.model.PassengerDetails;

@WebServlet("/bookflights")
public class BookFlights extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookFlightsDao bookFlightsDao = new BookFlightsDao();

	public BookFlights() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
		HttpSession session = request.getSession();
		int flightId = Integer.parseInt(session.getAttribute("flightId").toString());
		String passengerName = request.getParameter("passengerName");
		String age = request.getParameter("age");
		String gender = request.getParameter("gender");
		String nationality = request.getParameter("nationality");
		String phoneNo = request.getParameter("phoneNo");
		String emailId = request.getParameter("emailId");
		String aadharNo = request.getParameter("aadharNo");
		String passportNo = request.getParameter("passportNo");
		String payment = request.getParameter("payment");

		PassengerDetails passengerDetails = new PassengerDetails();
		passengerDetails.setFlightId(flightId);
		passengerDetails.setPassengerName(passengerName);
		passengerDetails.setAge(age);
		passengerDetails.setGender(gender);
		passengerDetails.setNationality(nationality);
		passengerDetails.setEmailId(emailId);
		passengerDetails.setPhoneNo(phoneNo);
		passengerDetails.setPassportNo(passportNo);
		passengerDetails.setAadharNo(aadharNo);
		passengerDetails.setPayment(payment);

		try {
			bookFlightsDao.bookFlight(passengerDetails, request);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		response.sendRedirect("ViewMyBookings.jsp");
	}

}
