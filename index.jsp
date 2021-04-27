<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.java.mphasis.jsp.library.ConnectionHelper"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
<div class="container">
<center>
<h1>WELCOME TO LIBRARY</h1>
<form method="post" action="LoginCheck.jsp">
<table>
<tr><th colspan="2"><h2>PLEASE LOGIN</h2></th></tr>

<tr class="logrow">
<th>USERNAME : </th>
<td><input type="text" name="username"></td>
</tr>
</table>
<br>
<table>
<tr class="logrow">
<th>PASSWORD : </th>
<td><input type="password" name="password"></td>
</tr>

</table>


<br>
<input class="logbtn" type="submit" value="Login">
</form>

</center>
</div>
</body>
</html>