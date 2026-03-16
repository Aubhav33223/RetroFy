<%@page import="com.cashify.servlet_cashify_project.dao.CartItemDao"%>
<%@page import="com.cashify.servlet_cashify_project.dto.CartItems"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>USER-NAVBAR</title>
<!-- Add this to your HTML <head> -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
	<%
	List<CartItems> cartItems = new CartItemDao().getAllCartItemsDetails();
	%>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="home.jsp">CASHIFY</a>

			<!-- Toggle button for responsive design -->
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarContent">
				<span class="navbar-toggler-icon"></span>
			</button>

			<!-- Navbar content -->
			<div class="collapse navbar-collapse" id="navbarContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<!-- Other nav items -->
					<li class="nav-item"><a class="nav-link active"
						href="profile.jsp">Profile</a></li>
					<li class="nav-item"><a class="nav-link active"
						href="add-user-address.jsp">add-address</a></li>
					<li class="nav-item"><a
						class="nav-link active position-relative text-white"
						href="user-cart.jsp"> <i
							class="fas fa-shopping-cart text-white"></i> Cart <span
							class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
								<%=cartItems.size()%> <span class="visually-hidden">cart
									items</span>
						</span>
					</a></li>
				</ul>

				<!-- Search form -->
				<form class="d-flex me-2" action="search.jsp" method="get">
					<input class="form-control me-2" type="search" name="query"
						placeholder="Search" aria-label="Search">
					<button class="btn btn-outline-light" type="submit">Search</button>
				</form>

				<!-- Logout button -->
				<form action="login.jsp" method="post">
					<button class="btn btn-danger" type="submit">Logout</button>
				</form>
			</div>
		</div>
	</nav>

</body>
</html>