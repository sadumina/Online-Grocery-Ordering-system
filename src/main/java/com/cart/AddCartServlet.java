package com.cart;

import com.product.*;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AddCartServlet")
public class AddCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		if(session == null || session.getAttribute("email") == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		
//		int productID = Integer.parseInt(request.getParameter("productid"));
		String email = (String) session.getAttribute("email");
		String productID = request.getParameter("productid");
		String prodName = request.getParameter("prodname");
		int quantity = Integer.parseInt(request.getParameter("prodQuantity"));
		double price = Double.parseDouble(request.getParameter("prodPrice"));
		
		Product product = ProductDBUtil.getProductById(productID);
		
		//check if the product exists
		
		boolean isTrue = CartDBUtil.insertProductToCart(productID, quantity, price, prodName, email);
		
		if(isTrue == true) {
			
			List<Cart> cartItems = CartDBUtil.getCartItemsByEmail(email);
			session.setAttribute("cartItems", cartItems);
			
			response.sendRedirect("viewproducts");
			 
		} else {
			RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
			dis.forward(request, response);
		}
//		if (product != null) {
//			
//			boolean isTrue = CartDBUtil.insertProductToCart(productID, quantity, price, prodName, email);
//			
//			if(isTrue == true) {
//				List<Cart> cartItems = CartDBUtil.getCartItems(productID);
//				request.getSession().setAttribute("cartItems", cartItems);
//				
//				response.sendRedirect("viewproducts");
//			} else {
//				RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
//				dis.forward(request, response);
//			}
//			
//		} else {
//			RequestDispatcher dis = request.getRequestDispatcher("nodata.jsp");
//			dis.forward(request, response);
//		}
	}
	
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//		HttpSession session = request.getSession(false);
//		if(session == null || session.getAttribute("email") == null) {
//			response.sendRedirect("login.jsp");
//			return;
//		}
//		
////		int productID = Integer.parseInt(request.getParameter("productid"));
//		String productID = request.getParameter("productid");
//		String prodName = request.getParameter("prodname");
//		int quantity = Integer.parseInt(request.getParameter("prodQuantity"));
//		double price = Double.parseDouble(request.getParameter("prodPrice"));
//		
//		Product product = ProductDBUtil.getProductById(productID);
//		
//		//check if the product exists
//		if (product != null) {
//			
//			boolean isTrue = CartDBUtil.insertProductToCart(productID, quantity, price, prodName);
//			
//			if(isTrue == true) {
//				List<Cart> cartItems = CartDBUtil.getCartItems(productID);
//				request.getSession().setAttribute("cartItems", cartItems);
//				
//				response.sendRedirect("viewproducts");
//			} else {
//				RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
//				dis.forward(request, response);
//			}
//			
//		} else {
//			RequestDispatcher dis = request.getRequestDispatcher("nodata.jsp");
//			dis.forward(request, response);
//		}
//	}

}
