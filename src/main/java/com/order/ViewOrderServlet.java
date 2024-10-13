package com.order;

import java.io.IOException;

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


@WebServlet("/ViewOrderServlet")
public class ViewOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		if(session == null || session.getAttribute("email") == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		

		String email = (String) session.getAttribute("email");
		List<order> orders = OrderDBUtil.getAllOrders();
		request.setAttribute("orders",orders);
		
		RequestDispatcher dis = request.getRequestDispatcher("useraccountnew.jsp");
		dis.forward(request, response);
	
	}
	
//  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//	doGet(request, response);
//	}

}
