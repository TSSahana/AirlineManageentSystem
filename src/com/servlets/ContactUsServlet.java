package com.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ContactUsDao;
import com.model.ContactUs;

@WebServlet("/ContactUs")
public class ContactUsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ContactUsServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String country = request.getParameter("country");
		String message = request.getParameter("message");

		ContactUs contactUs = new ContactUs();
		contactUs.setName(name);
		contactUs.setEmail(email);
		contactUs.setCountry(country);
		contactUs.setMessage(message);

		ContactUsDao contactUsDao = new ContactUsDao();
		try {
			contactUsDao.contactUs(contactUs, request);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("/FlightDetails.jsp");
		dispatcher.forward(request, response);
	}

}
