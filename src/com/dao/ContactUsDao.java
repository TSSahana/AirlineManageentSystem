package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.connectionFactory.ConnectionFactory;
import com.model.ContactUs;

public class ContactUsDao {

	public void contactUs(ContactUs contactUs, HttpServletRequest request) throws ClassNotFoundException {
		String INSERT_CONTACTUS_SQL = "insert into contactus (contactus_id, email, name, country, message) values (?,?,?,?,?);";
		int result = 0;
		try {
			Connection connection = ConnectionFactory.getConnection();
			PreparedStatement ps = connection.prepareStatement(INSERT_CONTACTUS_SQL);
			ps.setInt(1, generateId());
			ps.setString(2, contactUs.getEmail());
			ps.setString(3, contactUs.getName());
			ps.setString(4, contactUs.getCountry());
			ps.setString(5, contactUs.getMessage());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
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
