<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link href="index-style.css" type="text/css" rel="stylesheet" />
</head>
<body class="container">
	<h1>Login</h1>
	<div id="form-div">
		<form id="form" action="attempt.jsp" method="post">
			<label for="username" id="username-label">Username: <input type="text" name="username" id="username"></label>
			<label for="password" id="password-label">Password: <input type="password" name="password" id="password"></label>
			<label for="submit" id="submit-label"><button type="submit" id="submit">Submit</button></label>
		</form>
	</div>
	<p>Don't have an account? <a href="create-account.jsp"> Create one here. </a></p>
</body>
</html>