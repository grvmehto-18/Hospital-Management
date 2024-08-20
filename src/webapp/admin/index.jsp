<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
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
		response.sendRedirect("admin_login.jsp?message=Login to continue");
	}
	%>
	<%@include file="navbar.jsp"%>


	<div class="container p-5">
		<p class="text-center fs-3">Admin Dashboard</p>



		<c:if test="${not empty successMsg }">
			<p class="text-center text-success fs-3">${successMsg}</p>
			<c:remove var="successMsg" scope="session" />
		</c:if>

		<c:if test="${not empty ErrorMsg }">
			<p class="text-center text-danger fs-5">${ErrorMsg}</p>
			<c:remove var="ErrorMsg" scope="session" />
		</c:if>
		<div class="row">

			<div class="col-md-4">
				<div class="card point-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">
							Doctor<br>5
						</p>
					</div>
				</div>
			</div>


			<div class="col-md-4">
				<div class="card point-card">

					<div class="card-body text-center text-success">
						<i class="fas fa-user-circle fa-3x"></i><br>
						<p class="fs-4 text-center">
							User<br>10
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card point-card">
					<div class="card-body text-center text-success">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Total Appointment<br>5
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4 mt-2">
				<div class="card point-card " data-bs-toggle="modal"
					data-bs-target="#exampleModal">
					<div class="card-body text-center text-success">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Specialist<br>6
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<form action="../addSpecialist" method="post">
						<div class="modal-body">
							<label>Enter Specialist Name</label> <input type="text"
								name="specName" class="form-control">
						</div>
						<div class="text-center mt-3">
							<button type="submit" class="btn btn-primary">Add</button>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>