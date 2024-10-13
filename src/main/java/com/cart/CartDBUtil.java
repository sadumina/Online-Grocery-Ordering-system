package com.cart;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.product.DBConnect;

public class CartDBUtil {
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
//	public static boolean insertProductToCart(int productId, int quantity, double price, String name) 
	public static boolean insertProductToCart(String productId, int quantity, double price, String name, String email){
		
		isSuccess = false;
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "insert into cart values (0, '"+productId+"', '"+quantity+"', '"+price+"', '"+name+"', '"+email+"')";
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess = true;
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
//	public static List<Cart> getCartItems(int id) 
	public static List<Cart> getCartItems(String id) {
		
		//int convertedID = Integer.parseInt(id);
		
		ArrayList<Cart> cartItems = new ArrayList<>();
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from cart where productid='"+id+"'";
					
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				String name = rs.getString("prodname");
				int quantity = rs.getInt("quantity");
				double price = rs.getDouble("price");
				
				Cart cart = new Cart(name, price, quantity);
				cartItems.add(cart);
				
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return cartItems;
	}
	
	//get cart items to the cart by email
	public static List<Cart> getCartItemsByEmail(String email) {
		List<Cart> cartItems = new ArrayList<>();
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "select c.* from cart c inner join registration r on c.email = r.email where r.email = '"+email+"'";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				String name = rs.getString("prodname");
				double price = rs.getDouble("price");
				int quantity = rs.getInt("quantity");
				
				Cart cartItem = new Cart(name, price, quantity);
				cartItems.add(cartItem);
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return cartItems;
	}
	
	
}
