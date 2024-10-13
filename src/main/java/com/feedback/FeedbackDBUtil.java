package com.feedback;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.order.order;
import com.product.*;

public class FeedbackDBUtil {
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	
	public static boolean insertFeedbackDetails(String name, String email, String subject, String message) {
		
		isSuccess = false;
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "insert into contact values (0, '"+name+"', '"+email+"', '"+subject+"', '"+message+"')";
			 
			 int rs = stmt.executeUpdate(sql);
			 
			 if(rs > 0) {
				 isSuccess = true;
			 }
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	

 public static List<ContactUs> getAllfeedback(String email){
		 
		 ArrayList <ContactUs> contact = new ArrayList<>();
		 
		 try {
			 
			 
			    con = DBConnect.getConnection();
				stmt = con.createStatement();
				String sql = "select * from contact ";
				rs = stmt.executeQuery(sql);
				
			
				while(rs.next()) {
					
					int cid = rs.getInt("id");
					String name = rs.getString("name");
					String email1 = rs.getString("email");
					String subject = rs.getString("subject");
					String message = rs.getString("message");
					
					
					ContactUs c = new ContactUs(cid,name,email1,subject,message);
					contact.add(c);
					
				}
		 
		 }catch(Exception e) {
			 
			 e.printStackTrace();
		 }
	 
		 return contact;
	 }
 
 public static List<ContactUs> getFeedbackById(String Id) {
		List<ContactUs> contact = new ArrayList<>();
		
		int convertedID = Integer.parseInt(Id);

		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();

			String sql = "select * from contact where id = '"+Id+"'";
					
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int cid = rs.getInt("id");
				String name = rs.getString("name");
				String email1 = rs.getString("email");
				String subject = rs.getString("subject");
				String message = rs.getString("message");
				
				
				ContactUs c = new ContactUs(cid,name,email1,subject,message);
				contact.add(c);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return contact;
	}
}