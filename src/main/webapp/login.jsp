<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<%@ include file="cdn.jsp" %>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<fieldset>
					<legend>Login Form</legend>
					<form method="post" action="role.jsp">
						<input type="text" name="name" class="form-control" placeholder="Enter Name" required><br>
						<input type="password" name="password" class="form-control" placeholder="Enter Password" required>
						<h4>Please select your role</h4>
						<select name="role" class="form-control">
							<option value="Legal">Legal</option>
							<option value="Management">Management</option>
							<option value="Finance">Finance</option>
						</select><br>
						<input type="submit" class="btn btn-primary btn-block" value="Login">
					</form>
				</fieldset>
			</div>
			<div class="col-md-4"></div>
			
		</div>
	</div>
</body>
</html>