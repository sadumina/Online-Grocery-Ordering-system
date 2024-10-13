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
import com.registration.customerregistration;
import com.registration.registrationDBUtil;



@WebServlet("/PaymentInsert")
public class PaymentInsert extends HttpServlet {
	
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		
		String email = request.getParameter("email");
		String cnumber = request.getParameter("cnumber");
		String exipredate = request.getParameter("expiredate");
		String cvc = request.getParameter("cvc");
		
		
		boolean isTrue;
		
		isTrue = PaymentDBUtil.insertPayment(email, cnumber, exipredate, cvc);	//check whether database connection is success
		if(isTrue == true) {
			
			
		
					List<Payment> payment = PaymentDBUtil.getPaymentByEmail(email);
					request.setAttribute("payment", payment);
				
				
			
			RequestDispatcher dis = request.getRequestDispatcher("show.jsp");
			dis.forward(request, response);
			
		} else {
			RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
			dis2.forward(request, response);
		}
	}

		
		
		
	

}
