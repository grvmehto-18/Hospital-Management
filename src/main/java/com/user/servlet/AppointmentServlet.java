package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.AppointmentDAO;
import com.db.DBConnect;
import com.entity.Appointment;

@WebServlet("/appAppoinment")
public class AppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int userId = Integer.parseInt(request.getParameter("user_id"));
			String fullName = request.getParameter("fullname");
			String gender = request.getParameter("gender");
			String age = request.getParameter("age");
			String appointDate = request.getParameter("appoint_date");
			String email = request.getParameter("email");
			String phNo = request.getParameter("phno");
			String diseases = request.getParameter("diseases");
			int doctorId = Integer.parseInt(request.getParameter("doctor_id"));
			String address = request.getParameter("address");
			String status = "Pending"; // Assuming default status

			Appointment appointment = new Appointment(userId, fullName, gender, age, appointDate, email, phNo, diseases,
					doctorId, address, status);
			AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());

			boolean success = dao.saveAppointment(appointment);

			if (success) {
				request.getSession().setAttribute("succMsg", "Appointment booked successfully!");
				response.sendRedirect("user_appointment.jsp");
			} else {
				request.setAttribute("errorMsg", "Failed to save appointment. Please try again.");
				request.getRequestDispatcher("user_appointment.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", "Something went wrong on the server: " + e.getMessage());
			request.getRequestDispatcher("user_appointment.jsp").forward(request, response);
		}
	}
}
