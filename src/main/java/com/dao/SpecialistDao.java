package com.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Specialist;

public class SpecialistDao {
	private Connection conn;

	public SpecialistDao(Connection conn) {
		this.conn = conn;
	}

	public boolean addSpecialist(String specialistName) {
		boolean flag = false;
		try {
			String query = "INSERT INTO specialists (spec_name) VALUES (?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, specialistName);
			int result = ps.executeUpdate();

			if (result > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	public List<Specialist> getAllSpecalist() {

		List<Specialist> list = new ArrayList<Specialist>();
		Specialist s = null;
		try {
			String sql = "select * from specialists";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				s = new Specialist();
				s.setId(rs.getInt(1));
				s.setSpecialistName(rs.getString(2));
				list.add(s);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}
}
