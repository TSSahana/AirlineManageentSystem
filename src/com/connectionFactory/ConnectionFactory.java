package com.connectionFactory;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		String jdbcURL = "jdbc:mysql://localhost:3306/airlinemgmtsystem?allowPublicKeyRetrieval=true&useSSL=false";
		String dbUser = "root";
		String dbPassword = "Rayaru@123";
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
		return connection;
	}
}
