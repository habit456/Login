<%@page import="com.joshuakaplan.Database, com.joshuakaplan.Person, com.joshuakaplan.Main"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Attempt</title>
</head>
<body>
	<%
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		Person person = Main.getFromDatabase(username, password);
		
		if (person != null) {
			Cookie cookie = new Cookie("name", person.getName().split(" ")[0]);
			response.addCookie(cookie);
			response.sendRedirect("welcome.jsp");
		} else {
			response.sendRedirect("index.jsp");
		}
		
	%>
</body>
</html>