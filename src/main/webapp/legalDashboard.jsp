<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Legal Dashboard</title>
<%@ include file="cdn.jsp" %>
<%@ page import="java.sql.*,com.database.DBConnection" %>
	
</head>
<body>
	<%
		String approverName=(String) session.getAttribute("username");
		
		if(approverName==null){
			response.sendRedirect("login.jsp");
		}
	%>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
			     <a class="navbar-brand" href="#">Legal DashBoard</a>
			 </div>
			 
			 <ul class="nav navbar-nav navbar-right">
			      <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-in"></span> LogOut</a></li>
			 </ul>
		</div>
	</nav>
	<div class="container">
		<div class="row">
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
					String query = "select * from legal order by sno desc";
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
						String approvedDate=rs.getString(7);
						String approvedBy=rs.getString(8);
						String status=rs.getString(9);
						out.println("<td>"+approvedDate+"</td>");
						out.println("<td>"+approvedBy+"</td>");
						if(!status.equals("Pending")){
							out.println("<td>"+status+"</td>");
						}else{
							out.println("<td>");
							out.println("<form action='UpdateTable' method='post'>");
							out.println("<input type='hidden' name='sno' value='"+rs.getString(1)+"'>");
							out.println("<input type='hidden' name='title' value='"+rs.getString(2)+"'>");
							out.println("<input type='hidden' name='approverName' value='"+approverName+"'>");
							out.println("<input type='submit' class='btn btn-success' name='approve_deny' value='Approve'>");
							out.println("</form>");
							out.println("</td>");
							out.println("<td>");
							out.println("<form action='UpdateTable' method='post'>");
							out.println("<input type='hidden' name='sno' value='"+rs.getString(1)+"'>");
							out.println("<input type='hidden' name='title' value='"+rs.getString(2)+"'>");
							out.println("<input type='hidden' name='approverName' value='"+approverName+"'>");
							out.println("<input type='submit' class='btn btn-danger' name='approve_deny' value='Deny'>");
							out.println("</form>");
							out.println("</td>");
						}
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
		</div>
	
	</div>
		
</body>
</html>