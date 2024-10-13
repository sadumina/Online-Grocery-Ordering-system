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

import com.order.OrderDBUtil;
import com.order.order;


@WebServlet("/ViewFeedbackServlet")
public class ViewFeedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if(session == null || session.getAttribute("email") == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		

		String email = (String) session.getAttribute("email");
		
		List<ContactUs> feedbackDetails = FeedbackDBUtil.getAllfeedback(email);
		request.setAttribute("feedbackDetails",feedbackDetails);
		
		RequestDispatcher dis = request.getRequestDispatcher("viewfeed.jsp");
		dis.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
