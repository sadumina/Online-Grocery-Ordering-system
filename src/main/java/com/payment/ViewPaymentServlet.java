package com.payment;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cart.Cart;
import com.cart.CartDBUtil;


@WebServlet("/ViewPaymentServlet")
public class ViewPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		if(session == null || session.getAttribute("email") == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		

		String email = (String) session.getAttribute("email");
		List<Payment> payment = PaymentDBUtil.getPaymentByEmail(email);
		request.setAttribute("payment",payment);
		
		RequestDispatcher dis = request.getRequestDispatcher("ViewPayment");
		dis.forward(request, response);
	}
	
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
//	}
}