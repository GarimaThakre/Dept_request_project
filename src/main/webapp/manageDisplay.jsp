<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Display</title>
<%@ include file="cdn.jsp" %>
<%@ page import="java.sql.*,com.database.DBConnection" %>
</head>
<body>
	
		<table class="table table-hover">
		<tr>
			<th>SNO</th>
			<th>TITLE</th>
			<th>DESCRIPTION</th>
			<th>REQUEST RAISED BY</th>
			<th>REQUEST DATE AND TIME</th>
			<th>DEPARTMENT</th>
			<th>APPROVAL DATE</th>
			<th>APPROVED BY</th>
			<th>STATUS</th>
		</tr>
		<%
		try
		{
			Connection con = DBConnection.takeConnection();	
			String query = "select * from management order by sno desc";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				out.println("<tr>");
				out.println("<td>"+rs.getString(1)+"</td>");
				out.println("<td>"+rs.getString(2)+"</td>");
				out.println("<td>"+rs.getString(3)+"</td>");
				out.println("<td>"+rs.getString(4)+"</td>");
				out.println("<td>"+rs.getString(5)+"</td>");
				out.println("<td>"+rs.getString(6)+"</td>");
				out.println("<td>"+rs.getString(7)+"</td>");
				out.println("<td>"+rs.getString(8)+"</td>");
				out.println("<td>"+rs.getString(9)+"</td>");
				out.println("</tr>");
			}
			con.close();
		}
		catch(Exception e)
		{
			out.println(e);
		}
		
		%>
		</table>
</body>
</html>