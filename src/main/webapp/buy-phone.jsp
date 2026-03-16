<%@page import="com.cashify.servlet_cashify_project.dao.OldPhoneDao"%>
<%@page import="com.cashify.servlet_cashify_project.dto.OldPhone"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Old Phones</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.card-img-top {
	height: 200px;
	object-fit: cover;
}

.discount-tag {
	background-color: red;
	color: white;
	font-size: 0.8rem;
	padding: 3px 6px;
	border-radius: 5px;
}

.price-text {
	font-size: 1.2rem;
	font-weight: bold;
}

.original-price {
	text-decoration: line-through;
	color: gray;
	font-size: 0.9rem;
}
</style>
</head>
<body>
	<jsp:include page="user-navbar.jsp"></jsp:include>
	<%
	    List<OldPhone> oldPhones=new OldPhoneDao().getAllOldPhones();
	%>

	<div class="container py-5">
		<div class="row">
			<%
			if (oldPhones != null && !oldPhones.isEmpty()) {
				for (OldPhone phone : oldPhones) {
				if(phone.getVerification().equalsIgnoreCase("yes")){
			%>
			<div class="col-md-4 mb-4">
				<div class="card h-100">
					<img class="card-img-top"
						src="data:image/jpeg;base64,<%=java.util.Base64.getEncoder().encodeToString(phone.getImage())%>"
						alt="<%=phone.getModel()%>">
					<div class="card-body">
						<h5 class="card-title"><%=phone.getBrand()%>
							-
							<%=phone.getModel()%></h5>
						<p class="card-text">
							Storage:
							<%=phone.getStorage()%><br>Condition:
							<%=phone.getCondition()%></p>

						<!-- Price and Discount -->
						<div class="d-flex justify-content-between align-items-center">
							<span class="price-text">₹<%=phone.getExpectedprice()%></span>

							<%-- Optional Discount Calculation --%>
							<%
							double originalPrice = phone.getExpectedprice() * 1.2; // e.g., 20% discount
							int discountPercent = 20;
							%>
							<div>
								<span class="original-price">₹<%=String.format("%.2f", originalPrice)%></span><br>
								<span class="discount-tag"><%=discountPercent%>% OFF</span>
							</div>
						</div>
					</div>
					<div class="card-footer text-center">
						<a href="buy?id=<%=phone.getId()%>"
							class="btn btn-success me-2">Buy Now</a> 
						<a  href="cart?id=<%=phone.getId()%>"
							class="btn btn-outline-primary">Add to Cart</a>
					</div>
				</div>
			</div>
			<%
			}
			}} else {
			%>
			<p class="text-center">No old phones available.</p>
			<%
			}
			%>
		</div>
	</div>

</body>
</html>