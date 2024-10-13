package com.registration;

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


@WebServlet("/DeleteRegisterServlet")
public class DeleteRegisterServlet extends HttpServlet {
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
		
		isTrue = registrationDBUtil.deleteCustomer(email);
		
		if(isTrue == true) {
			request.setAttribute("deleteStatus", "success");
			RequestDispatcher dis = request.getRequestDispatcher("registration.jsp");
			dis.forward(request, response);
		} 
		else {
			List<customerregistration> regdetails = registrationDBUtil.getUpdatedDetails(email);
			request.setAttribute("regdetails", regdetails);
			
			request.setAttribute("deleteStatus", "fail");
			RequestDispatcher dis = request.getRequestDispatcher("useraccount.jsp");
			dis.forward(request, response);
		}
	}

}
