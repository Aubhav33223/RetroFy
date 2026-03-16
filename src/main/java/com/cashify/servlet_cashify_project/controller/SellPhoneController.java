package com.cashify.servlet_cashify_project.controller;

import java.io.IOException;
import java.io.InputStream;

import com.cashify.servlet_cashify_project.dao.OldPhoneDao;
import com.cashify.servlet_cashify_project.dto.OldPhone;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet(value = "/sellPhone")
@MultipartConfig(maxFileSize = 5 * 1024 * 1024 )
public class SellPhoneController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
        String email = request.getParameter("email");
        long phone = Long.parseLong(request.getParameter("phone"));
        String brand = request.getParameter("brand");
        String model = request.getParameter("model");
        String storage = request.getParameter("storage");
        String condition = request.getParameter("condition");
        double price = Double.parseDouble(request.getParameter("price"));
        String comments = request.getParameter("comments");
        
        Part part = request.getPart("image");
        
        InputStream inputStream = part.getInputStream();
        
        OldPhone oldPhone = new OldPhone();
        
        oldPhone.setId(id);
        oldPhone.setName(name);
        oldPhone.setEmail(email);
        oldPhone.setPhone(phone);
        oldPhone.setBrand(brand);
        oldPhone.setModel(model);
        oldPhone.setStorage(storage);
        oldPhone.setCondition(condition);
        oldPhone.setExpectedprice(price);
        oldPhone.setComments(comments);
        oldPhone.setImage(inputStream.readAllBytes());
        
        
        OldPhone oldPhone2=new OldPhoneDao().saveOldPhoneDao(oldPhone);
        
        if(oldPhone2!=null) {
        	System.out.println("your item registered success");
        }else {
        	System.out.println("something went wrong");
        }
        
	}
	
}
