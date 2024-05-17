<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Management Dash board</title>
<%@ include file="cdn.jsp" %>
<%@ page import="java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat" %>

</head>
<body>
	<%
		String sender=(String)session.getAttribute("username");
		if(sender==null){
			response.sendRedirect("login.jsp");
		}
	%>
	<!-- 
	
	 -->
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
			     <a class="navbar-brand" href="#">Management DashBoard</a>
			 </div>
			 
			 <ul class="nav navbar-nav navbar-right">
			      <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-in"></span> LogOut</a></li>
			 </ul>
		</div>
	</nav>
	 <div class="container">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<fieldset>
					<legend>Request Form</legend>
					<form method="post" action="insertRecord.jsp"> 
						<div class="form-group">
						    <label for="title">Request Title :</label>
						    <input type="text" name="title" class="form-control" placeholder="Enter Title">
						 </div>
						 <div class="form-group">
						    <label for="description">Request Description :</label>
						   <input type="text" name="description" class="form-control" placeholder="Enter Description of request">
						 </div>
						 <%
								Date date =new Date();
								DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						        String dateString = dateFormat.format(date);
						%>
						<input type="hidden" name="dateTime" value="<%= dateString %>">
						<input type="hidden" name="senderName" value="<%= sender %>">
						 <div class="form-group">
						    <label for="department">Select Department: :</label>
						    <select name=department class="form-control">
								<option value="Legal">Legal</option>
								<option value="Finance">Finance</option>
						</select><br>
						 </div>
						
						<input type="submit" class="btn btn-primary btn-block" value="Send Request">
					</form>
				</fieldset>
			</div>
			<div class="col-md-4"></div>
			</div>
			<hr/>
		<div class="row">

			<%@ include file="manageDisplay.jsp" %>
		</div>
	</div> 
	
</body>
</html>