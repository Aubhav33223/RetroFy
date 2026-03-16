package com.cashify.servlet_cashify_project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cashify.servlet_cashify_project.connection.CashifyConnection;
import com.cashify.servlet_cashify_project.dto.OldPhone;

public class OldPhoneDao {

	Connection connection = CashifyConnection.getCashifyConnection();

	public OldPhone saveOldPhoneDao(OldPhone oldPhone) {

		String insertQueryOldPhone = "insert into old_phone(id,name,email,phone,brand,model,storage,conditions,expected_price,comments,image,verification) values(?,?,?,?,?,?,?,?,?,?,?,?)";

		try {

			PreparedStatement p = connection.prepareStatement(insertQueryOldPhone);

			p.setInt(1, oldPhone.getId());
			p.setString(2, oldPhone.getName());
			p.setString(3, oldPhone.getEmail());
			p.setLong(4, oldPhone.getPhone());
			p.setString(5, oldPhone.getBrand());
			p.setString(6, oldPhone.getModel());
			p.setString(7, oldPhone.getStorage());
			p.setString(8, oldPhone.getCondition());
			p.setDouble(9, oldPhone.getExpectedprice());
			p.setString(10, oldPhone.getComments());
			p.setBytes(11, oldPhone.getImage());
			p.setString(12, "no");

			return p.executeUpdate() != 0 ? oldPhone : null;

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public List<OldPhone> getAllOldPhones() {

		List<OldPhone> oldPhones = new ArrayList<>();

		String query = "SELECT * FROM old_phone";

		try (PreparedStatement p = connection.prepareStatement(query);

				ResultSet rs = p.executeQuery()) {

			while (rs.next()) {

				OldPhone phone = new OldPhone();

				phone.setId(rs.getInt("id"));
				phone.setName(rs.getString("name"));
				phone.setEmail(rs.getString("email"));
				phone.setPhone(rs.getLong("phone"));
				phone.setBrand(rs.getString("brand"));
				phone.setModel(rs.getString("model"));
				phone.setStorage(rs.getString("storage"));
				phone.setCondition(rs.getString("conditions")); // Note: changed from 'condition' to 'conditions'
				phone.setExpectedprice(rs.getDouble("expected_price"));
				phone.setComments(rs.getString("comments"));
				phone.setImage(rs.getBytes("image"));
				phone.setVerification(rs.getString("verification"));

				oldPhones.add(phone);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return oldPhones;
	}

	public boolean updateOldPhoneVerification(String verify, int id) {
		try {
			String sql = "UPDATE old_phone SET verification = ? WHERE id = ?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, verify);
			ps.setInt(2, id);
			return ps.executeUpdate() != 0 ? true : false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public OldPhone getOldPhoneByIdDao(int productId) {

		String query = "SELECT * FROM old_phone where id=?";

		try {
			PreparedStatement p = connection.prepareStatement(query);

			p.setInt(1, productId);

			ResultSet rs = p.executeQuery();

			if (rs.next()) {

				OldPhone phone = new OldPhone();

				phone.setId(rs.getInt("id"));
				phone.setName(rs.getString("name"));
				phone.setEmail(rs.getString("email"));
				phone.setPhone(rs.getLong("phone"));
				phone.setBrand(rs.getString("brand"));
				phone.setModel(rs.getString("model"));
				phone.setStorage(rs.getString("storage"));
				phone.setCondition(rs.getString("conditions")); // Note: changed from 'condition' to 'conditions'
				phone.setExpectedprice(rs.getDouble("expected_price"));
				phone.setComments(rs.getString("comments"));
				phone.setImage(rs.getBytes("image"));
				phone.setVerification(rs.getString("verification"));

				return phone;
			}

			return null;
		} catch (SQLException e) {
			e.printStackTrace();

			return null;
		}
	}

	public double getOldPhonePriceByIdDao(int productId) {

		String query = "SELECT expected_price FROM old_phone where id=?";

		try {
			PreparedStatement p = connection.prepareStatement(query);

			p.setInt(1, productId);

			ResultSet rs = p.executeQuery();

			if (rs.next()) {

				

				 // Note: changed from 'condition' to 'conditions'
				return rs.getDouble("expected_price");

			}

			return 0;
		} catch (SQLException e) {
			e.printStackTrace();

			return 0;
		}
	}

}
