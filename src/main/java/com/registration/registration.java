package com.registration;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/registration")
public class registration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
            protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            	
            	String fname=request.getParameter("fname");
            	String lname=request.getParameter("lname");
            	String username=request.getParameter("email");
            	String phone=request.getParameter("pnum");
            	String password=request.getParameter("pwd");
            	try {
            	boolean regdetails= registrationDBUtil.validate(username, password);
            	request.setAttribute("regdetails", regdetails);
            	}
            	catch(Exception e) {
            		e.printStackTrace();
            	}
            	RequestDispatcher dis= request.getRequestDispatcher("viewproducts");
            	dis.forward(request, response);
            	
			}












	

}
