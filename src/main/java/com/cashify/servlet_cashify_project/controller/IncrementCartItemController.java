package com.cashify.servlet_cashify_project.controller;

import java.io.IOException;

import com.cashify.servlet_cashify_project.dao.CartItemDao;
import com.cashify.servlet_cashify_project.dao.OldPhoneDao;
import com.cashify.servlet_cashify_project.dto.CartItems;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(value = "/incrementCartItems")
public class IncrementCartItemController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("itemsId"));

		CartItemDao cartItemDao = new CartItemDao();

		CartItems cartItems = cartItemDao.getCartItemsByItemsIdDao(id);

		double price = new OldPhoneDao().getOldPhonePriceByIdDao(cartItems.getProductid());

		int updatequantity = cartItems.getQuantity() + 1;

		double updateprice = price * updatequantity;

		boolean b = cartItemDao.updateCartItemsQuantityAndPriceDao(updatequantity, updateprice, id);

		if (b) {
			resp.sendRedirect("user-cart.jsp");
		}
	}
}
