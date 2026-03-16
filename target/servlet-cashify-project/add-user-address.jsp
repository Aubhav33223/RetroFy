<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Address | Cashify</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background: #f8f9fa;
	font-family: 'Poppins', sans-serif;
}

.address-container {
	max-width: 600px;
	margin: 50px auto;
	background: #fff;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.form-label {
	font-weight: 500;
}

.btn-custom {
	background-color: #007bff;
	color: #fff;
	border: none;
}

.btn-custom:hover {
	background-color: #0056b3;
}


</style>
</head>
<body>
	<jsp:include page="user-navbar.jsp"></jsp:include>
	
	<div class="address-container">
		<h4 class="text-center mb-4">Add / Edit Address</h4>
		<form action="/addAddress" method="post">
			<div class="mb-3">
				<label for="name" class="form-label">Full Name</label> <input
					type="text" class="form-control" id="name" name="name" required>
			</div>

			<div class="mb-3">
				<label for="phone" class="form-label">Phone Number</label> <input
					type="text" class="form-control" id="phone" name="phone"
					maxlength="15" required>
			</div>

			<div class="mb-3">
				<label for="pincode" class="form-label">Pincode</label> <input
					type="text" class="form-control" id="pincode" name="pincode"
					maxlength="10" required>
			</div>

			<div class="mb-3">
				<label for="street" class="form-label">Street / House No.</label> <input
					type="text" class="form-control" id="street" name="street">
			</div>

			<div class="row">
				<div class="col-md-6 mb-3">
					<label for="city" class="form-label">City</label> <input
						type="text" class="form-control" id="city" name="city">
				</div>
				<div class="col-md-6 mb-3">
					<label for="state" class="form-label">State</label> <input
						type="text" class="form-control" id="state" name="state">
				</div>
			</div>

			<div class="mb-3">
				<label for="landmark" class="form-label">Landmark</label> <input
					type="text" class="form-control" id="landmark" name="landmark">
			</div>

			<div class="mb-3">
				<label for="type" class="form-label">Address Type</label> <select
					class="form-select" id="type" name="type">
					<option value="HOME">Home</option>
					<option value="OFFICE">Office</option>
					<option value="OTHER">Other</option>
				</select>
			</div>

			<div class="d-grid">
				<button type="submit" class="btn btn-custom btn-lg">Save
					Address</button>
			</div>
	</div>
	</form>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>