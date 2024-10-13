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
import com.registration.customerregistration;
import com.registration.registrationDBUtil;


@WebServlet("/DeleteOrderServlet")
public class DeleteOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if(session == null || session.getAttribute("email") == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		
		PrintWriter out = response.getWriter();
		response.setContentType("text.html");
		
		String id = request.getParameter("oid");
		
		boolean isTrue;
		
		isTrue = OrderDBUtil.deleteOrderDetails(id);
		
		if(isTrue == true) {
			request.setAttribute("deleteStatus", "success");
			RequestDispatcher dis = request.getRequestDispatcher("orderplacement.jsp");
			dis.forward(request, response);
		} 		else {
			List<order> orders = OrderDBUtil.getUpdatedOrders(id);
			request.setAttribute("orders", orders);
			
			request.setAttribute("deleteStatus", "fail");
			RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
			dis.forward(request, response);
		}
	}
	}


