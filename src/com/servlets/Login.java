package com.servlets;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.LoginDao;
import com.model.User;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	LoginDao loginDao = new LoginDao();
	public Login() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

		String name = request.getParameter("uname");
		String pass = request.getParameter("upass");

		
		try {
			User user = loginDao.checkLogin(name, pass);
			String destPage = "Login.jsp";
			if (user != null) {
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				session.setAttribute("UserName", user.getFirstName());
				session.setAttribute("isAdmin", user.getIsAdmin());
				destPage = "FlightDetails.jsp";
			} else {
				String message = "Invalid UserName/Password";
				request.setAttribute("message", message);
			}
			RequestDispatcher dd = request.getRequestDispatcher(destPage);
			dd.forward(request, response);
		} catch (SQLException | ClassNotFoundException ex) {
			throw new ServletException(ex);
		}

	}

}
