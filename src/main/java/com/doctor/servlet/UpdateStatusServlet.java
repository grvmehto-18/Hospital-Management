package com.doctor.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDAO;
import com.db.DBConnect;

@WebServlet("/comment")
public class UpdateStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			int id = Integer.parseInt(request.getParameter("id"));
			int did = Integer.parseInt(request.getParameter("did"));
			String comment = request.getParameter("comment");
			
			System.out.println(id);
			System.out.println(did);
			System.out.println(comment);

			AppointmentDAO ap = new AppointmentDAO(DBConnect.getConn());

			HttpSession session = request.getSession();

			if (ap.updateCommentStatus(id, did, comment)) {
				session.setAttribute("succMsg", "Comment Updated");
				response.sendRedirect("doctor/patient.jsp");
			} else {
				session.setAttribute("erroMsg", "Comment not Updated");
				response.sendRedirect("doctor/patient.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
