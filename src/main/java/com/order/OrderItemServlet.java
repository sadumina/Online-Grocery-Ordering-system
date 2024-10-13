package com.order;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.registration.customerregistration;
import com.registration.registrationDBUtil;


@WebServlet("/OrderItemServlet")
public class OrderItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		    
			String fname = request.getParameter("fullname");
			String phone = request.getParameter("phone");
			String date = request.getParameter("orderdate");
			String address = request.getParameter("add");
			String city = request.getParameter("city");
			String region = request.getParameter("region");
			String zip = request.getParameter("zip");
			String country = request.getParameter("country");
			
			
			boolean isTrue;
			
			isTrue = OrderDBUtil.insertOrder(fname, phone, date, address, city, region, zip, country);
			
			
			if(isTrue == true) {
		
			    List<order> orders= OrderDBUtil.getOrderDetails(country);
				request.setAttribute("orders", orders);
				
				RequestDispatcher dis = request.getRequestDispatcher("payment.jsp");
				dis.forward(request, response);
				
			} else {
				RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
				dis2.forward(request, response);
			}
		}

			
			
	}


