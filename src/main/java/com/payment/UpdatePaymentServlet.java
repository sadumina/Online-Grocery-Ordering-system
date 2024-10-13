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


@WebServlet("/UpdatePaymentServlet")
public class UpdatePaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		if(session == null || session.getAttribute("email") == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		
		PrintWriter out = response.getWriter();
		response.setContentType("text.html");
		
		String Id = request.getParameter("pid");
		String email = request.getParameter("email");
		String cnumber = request.getParameter("cnumber");
		String expiredate = request.getParameter("expiredate");
		String cvc = request.getParameter("cvc");
		
		
		boolean isTrue;
		
		isTrue= PaymentDBUtil.updatePayment(email, cnumber, expiredate, cvc);
		
		if(isTrue == true) {
			
			String Email = (String) session.getAttribute("email");
			List<Payment> payment = PaymentDBUtil.getUpdatedPayments(Email);
			request.setAttribute("payment", payment);
			
			request.setAttribute("updateStatus","success");
			
			RequestDispatcher dis= request.getRequestDispatcher("show.jsp");
			dis.forward(request, response);
			
		}
		else {
			List<Payment> payment = PaymentDBUtil.getUpdatedPayments(email);
			request.setAttribute("payment", payment);
			
			request.setAttribute("updateStatus","fail");
			
			RequestDispatcher dis= request.getRequestDispatcher("unsuccess.jsp");
			dis.forward(request, response);
			
		
	}

	}	
		
		
	}


