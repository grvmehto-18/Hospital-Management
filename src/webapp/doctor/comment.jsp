<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.*"%>
<%@page import="com.dao.*"%>
<%@page import="com.db.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../component/allcss.jsp"%>
<style>
.point-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.8);
}
</style>
</head>
<body>
	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	String email = (String) session.getAttribute("doctObj");
	if (email == null) {
		response.sendRedirect("doctor_login.jsp?message=Login to continue");
	}
	%>
	<%@include file="navbar.jsp"%>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-4">Patient Comment</p>
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());

						Appointment ap = dao.getAllAppointById(id);
						%>
						<form class="row" action="../comment" method="post">
							<div class="col-md-6">
								<label>Patient Name</label> <input type="text" readonly
									value="<%=ap.getFullName()%>" class="form-control">
							</div>
							<div class="col-md-6">
								<label>Age</label> <input type="text" value="<%=ap.getAge()%>"
									readonly class="form-control">
							</div>
							<div class="col-md-6">
								<br> <label>Mob No</label> <input type="text" readonly
									value="<%=ap.getPhNo()%>" class="form-control">
							</div>
							<div class="col-md-6">
								<br> <label>Disease</label> <input type="text" readonly
									value="<%=ap.getDiseases()%>" class="form-control">
							</div>
							<div class="col-md-12">
								<br> <label>Comment</label>
								<textarea class="form-control" name="comment"></textarea>
							</div>
							<input type="hidden" name="id" value="<%=ap.getId()%>">
							<input type="hidden" name="did" value="<%=ap.getDoctorId()%>">
							<div class="col-md-12 text-center">
								<br>
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
