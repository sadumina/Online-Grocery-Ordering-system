package com.payment;

import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.cart.Cart;
import com.product.DBConnect;
import com.registration.*;



public class PaymentDBUtil {
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
public static boolean validate(String email) {
		
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from registration where email= '"+email+"'";
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				
				isSuccess= true;
			}
			else {
				
				isSuccess= false;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	public static boolean insertPayment(String email, String cnumber, String expiredate, String cvc ) {
		
		 boolean isSuccess = true;
	
	try {
		
		 
		con = DBConnect.getConnection();
		stmt = con.createStatement();
		String sql = "insert into payment values (0, '"+email+"', '"+cnumber+"', '"+expiredate+"', '"+cvc+"')";
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

	 public static List<Payment> getById(String pid){
		 
		 int convertedId = Integer.parseInt(pid);	
		 
		 ArrayList <Payment> pay = new ArrayList<>();
		 
		 try {
			 
			 
			    con = DBConnect.getConnection();
				stmt = con.createStatement();
				String sql = "select * from payment where pid = '"+convertedId+"'";
				rs = stmt.executeQuery(sql);
				
			
				while(rs.next()) {
					
					int id =rs.getInt("pid");
					String name = rs.getString("email");
					String cnumber = rs.getString("cardnumber");
					String expiredate = rs.getString("expiredate");
					String cvv = rs.getString("cvc");
				
					Payment p = new Payment(id,name,cnumber,expiredate,cvv);
					pay.add(p);
					
				}
		 
		 }catch(Exception e) {
			 
			 e.printStackTrace();
		 }
	 
		 return pay;
		 }
	 
	 public static List<Payment> getAllPayments(){
		 
		 ArrayList <Payment> pays = new ArrayList<>();
		 
		 try {
			 
			 
			    con = DBConnect.getConnection();
				stmt = con.createStatement();
				String sql = "select * from payment ";
				rs = stmt.executeQuery(sql);
				
			
				while(rs.next()) {
					
					int id =rs.getInt("pid");
					String email = rs.getString("paymentname");
					String cnumber = rs.getString("cardnumber");
					String expiredate = rs.getString("expiredate");
					String cvv = rs.getString("cvc");
				
					Payment p = new Payment(id,email,cnumber,expiredate,cvv);
					pays.add(p);
					
				}
		 
		 }catch(Exception e) {
			 
			 e.printStackTrace();
		 }
	 
		 return pays;
	 }
	 
	 public static List<Payment> getPaymentByEmail(String email) {
			List<Payment> payment = new ArrayList<>();
			
			try {
				con = DBConnect.getConnection();
				stmt = con.createStatement();
				
				String sql = "select p.* from payment p inner join registration r on p.email = r.email where r.email = '"+email+"'";
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					
					int id = rs.getInt("pid");
					String email1 = rs.getString("email");
					String cnumber = rs.getString("cardnumber");
					String expiredate = rs.getString("expiredate");
					String cvc = rs.getString("cvc");
					
					Payment pay= new Payment(id,email1,cnumber,expiredate,cvc);
					
					payment.add(pay);
				}
				
			} catch(SQLException e) {
				e.printStackTrace();
			}
			
			return payment;
		}
	//update customer details
		public static boolean updatePayment(String email,String cardnumber, String expiredate, String cvc) {
			
			try {
				con = DBConnect.getConnection();
				stmt = con.createStatement();
				String sql = "update payment set cardnumber= '"+cardnumber+"', expiredate = '"+expiredate+"', cvc = '"+cvc+"' where email='"+email+"'";
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
		public static List<Payment> getUpdatedPayments(String Email) {
			
			
			
			ArrayList<Payment> payup = new ArrayList<>();
			
			try {
				con = DBConnect.getConnection();
				stmt = con.createStatement();
				String sql = "select * from payment where email= '"+Email+"'";
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					int id = rs.getInt("pid");
					String email= rs.getString("email");
					String cardnum = rs.getString("cardnumber");
					String expiredate = rs.getString("expiredate");
					String cvc = rs.getString("cvc");
					
					
					Payment p = new Payment(id,email,cardnum,expiredate,cvc);
					payup.add(p);
				}
				
			} catch(SQLException e) {
				e.printStackTrace();
			}
			
			return payup;
		}
	 
		//Delete customer account
		public static boolean deletePaymentDetails(String email) {
			
			try {
				con = DBConnect.getConnection();
				stmt = con.createStatement();
				String sql = "delete from payment where email='"+email+"'";
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


