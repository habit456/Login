<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>
<link href="index-style.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<%! 
		private String name; 
	%>
	<%
		Cookie[] cookies = request.getCookies();
		String name = "default";
		for (Cookie cookie: cookies) {
			if (cookie.getName().equals("name")) {
				name = cookie.getValue();
			}
		}
		
		this.name = name;
	%>
	<div id="welcome-div" class="container">
		<h1>Login Successful</h1>
		<h2>Welcome, <%=name%></h2>
	</div>
</body>
</html>