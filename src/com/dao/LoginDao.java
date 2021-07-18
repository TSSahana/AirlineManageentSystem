package com.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.connectionFactory.ConnectionFactory;
import com.model.User;

public class LoginDao {

	public User checkLogin(String username, String password) throws SQLException, ClassNotFoundException {
		Connection connection = ConnectionFactory.getConnection();
		String sql = "SELECT * FROM users WHERE firstname = ? and password = ?";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, username);
		statement.setString(2, password);
		ResultSet result = statement.executeQuery();
		User user = null;
		if (result.next()) {
			user = new User();
			user.setUserId(result.getInt("userId"));
			user.setFirstName(result.getString("firstName"));
			user.setPassword(result.getString("password"));
			user.setIsAdmin(result.getString("isAdmin"));
		}
		connection.close();
		return user;
	}

}