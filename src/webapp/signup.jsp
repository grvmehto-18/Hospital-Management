<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@page isELIgnored="false" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> User Signup</title>
<%@include file="component/allcss.jsp" %>

<style>
.point-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.8);
}
</style>
</head>
<body>
        
        
        <%@include file="component/navbar.jsp" %>
    
    
    
    
    <div class="contain -5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
			     <div class="card point-card mt-5">
				<div class="card-body">
					<p class="fs-4 text-center mt-2">User Register</p>
					
					<c:if test="${not empty sucMsg }">
							<p class="text-center text-success fs-3">${sucMsg}</p>
							<c:remove var="sucMsg" scope="session" />
						</c:if>

						<c:if test="${not empty errorMsg }">
							<p class="text-center text-danger fs-5">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
					
					
					<form action="user_register" method="post">
                            
                            <div class="mb-3">
							<label class="from-label">Full Name</label> <input required
								name="fullname" type="text" class="form-control">

						</div>
						<div class="mb-3">
							<label class="from-label">Email address</label> <input required
								name="email" type="email" class="form-control">

						</div>

						<div class="mb-3">
							<label class="from-label">Password</label> <input required
								name="password" type="Password" class="form-control">

						</div>

						<button type="submit" class="btn bg-success text-white col-md-12">Register</button>
					</form>
				</div>

			</div>
		</div>
	</div>
	</div>
    
</body>
</html>