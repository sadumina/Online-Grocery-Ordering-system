package com.registration;

import com.cart.Cart;
import com.payment.Payment;
import com.payment.PaymentDBUtil;
import com.product.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

public class registrationDBUtil {

	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static PreparedStatement pstmt = null;
	private static ResultSet rs = null;

	// validate customer
	public static boolean validate(String email, String Password) {

		boolean isSuccess = false;

		try {

			con = DBConnect.getConnection();
			// stmt = con.createStatement();
			String sql = "select * from registration where email= ? and password= ?";
			// rs = stmt.executeQuery(sql);
			pstmt = con.prepareStatement(sql);

			// set the parameters

			pstmt.setString(1, email);
			pstmt.setString(2, Password);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				isSuccess = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("SQL query: " + pstmt.toString());
			System.out.println("Validation result: " + isSuccess);
		}

		return isSuccess;
	}

	// fetch registration details
	public static List<customerregistration> getRegistrationDetailsToValidate(String email) {

		List<customerregistration> regDetails = new ArrayList<>();

		try {
			con = DBConnect.getConnection();
			String sql = "select * from registration where email= '" + email + "'";
			pstmt = con.prepareStatement(sql);

			// set parameter for email
			pstmt.setString(1, email);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("id");
				String fname = rs.getString(2);
				String lname = rs.getString(3);
				String emailDB = rs.getString(4);
				String role = rs.getString(emailDB);
				String phone = rs.getString(5);
				String password = rs.getString(6);

				customerregistration cr = new customerregistration(id, fname, lname, emailDB, role, phone, password);
				regDetails.add(cr);
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}

		return regDetails;
	}

	// parse the role from the email format
//	private static String parseRoleFromEmail(String email) {
//		if(email.endsWith("@manager.com")) {
//			return "manager";
//			
//		} else if(email.endsWith("@supplier.com")) {
//			return "supplier";
//			
//		} else if(email.endsWith("@deliver.com")) {
//			return "deliver";
//			
//		} else {
//			return "customer";
//		}
//		
//	}
	// insert customer details
	public static boolean insertCustomer(String fname, String lname, String email, String phone, String password) {

		isSuccess = true;

		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "insert into registration values (0, '" + fname + "', '" + lname + "', '" + email + "', '"
					+ phone + "', '" + password + "')";
			int rs = stmt.executeUpdate(sql);

			if (rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return isSuccess;
	}

	public static List<customerregistration> getRegistrationDetails(String Email) {

		ArrayList<customerregistration> cus = new ArrayList<>();

		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from registration where email= '" + Email + "'";
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int Id = rs.getInt(1);
				String fname = rs.getString(2);
				String lname = rs.getString(3);
				String email = rs.getString(4);
				String phone = rs.getString(5);
				String password = rs.getString(6);

				customerregistration c = new customerregistration(Id, fname, lname, email, phone, password);
				cus.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return cus;
	}

	// update customer details
	public static boolean updateCustomer(String fname, String lname, String email, String phone, String password) {

		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "update registration set firstname= '" + fname + "', lastname= '" + lname + "', phonenumber= '"
					+ phone + "', password= '" + password + "' where email='" + email + "'";
			int rs = stmt.executeUpdate(sql);

			if (rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return isSuccess;
	}

	// retrieve updated customer details
	public static List<customerregistration> getUpdatedDetails(String Email) {

		// int convertedId = Integer.parseInt(Id);

		ArrayList<customerregistration> cusup = new ArrayList<>();

		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from registration where email= '" + Email + "'";
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int id = rs.getInt(1);
				String fname = rs.getString(2);
				String lname = rs.getString(3);
				String email = rs.getString(4);
				String phone = rs.getString(5);
				String password = rs.getString(6);

				customerregistration c = new customerregistration(id, fname, lname, email, phone, password);
				cusup.add(c);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return cusup;
	}

	// Delete customer account
	public static boolean deleteCustomer(String email) {

		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "delete from registration where email='" + email + "'";
			int rs = stmt.executeUpdate(sql);

			if (rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return isSuccess;
	}

	public static List<customerregistration> getCustomerByEmail(String email) {
		List<customerregistration> reg = new ArrayList<>();

		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();

			String sql = "select * from registration where email = '"+email+"'";
					
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int id = rs.getInt(1);
				String fname = rs.getString(2);
				String lname = rs.getString(3);
				String email1 = rs.getString(4);
				String phone = rs.getString(5);
				String password = rs.getString(6);

				customerregistration c = new customerregistration(id, fname, lname, email1, phone, password);
				reg.add(c);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return reg;
	}
}
