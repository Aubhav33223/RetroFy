<%@page import="com.cashify.servlet_cashify_project.dto.User"%>
<%@page import="com.cashify.servlet_cashify_project.dao.UserDao"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Sell Phone Form</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css">
</head>
<body>
	<%
	HttpSession httpSession = request.getSession();
	String email = (String) httpSession.getAttribute("userSession");
	if (email != null) {

		User user = new UserDao().getUserByEmailDao(email);
	%>
	<jsp:include page="user-navbar.jsp"></jsp:include>
	<div class="container">
		<h2>Sell Your Phone</h2>
		<form action="sellPhone" method="post" enctype="multipart/form-data">

			<!-- ID -->
			<div class="mb-3">
				<label for="name" class="form-label">ID</label> <input type="text"
					class="form-control" id="name" name="id" required>
			</div>

			<!-- Full Name -->
			<div class="mb-3">
				<label for="name" class="form-label">Full Name</label> <input
					type="text" class="form-control" id="name" name="name" value="<%=user.getName()%>" required>
			</div>

			<!-- Email -->
			<div class="mb-3">
				<label for="email" class="form-label">Email address</label> <input
					type="email" class="form-control" id="email" name="email" value="<%=user.getEmail()%>" required>
			</div>

			<!-- Phone -->
			<div class="mb-3">
				<label for="phone" class="form-label">Phone Number</label> <input
					type="tel" class="form-control" id="phone" name="phone" value="<%=user.getPhone()%>">
			</div>

			<!-- Brand -->
			<div class="mb-3">
				<label for="brand" class="form-label">Brand</label> <select
					class="form-select" id="brand" name="brand" required>
					<option selected disabled>Choose brand</option>
					<option>Apple</option>
					<option>Samsung</option>
					<option>Xiaomi</option>
					<option>OnePlus</option>
					<option>Other</option>
				</select>
			</div>

			<!-- Model -->
			<div class="mb-3">
				<label for="model" class="form-label">Model</label> <input
					type="text" class="form-control" id="model" name="model" required>
			</div>

			<!-- Storage -->
			<div class="mb-3">
				<label for="storage" class="form-label">Storage Capacity</label> <select
					class="form-select" id="storage" name="storage" required>
					<option selected disabled>Choose storage</option>
					<option>32 GB</option>
					<option>64 GB</option>
					<option>128 GB</option>
					<option>256 GB</option>
					<option>512 GB</option>
				</select>
			</div>

			<!-- Condition -->
			<div class="mb-3">
				<label for="condition" class="form-label">Condition</label> <select
					class="form-select" id="condition" name="condition" required>
					<option selected disabled>Select condition</option>
					<option>New</option>
					<option>Like New</option>
					<option>Good</option>
					<option>Fair</option>
					<option>Damaged</option>
				</select>
			</div>

			<!-- Expected Price -->
			<div class="mb-3">
				<label for="price" class="form-label">Expected Price ($)</label> <input
					type="number" class="form-control" id="price" name="price" required>
			</div>

			<!-- Comments -->
			<div class="mb-3">
				<label for="comments" class="form-label">Additional Comments</label>
				<textarea class="form-control" id="comments" name="comments"
					rows="3"></textarea>
			</div>

			<!-- Image Upload -->
			<div class="mb-3">
				<label for="image" class="form-label">Upload Phone Image</label> <input
					class="form-control" type="file" id="image" name="image"
					accept="image/*">
			</div>

			<!-- Submit Button -->
			<button type="submit" class="btn btn-success">Submit</button>

		</form>
	</div>
	<%
	} else {
	%>

	<%
	request.setAttribute("msg", "please login with user then access it");

	request.getRequestDispatcher("login.jsp").forward(request, response);
	%>

	<%
	}
	%>
</body>
</html>
