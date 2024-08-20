<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index Page</title>
<%@include file="component/allcss.jsp"%>

<style>
.point-card {
	box-shadow: 0 0 11px 0 rgba(0, 0, 0, 0.8);
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	
	 
     
    
	<div id="carouselExampleControls" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/host1.jpg" class="d-block w-100" alt="..."
					height="600px">
			</div>
			<div class="carousel-item">
				<img src="img/host2.jpeg" class="d-block w-100" alt="..."
					height="600px">
			</div>
			<div class="carousel-item">
				<img src="img/host3.jpg" class="d-block w-100" alt="..."
					height="600px">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleControls" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleControls" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>


	<div class="container p-3">
		<p class="text-center fs-2">Keys Features of our hospital</p>
		<div class="row">
			<div class="col-md-8 p-5">
				<div class="row">
					<div class="col-md-6">
						<div class="card point-card">
							<div class="card-body">
								<p class="fs-5">100% Safety</p>
								<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
							</div>
						</div>
					</div>

					<div class="col-md-6">
						<div class="card point-card">
							<div class="card-body">
								<p class="fs-5">Clean Enironment</p>
								<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
							</div>
						</div>
					</div>


					<div class="col-md-6 mt-2">
						<div class="card point-card">
							<div class="card-body">
								<p class="fs-5">Friendly Dotors</p>
								<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
							</div>
						</div>
					</div>

					<div class="col-md-6 mt-2">
						<div class="card point-card">
							<div class="card-body">
								<p class="fs-5">Medical Research</p>
								<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<img alt="" src="img/doct1.jpg" height="350px" width="450px">

			</div>
		</div>
	</div>

	<hr>
	<div class="container p-4">
		<p class="text-center fs-2">OUR TEAM</p>
		<div class="row">
			<div class="col-md-3">
				<div class="cart point-card">
					<div class="cart-body text-center">
						<img src="img/doct3.jpg" width="250px" height="300px">
						<p class="fw-bold fs-5">Dr.Harshvardhan Gupta</p>
						<p class="fs-7">(CEO & Chairman)</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="cart point-card">
					<div class="cart-body text-center">
						<img src="img/doct4.jpg" width="250px" height="300px">
						<p class="fw-bold fs-5">Dr.Gourav Mehto</p>
						<p class="fs-7">(chief Doctor)</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="cart point-card">
					<div class="cart-body text-center">
						<img src="img/doct5.jpg" width="250px" height="300px">
						<p class="fw-bold fs-5">Dr.Hariom</p>
						<p class="fs-7">(chief Doctor)</p>
					</div>
				</div>
			</div>


			<div class="col-md-3">
				<div class="cart point-card">
					<div class="cart-body text-center">
						<img src="img/doct2.jpg" width="250px" height="300px">
						<p class="fw-bold fs-5">Dr.Nilu</p>
						<p class="fs-7">(Doctor)</p>
					</div>
				</div>
			</div>
		</div>
	</div>


	<%@include file="component/footer.jsp"%>


</body>
</html>