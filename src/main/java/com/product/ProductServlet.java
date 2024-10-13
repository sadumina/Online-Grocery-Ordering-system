package com.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		if(session == null || session.getAttribute("email") == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		
		String productName = request.getParameter("prodname");
		double productPrice = Double.parseDouble(request.getParameter("prodprice"));
		String prodCategory = request.getParameter("pcategory");

		boolean isTrue;
		
		isTrue = ProductDBUtil.insertproduct(productName, productPrice, prodCategory);
		
		if(isTrue == true) {
			List<Product> prodDetails = ProductDBUtil.getAllProduct();
			List<String> categories = ProductDBUtil.getAllCatgeories();
			request.setAttribute("prodDetails", prodDetails);
			request.setAttribute("categories", categories);
			
			RequestDispatcher dis = request.getRequestDispatcher("viewproducts.jsp");
			dis.forward(request, response);
			
		} else {
			RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
			dis2.forward(request, response);
		}
	}

}
