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


@WebServlet("/UpdateRegisterServlet")
public class UpdateRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		if(session == null || session.getAttribute("email") == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		
		PrintWriter out = response.getWriter();
		response.setContentType("text.html");
		
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String phonenumber = request.getParameter("pnum");
		String password = request.getParameter("pwd");
		
		
		boolean isTrue;
		
		isTrue= registrationDBUtil.updateCustomer(fname, lname, email,phonenumber, password);
		
		if(isTrue == true) {
			
			List<customerregistration> regdetails = registrationDBUtil.getUpdatedDetails(email);
			request.setAttribute("regdetails", regdetails);
			
			request.setAttribute("updateStatus","success");
			
			RequestDispatcher dis= request.getRequestDispatcher("useraccount.jsp");
			dis.forward(request, response);
			
		}
		else {
			
			List<customerregistration> regdetails = registrationDBUtil.getUpdatedDetails(email);
			request.setAttribute("regdetails", regdetails);
			
			request.setAttribute("updateStatus", "fail");
			
		    RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");		
		    dis2.forward(request, response);
		}
		
	}

}
