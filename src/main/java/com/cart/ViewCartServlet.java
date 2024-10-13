package com.cart;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ViewCartServlet")
public class ViewCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		if(session == null || session.getAttribute("email") == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		
//		String Id = request.getParameter("productid");
//		List<Cart> cartItems = CartDBUtil.getCartItems(Id);
		
		
//		request.getSession().setAttribute("cartItems", cartItems);
		
		String email = (String) session.getAttribute("email");
		List<Cart> cartItems = CartDBUtil.getCartItemsByEmail(email);
		request.setAttribute("cartItems", cartItems);
		
		RequestDispatcher dis = request.getRequestDispatcher("viewcart.jsp");
		dis.forward(request, response);
	}
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
 