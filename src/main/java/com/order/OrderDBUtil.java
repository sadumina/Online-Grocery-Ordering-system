package com.order;

import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.payment.Payment;
import com.product.DBConnect;
import com.registration.customerregistration;

public class OrderDBUtil {

	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	
	
	
	public static boolean insertOrder(String fname, String phone, String date, String address, String city, String region,String zip,String country ) {
		
		 boolean isSuccess = true;
	
	try {
		
		 
		con = DBConnect.getConnection();
		stmt = con.createStatement();
		String sql = "insert into orderitem values (0, '"+fname+"', '"+phone+"', '"+date+"', '"+address+"','"+city+"','"+region+"','"+zip+"','"+country+"')";
		int rs = stmt.executeUpdate(sql);
		
		if(rs > 0) {
			isSuccess = true;
		} else {
			isSuccess = false;
		}
		
	} catch(SQLException e) {
		e.printStackTrace();
	}
	
	return isSuccess;
}
	
 
  
  public static List<order> getOrderDetails(String id) {
		
		ArrayList<order> order = new ArrayList<>();
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from orderitem where oid= '"+id+"'";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int Id = rs.getInt(1);
				String fname = rs.getString(2);
				String phone = rs.getString(3);
				String date = rs.getString(4);
				String address = rs.getString(5);
				String city = rs.getString(6);
				String region = rs.getString(7);
				String zip = rs.getString(8);
				String country = rs.getString(9);
				
				order o = new order(Id,fname,phone,date,address,city,region,zip,country);
				order.add(o);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return order;
	}
  public static List<order> getCustomerByoid(String oid) {
		List<order> order = new ArrayList<>();

		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();

			String sql = "select * from orderitem where oid = '"+oid+"'";
					
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int id =rs.getInt(1);
				String name = rs.getString(2);
				String mobile = rs.getString(3);
				String date = rs.getString(4);
				String add= rs.getString(5);
				String city = rs.getString(6);
				String region = rs.getString(7);
				String zip = rs.getString(8);
				String country = rs.getString(9);
			
				order o = new order(id,name,mobile,date,add,city,region,zip,country);
				order.add(o);
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return order;
	}
	 
	 public static List<order> getAllOrders(){
		 
		 ArrayList <order> orders = new ArrayList<>();
		 
		 try {
			 
			 
			    con = DBConnect.getConnection();
				stmt = con.createStatement();
				String sql = "select * from orderitem ";
				rs = stmt.executeQuery(sql);
				
			
				while(rs.next()) {
					
					int id =rs.getInt(1);
					String name = rs.getString(2);
					String mobile = rs.getString(3);
					String date = rs.getString(4);
					String add= rs.getString(5);
					String city = rs.getString(6);
					String region = rs.getString(7);
					String zip = rs.getString(8);
					String country = rs.getString(9);
				
					order o = new order(id,name,mobile,date,add,city,region,zip,country);
					orders.add(o);
					
				}
		 
		 }catch(Exception e) {
			 
			 e.printStackTrace();
		 }
	 
		 return orders;
	 }
	 public static boolean updateOrder(String fname, String phone, String date, String address, String city, String region,String zip,String country) {
			
			try {
				con = DBConnect.getConnection();
				stmt = con.createStatement();
				String sql = "update orderitem set fullname = '"+fname+"',odate = '"+date+"', address ='"+address+"',city = '"+city+"', region = '"+region+"', zip = '"+zip+"', country = '"+country+"'  where phonenumber = '"+phone+"' ";
				int rs = stmt.executeUpdate(sql);
				
				if(rs > 0) {
					isSuccess = true;
				} else {
					isSuccess = false;
				}
				
			} catch(SQLException e) {
				e.printStackTrace();
			}
			
			return isSuccess;
		}
		
		//retrieve updated customer details
		public static List<order> getUpdatedOrders(String Id) {
			
			
			
			ArrayList<order> orderup = new ArrayList<>();
			
			try {
				con = DBConnect.getConnection();
				stmt = con.createStatement();
				String sql = "select * from orderitem where oid = '"+Id+"'";
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					int id =rs.getInt(1);
					String name = rs.getString(2);
					String mobile = rs.getString(3);
					String date = rs.getString(4);
					String add= rs.getString(5);
					String city = rs.getString(6);
					String region = rs.getString(7);
					String zip = rs.getString(8);
					String country = rs.getString(9);
					
					order o = new order(id,name,mobile,date,add,city,region,zip,country);
					orderup.add(o);
					
				}
				
			} catch(SQLException e) {
				e.printStackTrace();
			}
			
			return orderup;
		}
  public static boolean deleteOrderDetails(String oId) {
			
			try {
				con = DBConnect.getConnection();
				stmt = con.createStatement();
				String sql = "delete from orderitem where oid ='"+oId+"'";
				int rs = stmt.executeUpdate(sql);
				
				if(rs > 0) {
					isSuccess = true;
				} else {
					isSuccess = false;
				}
				
			} catch(SQLException e) {
				e.printStackTrace();
			}
			
			return isSuccess;
		}
	
}
