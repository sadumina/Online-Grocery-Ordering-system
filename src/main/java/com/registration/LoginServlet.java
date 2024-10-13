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


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		
		//if session is valid
		String email = request.getParameter("email");
		String password = request.getParameter("pwd");
		
		boolean isTrue;
		
		isTrue = registrationDBUtil.validate(email, password);
		
		if(isTrue == true) {
			
			List<customerregistration> regdetails = registrationDBUtil.getRegistrationDetailsToValidate(email);
			request.setAttribute("regdetails", regdetails);
			
			//create session and store email
			HttpSession session = request.getSession();
			session.setAttribute("email", email);
			session.setAttribute("isLoggedIn", true);
			
			session.setMaxInactiveInterval(3 * 60);
			
			//determine user role by email
			String role = getRoleByEmail(email);
			request.setAttribute("role", role);
			
			if(role.equals("manager")) {
				RequestDispatcher dis = request.getRequestDispatcher("dashboard.jsp");
				dis.forward(request, response);
				
			} else if(role.equals("supplier")) {
				RequestDispatcher dis = request.getRequestDispatcher("dashboard.jsp");
				dis.forward(request, response);
				
			} else if(role.equals("deliver")) {
				RequestDispatcher dis = request.getRequestDispatcher("dashboard.jsp");
				dis.forward(request, response);
			
			} else if(role.equals("customer")){
				RequestDispatcher dis = request.getRequestDispatcher("viewproducts");
				dis.forward(request, response);
				
			} else {
				RequestDispatcher dis = request.getRequestDispatcher("viewproducts");
				dis.forward(request, response);
			}
			
			//check if the session is exist an still valid 
//			session = request.getSession(false);
//			if(session == null || session.getAttribute("email") == null) {
//				response.sendRedirect("login.jsp");
//				return;
//			}
			
			
		} else {
			out.println("<script type='text/javascript'>");
			out.println("alert('Your username or password is incorrect!');");
			out.println("location='login.jsp'");
			out.println("</script>");
		}
	}
	
	private String getRoleByEmail(String email) {
		if(email.endsWith("@manager.com")) {
			return "manager";
			
		} else if(email.endsWith("@supplier.com")) {
			return "supplier";
			
		} else if(email.endsWith("@deliver.com")) {
			return "deliver";
			
		} else {
			return "customer";
		}
	}
}