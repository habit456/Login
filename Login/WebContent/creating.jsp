<%@page import="com.joshuakaplan.Person"%>
<%@page import="com.joshuakaplan.Main"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SignUp</title>
</head>
<body>
	<%
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		boolean success = Main.addToDatabase(new Person(name, age, username, password));
		if (success) {
			response.sendRedirect("index.jsp");
		} else {
			request.setAttribute("isInvalid", Boolean.TRUE);
			RequestDispatcher rq = request.getRequestDispatcher("create-account.jsp");
			rq.forward(request, response);
		}
	%>
</body>
</html>