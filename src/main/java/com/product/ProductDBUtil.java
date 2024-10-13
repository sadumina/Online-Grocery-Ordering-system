package com.product;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProductDBUtil {
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	//get all the available products
	public static List<Product> getAllProduct() {
		
		ArrayList<Product> product = new ArrayList<>();
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from products";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				double price = rs.getDouble(3);
				String category = rs.getString(4);
				
				Product p = new Product(id, name, price, category);
				product.add(p);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return product;
	}
	
	//get all products categories
	public static List<String> getAllCatgeories() {
		List<String> categories = new ArrayList<>();
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select distinct category from products";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				String category = rs.getString("category");
				categories.add(category);
			}
		} 
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return categories;
	}
	
	//getting products by categories
	public static List<Product> getProductsByCategory(String category) {
		List<Product> products = new ArrayList<>();
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from products where category='"+category+"'";
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				double price = rs.getDouble(3);
				String prodCategory = rs.getString(4);
				
				Product p = new Product(id, name, price, prodCategory);
				products.add(p);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return products;
	}
	
	//retrieve product by id
	public static Product getProductById(String productId) {
//		List<Product> products = new ArrayList<>();
		
		Product product = null;
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "select * from products where productid= '"+productId+"'";
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				String name = rs.getString("prodname");
				double price = rs.getDouble("price");
				
				product = new Product(name, price);
				//Product p = new Product(name, price);
				//products.add(p);
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return product;
		
	}
	
	//insert products to database
	public static boolean insertproduct(String productName, double price, String category) {
		
		isSuccess = false;
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "insert into products values(0, '"+productName+"', '"+price+"', '"+category+"')";
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
}
