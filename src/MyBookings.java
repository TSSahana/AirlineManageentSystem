
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
import javax.servlet.http.HttpSession;

import com.connectionFactory.ConnectionFactory;
import com.model.User;

@WebServlet("/MyBookings")
public class MyBookings extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");

		try {
			Connection connection = ConnectionFactory.getConnection();
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			int userId = user.getUserId();
			
			String getMyBookingsQuery = "select * from mybookings where userId=" + userId;
			System.out.println("getMyBookingsQuery " + getMyBookingsQuery);
			Statement st3 = connection.createStatement();
			ResultSet rs3 = st3.executeQuery(getMyBookingsQuery);
			int bookingId = 0;
			int flightId = 0;
			while (rs3.next()) {
				bookingId = rs3.getInt(2);
				flightId = rs3.getInt(3);
				System.out.println("al :: " + rs3);
			}
			ArrayList myBookingsDetailsList = new ArrayList();
			String query1 = "select * from flightdetails where FlightId=" + flightId;

			System.out.println("query " + query1);
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(query1);
			ArrayList flightdetailsList = new ArrayList();
			while (rs.next()) {
				flightdetailsList.add(rs.getString(1));
				flightdetailsList.add(rs.getString(2));
				flightdetailsList.add(rs.getString(3));
				flightdetailsList.add(rs.getString(4));
				flightdetailsList.add(rs.getString(5));
				flightdetailsList.add(rs.getString(6));
				flightdetailsList.add(rs.getString(7));
				flightdetailsList.add(rs.getString(8));
				flightdetailsList.add(rs.getString(9));
				flightdetailsList.add(rs.getString(10));
				flightdetailsList.add(rs.getString(11));
				flightdetailsList.add(rs.getString(12));
				flightdetailsList.add(rs.getString(13));
				System.out.println("al :: " + flightdetailsList);
			}
			String query2 = "select * from passengerdetails where Booking_Id=" + bookingId;
			System.out.println("query " + query2);
			Statement st2 = connection.createStatement();
			ResultSet rs2 = st2.executeQuery(query2);
			while (rs2.next()) {
				flightdetailsList.add(rs2.getString(1));
				flightdetailsList.add(rs2.getString(2));
				flightdetailsList.add(rs2.getString(3));
				flightdetailsList.add(rs2.getString(4));
				flightdetailsList.add(rs2.getString(5));
				flightdetailsList.add(rs2.getString(6));
				flightdetailsList.add(rs2.getString(7));
				flightdetailsList.add(rs2.getString(8));
				flightdetailsList.add(rs2.getString(9));
				flightdetailsList.add(rs2.getString(10));
				flightdetailsList.add(rs2.getString(11));
				System.out.println("al :: " + flightdetailsList);
				myBookingsDetailsList.add(flightdetailsList);
			}
			request.setAttribute("bookingDetailsList", myBookingsDetailsList);
			System.out.println("bookingDetailsList " + myBookingsDetailsList);
			String nextJSP = "/MyBookings.jsp";
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
			dispatcher.forward(request, response);
			connection.close();
			System.out.println("Disconnected from database");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}