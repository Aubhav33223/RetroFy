package com.cashify.servlet_cashify_project.controller;

import java.io.IOException;
import java.util.List;

import com.cashify.servlet_cashify_project.dao.CartItemDao;
import com.cashify.servlet_cashify_project.dto.CartItems;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(value = "/orderCartItems")
public class OrderCartItemsController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<CartItems> cartItems=new CartItemDao().getAllCartItemsDetails();
		
		System.out.println(cartItems.size());
	}
}
