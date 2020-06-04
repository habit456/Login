<%@page import="com.joshuakaplan.Person"%>
<%@page import="com.joshuakaplan.Main"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title>
<link href="index-style.css" type="text/css" rel="stylesheet" />
</head>
<body class="container">


	<h1 id="signup-h1">SignUp</h1>
	<form id="form" action="creating.jsp" method="post">
		<label for="name">Name: <input type="text" id="name"
			name="name" required="required"></label> <label for="age">Age:
			<input type="number" id="age" name="age" required="required">
		</label>
		<%
			boolean isInvalid;
		if (request.getAttribute("isInvalid") == null) {
			isInvalid = false;
		} else {
			isInvalid = (boolean) request.getAttribute("isInvalid");
		}

		if (isInvalid) {
			out.println("<div id=\"username-warning-div\">");
			out.println("<p>The desired username is already in use. Please use another.</p>");
			out.println("</div>");
		}
		%>
		<label for="username">Username: <input type="text"
			id="username" name="username" required="required"></label> <label
			for="name">Password: <input type="password" id="password"
			name="password" required="required"></label>
		<button type="submit">Submit</button>
	</form>
</body>
</html>