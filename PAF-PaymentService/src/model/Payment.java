package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class Payment {
	
	public Connection connect() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = (Connection) DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/ayurwedhap", "root", "");
			// For testing
			System.out.print("Successfully connected");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

	public String insertPay(String Patient_id, String Appointment_id, String Fees, String Card_id) {
		String output = "";
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database";
			}
			// create a prepared statement
			String query = "insert into payment( payment_id, Patient_id, Appointment_id, Fees, Card_id)"
					+ " values ( ?,  ?,  ?,  ?,  ?)";
			PreparedStatement preparedStmt = con.prepareStatement(query);

			// binding values
			preparedStmt.setInt(1, 0);
			preparedStmt.setString(2, Patient_id);
			preparedStmt.setString(3, Appointment_id);
			preparedStmt.setString(4, Fees);
			preparedStmt.setString(5, Card_id);
			
			// execute the statement    
			preparedStmt.execute();    
			con.close(); 
	   
			String newPayment = readPayment(); 
			output =  "{\"status\":\"success\", \"data\": \"" + newPayment + "\"}";    
		}   
		catch (Exception e)   
		{    
			output =  "{\"status\":\"error\", \"data\": \"Error while inserting the payment.\"}";  
			System.err.println(e.getMessage());   
		} 
		
	  return output;  
	} 
	
	public String readPayment()  
	{   
		String output = ""; 
	
		try   
		{    
			Connection con = connect(); 
		
			if (con == null)    
			{
				return "Error while connecting to the database for reading."; 
			} 
	 
			// Prepare the html table to be displayed    
			output = "<table border='1'><tr><th>Patient Id</th><th>Appointment Id</th><th>Fees</th><th>Card Id</th><th>Update</th><th>Remove</th></tr>"; 
	 
			String query = "select * from payment";    
			Statement stmt = con.createStatement();    
			ResultSet rs = stmt.executeQuery(query); 
	 
			// iterate through the rows in the result set    
			while (rs.next())    
			{     
				String payment_id = Integer.toString(rs.getInt("payment_id"));
				String Patient_id = rs.getString("Patient_id");
				String Appointment_id = rs.getString("Appointment_id");
				String Fees = rs.getString("Fees");
				String Card_id= rs.getString("Card_id");
				
	 
				// Add into the html table 
				output += "<tr><td><input id=\'hidItemIDUpdate\' name=\'hidItemIDUpdate\' type=\'hidden\' value=\'" + payment_id + "'>" 
							+ Patient_id + "</td>";      
				output += "<td>" + Appointment_id + "</td>";     
				output += "<td>" + Fees + "</td>";
				output += "<td>" + Card_id + "</td>";
				
	 
				// buttons     
//				output += "<td><input name=\'btnUpdate\' type=\'button\' value=\'Update\' class=\' btnUpdate btn btn-secondary\'></td>"
//						//+ "<td><form method=\"post\" action=\"items.jsp\">      "
//						+ "<input name=\'btnRemove\' type=\'submit\' value=\'Remove\' class=\'btn btn-danger\'> "
//						+ "<input name=\"hidItemIDDelete\" type=\"hidden\" value=\"" + itemID + "\">" + "</form></td></tr>"; 
				output +="<td><input name='btnUpdate' type='button' value='Update' class='btnUpdate btn btn-secondary'></td>"       
							+ "<td><input name='btnRemove' type='button' value='Remove' class='btnRemove btn btn-danger' data-payment_id='" + payment_id + "'>" + "</td></tr>"; 
			} 
	 
			con.close(); 
	 
			// Complete the html table    
			output += "</table>";   
		}   
		catch (Exception e)   
		{    
			output = "Error while reading the items.";    
			System.err.println(e.getMessage());   
		} 
	 
		return output;  
	}
	 
	
	public String updatePayment(String payment_id, String Patient_id, String Appointment_id, String Fees, String Card_id) {
		String output = "";
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for updating.";
			}
			// create a prepared statement
			String query = "UPDATE payment SET Patient_id=?, Appointment_id=?,Fees=?,Card_id=? WHERE payment_id=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setString(1, Patient_id);
			preparedStmt.setString(2, Appointment_id);
			preparedStmt.setString(3, Fees);
			preparedStmt.setString(4, Card_id);
			preparedStmt.setInt(5, Integer.parseInt(payment_id));	 
			
			// execute the statement    
			preparedStmt.execute();    
			con.close(); 
	 
			String newPayment = readPayment();    
			output = "{\"status\":\"success\", \"data\": \"" +        
					newPayment + "\"}";    
		}   
		catch (Exception e)   
		{    
			output =  "{\"status\":\"error\", \"data\": \"Error while updating the payment.\"}";   
			System.err.println(e.getMessage());   
		} 
	 
	  return output;  
	} 
	
	public String deletePayment(String payment_id) {
		String output = "";
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for deleting.";
			}
			// create a prepared statement
			String query = "delete from payment where payment_id=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setInt(1, Integer.parseInt(payment_id));
	 
			// execute the statement    
			preparedStmt.execute();    
			con.close(); 
	 
			String newPayment = readPayment();    
			output = "{\"status\":\"success\", \"data\": \"" +       
					newPayment + "\"}";    
		}   
		catch (Exception e)   
		{    
			output = "Error while deleting the payment.";    
			System.err.println(e.getMessage());   
		} 
	 
		return output;  
	}
	 
	 
}