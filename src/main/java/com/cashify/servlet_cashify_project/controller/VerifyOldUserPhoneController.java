package com.cashify.servlet_cashify_project.controller;

import java.io.IOException;

import com.cashify.servlet_cashify_project.dao.OldPhoneDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(value = "/verifyOldPhone")
public class VerifyOldUserPhoneController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id = Integer.parseInt(req.getParameter("id"));
		
		String verify  = req.getParameter("verification");
		
		boolean b=new OldPhoneDao().updateOldPhoneVerification(verify, id);
		if(b) {
		resp.sendRedirect("user-oldphones.jsp");
		}
	}
}
