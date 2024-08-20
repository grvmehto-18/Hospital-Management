<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Specialist"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	String email = (String) session.getAttribute("adminObj");
	if (email == null) {
		response.sendRedirect("../admin_login.jsp?message=Login to continue");
	}
	%>
	<%@include file="navbar.jsp"%>
	<div class="container-fluid p-3">
		<div class="row">




			<div class="col-md-4 offset-md-4">
				<div class="card point-card">
					<div class="card-body">
						<p class="fs-3 text-center ">Edit Doctor Details</p>
						<c:if test="${not empty errorMsg }">
							<p class="fs-3 text-center text-danger">${errorMsg }</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg }">
							<div class="fs-3 text-center text-success" role="alert">${succMsg }</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>


						<%
						int id = Integer.parseInt(request.getParameter("id"));
						DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
						Doctor d = dao2.getDoctorById(id);
						%>





						<form action="../updateDoctor" method="post">

							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									required name="fullname" class="form-control"
									value="<%=d.getFullName()%>">


							</div>
							<div class="mb-3">

								<label class="form-label">DOB</label> <input type="date"
									required name="dob" class="form-control"
									value="<%=d.getDob()%>">

							</div>
							<div class="mb-3">
								<label class="form-label">Qualification</label><input required
									name="qualification" type="text" class="form-control">
								<option><%=d.getQualification()%></option>

							</div>

							<div class="mb-3">

								<label class="form-label">Specialist</label> <select required
									name="spec" class="form-control">
									<option><%=d.getSpecialist()%></option>

									<%
									SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
									List<Specialist> list = dao.getAllSpecalist();
									for (Specialist s : list) {
									%><option>
										<%=s.getSpecialistName()%></option>
									<%
									}
									%>



								</select>
							</div>
							<div class="mb-3">

								<label class="form-label">Email</label> <input type="text"
									value="<%=d.getEmail()%>" required name="email"
									class="form-control">

							</div>
							<div class="mb-3">

								<label class="form-label">Mob No.</label> <input type="text"
									value="<%=d.getMobNo()%>" required name="mobno"
									class="form-control">

							</div>

							<div class="mb-3">

								<label class="form-label">Password</label> <input
									value="<%=d.getPassword()%>" type="text" required
									name="password" class="form-control">

							</div>
							<input type="hidden" name="id" value="<%=d.getId()%>">
							<button type="submit" class="btn btn-primary col-md-12">Update</button>
						</form>

					</div>

				</div>

			</div>


		</div>

	</div>

</body>
</html>
