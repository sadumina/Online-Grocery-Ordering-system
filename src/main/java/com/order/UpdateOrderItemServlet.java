package com.order;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.payment.Payment;
import com.payment.PaymentDBUtil;


@WebServlet("/UpdateOrderItemServlet")
public class UpdateOrderItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if(session == null || session.getAttribute("email") == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		
		PrintWriter out = response.getWriter();
		response.setContentType("text.html");
		
		String Id = request.getParameter("oid");
		String fname = request.getParameter("fullname");
		String phone = request.getParameter("phone");
		String date = request.getParameter("orderdate");
		String address = request.getParameter("add");
		String city = request.getParameter("city");
		String region = request.getParameter("region");
		String zip = request.getParameter("zip");
		String country = request.getParameter("country");
		
		
		
		boolean isTrue;
		
		isTrue= OrderDBUtil.updateOrder(fname, phone, date, address, city, region, zip, country);
		
		if(isTrue == true) {
			
			String Email = (String) session.getAttribute("email");
			List<order> orders = OrderDBUtil.getUpdatedOrders(Id);
			request.setAttribute("orders", orders);
			
			request.setAttribute("updateStatus","success");
			
			RequestDispatcher dis= request.getRequestDispatcher("useraccountnew.jsp");
			dis.forward(request, response);
			
		}
		else {
			List<order> orders = OrderDBUtil.getUpdatedOrders(Id);
			request.setAttribute("orders",orders);
			
			request.setAttribute("updateStatus","fail");
			
			RequestDispatcher dis2= request.getRequestDispatcher("unsuccess.jsp");
			dis2.forward(request, response);
			
		
	}

	}	
	}


