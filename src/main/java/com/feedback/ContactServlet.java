package com.feedback;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if(session == null || session.getAttribute("email") == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		
		
		String name = request.getParameter("name");
		String email = (String) session.getAttribute("email");
		String subject = request.getParameter("subject");
		String message = request.getParameter("message");
		
		boolean isTrue;
		
		isTrue = FeedbackDBUtil.insertFeedbackDetails(name, email, subject, message);
		
		if(isTrue == true) {
			
			RequestDispatcher dis = request.getRequestDispatcher("Viewfeed");
			dis.forward(request, response);
				
		} else {
			RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
			dis2.forward(request, response);
		}
		
	
	}
	
	

}
