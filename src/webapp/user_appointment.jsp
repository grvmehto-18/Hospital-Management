<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="component/allcss.jsp"%>
<title>User appointment</title>
</head>
<body>
	<header>
		<%@include file="component/navbar.jsp"%>
	</header>
	<main>
		<div class="container mt-5">
			<div class="card">
				<div class="card-header">
					<h3>User Appointment</h3>
				
				<c:if test="${not empty succMsg}">
							<p class="text-center text-success fs-3">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty errorMsg}">
							<p class="text-center text-danger fs-5">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
				</div>
				<div class="card-body">
			<form action="appAppoinment" method="post">
						<input type="hidden" name="user_id" value="${userObj.id}">

						<div class="row mb-3">
							<div class="col-md-6">
								<label for="fullName" class="form-label">Full Name</label> <input
									type="text" class="form-control" id="fullName" name="fullname"
									placeholder="Full Name">
							</div>
							<div class="col-md-6">
								<label for="gender" class="form-label">Gender</label> <select
									id="gender" class="form-select" name="gender">
									<option selected>Male</option>
									<option>Female</option>
									<option>Other</option>
								</select>
							</div>
						</div>
						<div class="row mb-3">
							<div class="col-md-6">
								<label for="age" class="form-label">Age</label> <input
									type="number" class="form-control" id="age" placeholder="Age" name="age">
							</div>
							<div class="col-md-6">
								<label for="appointmentDate" class="form-label">Appointment
									Date</label> <input type="date" class="form-control"
									id="appointmentDate" name="appoint_date">
							</div>
						</div>
						<div class="row mb-3">
							<div class="col-md-6">
								<label for="email" class="form-label">Email</label> <input
									type="email" class="form-control" id="email" name="email"
									placeholder="Email">
							</div>
							<div class="col-md-6">
								<label for="phoneNo" class="form-label">Phone No</label> <input
									type="tel" class="form-control" id="phoneNo" name="phno"
									placeholder="Phone No">
							</div>
						</div>
						<div class="row mb-3">
							<div class="col-md-6">
								<label for="diseases" class="form-label">Diseases</label> <input
									type="text" class="form-control" id="diseases" name="diseases"
									placeholder="Diseases">
							</div>
							<div class="col-md-6">
								<label for="doctor" class="form-label">Doctor</label> <select name="doctor_id">
									<%
									DoctorDao dao = new DoctorDao(DBConnect.getConn());
									List<Doctor> list = dao.getAllDoctors();
									for (Doctor d : list) {
									%>
									<option value="<%=d.getId()%>"><%=d.getFullName()%> (<%=d.getSpecialist()%>)
									</option>

									<%
									}
									%> 
								</select>
							</div>
						</div>
						<div class="mb-3">
							<label for="fullAddress" class="form-label">Full Address</label>
							<textarea class="form-control" id="fullAddress" rows="3"
								placeholder="Full Address" name="address"></textarea>
						</div>

						<c:if test="${empty userObj}">
							<a href="user_login.jsp" class="col-md-6 offset-md-3 btn btn-success">Submit</a>
						</c:if>

						<c:if test="${not empty userObj}">
							<button type="submit" class="col-md-6 offset-md-3 btn btn-success">Submit</button>
						</c:if>

					</form>
				</div>
			</div>
		</div>
	</main>
</body>
</html>