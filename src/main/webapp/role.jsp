<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,com.database.DBConnection" %>
<%
	String username=request.getParameter("name");
	String password=request.getParameter("password");
	session.setAttribute("username",username);
	String role=request.getParameter("role");
	
	try
	{
		Connection con = DBConnection.takeConnection();	
		String query = "select name from approver where name=? AND role=? AND password=?";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, username);
	    ps.setString(2, role);
	    ps.setString(3, password);
		ResultSet rs = ps.executeQuery();
		if(rs.next()){
			if(role.equals("Legal")){
				response.sendRedirect("legalDashboard.jsp");
			}
			else if(role.equals("Management")){
				response.sendRedirect("managementDashboard.jsp");
			}
			else{
				response.sendRedirect("financeDashboard.jsp");
			}
		}
		else{
			response.sendRedirect("login.jsp");
		}
		con.close();
	}
	catch(Exception e)
	{
		out.println(e);
	}
	
	
%>