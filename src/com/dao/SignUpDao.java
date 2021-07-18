package com.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;

import com.connectionFactory.ConnectionFactory;
import com.model.User;

public class SignUpDao {
	public int registerUser(User user) throws ClassNotFoundException {
		String INSERT_USERS_SQL = "insert into users (userId, FirstName, LastName, email, phoneNo, Address, Country, password, "
				+ "confirmPassword)values (?,?,?,?,?,?,?,?,?);";
		int result = 0;

		try {
			Connection connection = ConnectionFactory.getConnection();
			PreparedStatement ps = connection.prepareStatement(INSERT_USERS_SQL);

			ps.setInt(1, generateId());
			ps.setString(2, user.getFirstName());
			ps.setString(3, user.getLastName());
			ps.setString(4, user.getEmail());
			ps.setString(5, user.getPhoneNumber());
			ps.setString(6, user.getAddress());
			ps.setString(7, user.getCountry());
			ps.setString(8, user.getPassword());
			ps.setString(9, user.getConfirmPassword());
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
