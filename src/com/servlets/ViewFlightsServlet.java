package com.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connectionFactory.ConnectionFactory;

@WebServlet("/ViewFlights")
public class ViewFlightsServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");

		try {
			Connection connection = ConnectionFactory.getConnection();
			ArrayList al = null;
			ArrayList flightList = new ArrayList();
			String query = "select * from flightdetails order by FlightName";
			System.out.println("query " + query);
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(query);

			while (rs.next()) {
				al = new ArrayList();
				al.add(rs.getString(1));
				al.add(rs.getString(2));
				al.add(rs.getString(3));
				al.add(rs.getString(4));
				al.add(rs.getString(5));
				al.add(rs.getString(6));
				al.add(rs.getString(7));
				al.add(rs.getString(8));
				al.add(rs.getString(9));
				al.add(rs.getString(10));
				al.add(rs.getString(11));
				System.out.println("al :: " + al);
				flightList.add(al);
			}

			request.setAttribute("viewFlightsList", flightList);
			System.out.println("viewFlightsList " + flightList);
			String nextJSP = "/AdminManageFlights.jsp";
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
			dispatcher.forward(request, response);
			connection.close();
			System.out.println("Disconnected from database");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}