package com.servlet;

import java.io.IOException;
import com.database.DBConnection;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateTable
 */
@WebServlet("/UpdateTable")
public class UpdateTable extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String sno=request.getParameter("sno");
		String title=request.getParameter("title");
		String approverName=request.getParameter("approverName");
		String approve_deny=request.getParameter("approve_deny");
		Date d=new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateTime = dateFormat.format(d);
        
		try {
			
			Connection con = DBConnection.takeConnection();	
			String query1 = "update legal set approvedDate=?,status=?, approvedBy=? where sno=? ";
			String query2 = "update management set approvedDate=?,status=?,approvedBy=? where title=? ";
			PreparedStatement ps1 = con.prepareStatement(query1);
			ps1.setString(1, dateTime);
			ps1.setString(2, approve_deny);
			ps1.setString(3, approverName);
			ps1.setString(4, sno);
			ps1.executeUpdate();
			
			PreparedStatement ps2 = con.prepareStatement(query2);
			ps2.setString(1, dateTime);
			ps2.setString(2, approve_deny);
			ps2.setString(3, approverName);
			ps2.setString(4, title);
			ps2.executeUpdate();
		}catch(Exception e) {
			
			e.printStackTrace();
			
		}
		response.sendRedirect("legalDashboard.jsp");
	}

}
