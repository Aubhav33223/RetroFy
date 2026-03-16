<%@page import="com.cashify.servlet_cashify_project.dto.Cart"%>
<%@page import="com.cashify.servlet_cashify_project.dto.User"%>
<%@page import="com.cashify.servlet_cashify_project.dao.UserDao"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="java.util.Base64"%>
<%@page import="com.cashify.servlet_cashify_project.dto.OldPhone"%>
<%@page import="com.cashify.servlet_cashify_project.dao.OldPhoneDao"%>
<%@page import="com.cashify.servlet_cashify_project.dto.CartItems"%>
<%@page import="java.util.List"%>
<%@page import="com.cashify.servlet_cashify_project.dao.CartItemDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Cart</title>
<meta name="viewport" content="width=device-width, initial-scale=1"
	charset="UTF-8">
<style>
/* Responsive CSS */
.cart-container {
	width: 90%;
	margin: auto;
}

.cart-item {
	display: flex;
	flex-wrap: wrap;
	align-items: center;
	border-bottom: 1px solid #ccc;
	padding: 15px 0;
}

.cart-item img {
	width: 100px;
	height: auto;
	margin-right: 20px;
}

.item-info {
	flex: 2;
}

.item-actions {
	display: flex;
	align-items: center;
	gap: 10px;
}

@media ( max-width : 600px) {
	.cart-item {
		flex-direction: column;
		align-items: flex-start;
	}
	.item-actions {
		margin-top: 10px;
	}
}

button {
	padding: 5px 10px;
}
</style>
</head>
<body>
	<div class="cart-container">
		<h2>Your Cart</h2>
		<%
		OldPhoneDao dao=new OldPhoneDao();
		
		CartItemDao cartItemDao=new CartItemDao();
		
		UserDao userDao = new UserDao();
		
		HttpSession httpSession  = request.getSession();
		
		String email=(String)httpSession.getAttribute("userSession");
		
		User user = userDao.getUserByEmailDao(email);
		
		Cart cart=cartItemDao.getCartDetails(user.getId());
		
		
		
		if(cart!=null){
		List<CartItems> cartItems = cartItemDao.getCartItemsByCartId(cart.getId());
		if (cartItems == null || cartItems.isEmpty()) {
		%>
		<p>Your cart is empty.</p>
		<%
		} else {
		for (CartItems items : cartItems) {
			
			OldPhone oldPhone=dao.getOldPhoneByIdDao(items.getProductid());
			
		%>
		<div class="cart-item">
			<img
				src="data:image/png;base64,<%=Base64.getEncoder().encodeToString(oldPhone.getImage())%>"
				alt="Product Image" />
			<div class="item-info">
				<h4><%=oldPhone.getBrand()%></h4>
				<h4><%=oldPhone.getModel()%></h4>
				<p>
					Price:₹<%=items.getPrice()%></p>
			</div>
			<div class="item-actions">
				<form action="decrementCartItems" method="post"
					style="display: inline;">
					<input type="hidden" name="itemsId" value="<%=items.getItemsid()%>" />
					<button name="action" value="decrease">-</button>
				</form>
				<span>Qty:<%=items.getQuantity()%></span>
				<form action="incrementCartItems" method="post"
					style="display: inline;">
					<input type="hidden" name="itemsId" value="<%=items.getItemsid()%>" />
					<button name="action" value="increase">+</button>
				</form>
			</div>
		</div>
		<%
		}
		}}else{
		%>
			<p>your cart is empty</p>
		<%}%>
		<form action="orderCartItems" method="get">
			<input type="submit" value="BuyNow">
		</form>
	</div>
</body>
</html>