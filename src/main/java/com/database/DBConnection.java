package com.database;

import java.sql.*;

public class DBConnection {
	
	public static Connection takeConnection() {
		Connection conn=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/batch1","root","abc@123#G");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	public static int insertManagementData(String title,String description,String name,String dateTime,String department) {
		int status=0;
		try {
			Connection conn=takeConnection();
			String query="insert into management(title,description,name,dateTime,department,approvedDate,approvedBy,status) values(?,?,?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1, title);
			ps.setString(2, description);
			ps.setString(3, name);
			ps.setString(4, dateTime);
			ps.setString(5, department);
			ps.setString(6, "Pending");
			ps.setString(7, "Pending");
			ps.setString(8, "Pending");
			status=ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	public static int insertLegalData(String title,String description,String name,String dateTime) {
		int status=0;
		try {
			Connection conn=takeConnection();
			String query="insert into legal(title,description,name,dateTime,department,approvedDate,approvedBy,status) values(?,?,?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1, title);
			ps.setString(2, description);
			ps.setString(3, name);
			ps.setString(4, dateTime);
			ps.setString(5, "Management");
			ps.setString(6, "Pending");
			ps.setString(7, "Pending");
			ps.setString(8, "Pending");
			status=ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	
	public static int insertFinanceData(String title,String description,String name,String dateTime) {
		int status=0;
		try {
			Connection conn=takeConnection();
			String query="insert into finance(title,description,name,dateTime,department,approvedDate,approvedBy,status) values(?,?,?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1, title);
			ps.setString(2, description);
			ps.setString(3, name);
			ps.setString(4, dateTime);
			ps.setString(5, "Management");
			ps.setString(6, "Pending");
			ps.setString(7, "Pending");
			ps.setString(8, "Pending");
			status=ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}
}
