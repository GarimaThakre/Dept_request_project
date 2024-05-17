<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.database.DBConnection" %>
<%
	String title=request.getParameter("title");
	String description=request.getParameter("description");
	String senderName=request.getParameter("senderName");
	String dateTime=request.getParameter("dateTime");
	String department=request.getParameter("department");
	if(department.equals("Legal")){
		int status =DBConnection.insertManagementData(title, description, senderName, dateTime, department);
		int status1=DBConnection.insertLegalData(title, description, senderName, dateTime);
	}else{
		int status2 =DBConnection.insertManagementData(title, description, senderName, dateTime,department);
		int status3 =DBConnection.insertFinanceData(title, description, senderName, dateTime);
	}
	
	response.sendRedirect("managementDashboard.jsp");
	
%>
