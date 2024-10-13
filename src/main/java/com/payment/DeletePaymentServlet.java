package com.payment;

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

import com.registration.customerregistration;
import com.registration.registrationDBUtil;


@WebServlet("/DeletePaymentServlet")
public class DeletePaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		if(session == null || session.getAttribute("email") == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		
		PrintWriter out = response.getWriter();
		response.setContentType("text.html");
		
		String email = request.getParameter("email");
		
		boolean isTrue;
		
		isTrue = PaymentDBUtil.deletePaymentDetails(email);
		
		if(isTrue == true) {
			request.setAttribute("deleteStatus", "success");
			RequestDispatcher dis = request.getRequestDispatcher("payment.jsp");
			dis.forward(request, response);
		} 
		else {
			List<Payment> payment = PaymentDBUtil.getUpdatedPayments(email);
			request.setAttribute("payment", payment);
			
			request.setAttribute("deleteStatus", "fail");
			RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
			dis.forward(request, response);
		}
	}
		
	}


