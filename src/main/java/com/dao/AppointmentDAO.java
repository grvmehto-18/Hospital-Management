package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Appointment;

public class AppointmentDAO {
	private Connection con;

	public AppointmentDAO(Connection con) {
		this.con = con;
	}

	public boolean saveAppointment(Appointment ap) {
		boolean f = false;

		try {
			// Insert the appointment
			String q = "INSERT INTO appointment(user_id, fullname, gender, age, appoint_date, email, phno, diseases, doctor_id, address, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement pstmt = con.prepareStatement(q);
			pstmt.setInt(1, ap.getUserId());
			pstmt.setString(2, ap.getFullName());
			pstmt.setString(3, ap.getGender());
			pstmt.setString(4, ap.getAge());
			pstmt.setString(5, ap.getAppoinDate());
			pstmt.setString(6, ap.getEmail());
			pstmt.setString(7, ap.getPhNo());
			pstmt.setString(8, ap.getDiseases());
			pstmt.setInt(9, ap.getDoctorId());
			pstmt.setString(10, ap.getAddress());
			pstmt.setString(11, ap.getStatus());

			int i = pstmt.executeUpdate();
			if (i > 0) {
				f = true;
			} else {
				System.err.println("Failed to insert appointment: No rows affected");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Appointment> getAllAppointmentByLoginUser(int userId) {
		List<Appointment> list = new ArrayList<Appointment>();
		Appointment ap = null;

		try {
			String sql = "select * from appointment where user_id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppoinDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));

				list.add(ap);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<Appointment> getAllAppointmentByDoctor(int doctorId) {
		List<Appointment> list = new ArrayList<Appointment>();
		Appointment ap = null;

		try {
			String sql = "select * from appointment where doctor_id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, doctorId);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppoinDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));

				list.add(ap);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public Appointment getAllAppointById(int id) {
		Appointment ap = null;

		try {
			String sql = "select * from appointment where id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppoinDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhNo(rs.getString(8));
				ap.setDiseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return ap;
	}

	public boolean updateCommentStatus(int id, int dId, String comment) {
		boolean f = false;
		try {
			String sql = "UPDATE appointment set status=? WHERE id=? and doctor_id=?";
			PreparedStatement psmt = con.prepareStatement(sql);
			psmt.setString(1, comment);
			psmt.setInt(2, id);
			psmt.setInt(3, dId);
			
			int i = psmt.executeUpdate();
			
			if(i > 0) {
				f=true;
			}

		} catch (Exception e) {
    
			e.printStackTrace();
		}
		return f;

	}
}
