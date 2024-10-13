package com.registration;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/reginsert")
public class reginsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//String id = request.getParameter("id");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String phone = request.getParameter("pnum");
		String password = request.getParameter("pwd");
		
		boolean isTrue;
		
		isTrue = registrationDBUtil.insertCustomer(fname, lname, email, phone, password);
		
		//check whether database connection is success
		if(isTrue == true) {
			//if(id != null && !id.isEmpty()) {
				//int ID = Integer.parseInt(id);
				List<customerregistration> regdetails = registrationDBUtil.getRegistrationDetails(email);
				request.setAttribute("regdetails", regdetails);
			//}
			
			RequestDispatcher dis = request.getRequestDispatcher("useraccount.jsp");
			dis.forward(request, response);
			
		} else {
			RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
			dis2.forward(request, response);
		}
	}

}
