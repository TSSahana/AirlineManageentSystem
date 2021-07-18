
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

@WebServlet("/Search")
public class Search extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");

		try {
			Connection connection = ConnectionFactory.getConnection();
			String flightName = request.getParameter("flightName");
			String flightNo = request.getParameter("flightNo");
			String placeFrom = request.getParameter("placeFrom");
			String placeTo = request.getParameter("placeTo");
			String prices = request.getParameter("prices");
			String flightClass = request.getParameter("flightClass");
			String capacity = request.getParameter("capacity");
			String availableSeats = request.getParameter("availableSeats");

			ArrayList al = null;
			ArrayList flightList = new ArrayList();
			String query = "select FlightId,FlightName,FlightNo,PlaceFrom,PlaceTo,Prices,Flight_class,Capacity,Available_seats from flightdetails where FlightName='"
					+ flightName + "' and PlaceFrom='" + placeFrom
					+ "'  and PlaceTo='" + placeTo + "' or Prices='" + prices + "' and Flight_class='" + flightClass
					+ "' \r\n" + "or Capacity='" + capacity + "' or Available_seats='" + availableSeats
					+ "' order by FlightName";
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
				System.out.println("al :: " + al);
				flightList.add(al);
			}

			request.setAttribute("flightList", flightList);
			System.out.println("flightList " + flightList);
			String nextJSP = "/viewSearch.jsp";
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
			dispatcher.forward(request, response);
			connection.close();
			System.out.println("Disconnected from database");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}