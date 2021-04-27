<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.java.mphasis.jsp.library.ConnectionHelper"%>
<%@page import="java.sql.Connection"%>
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
<%
String user=(String)session.getAttribute("user");

%>
<div class="menu">
<div class="menu1">


<div class="menu1op"><%=user.toUpperCase()%></div>
<a href="index.jsp">LOG OUT</a>

</div>
<div class="menu2">
<a class="menuop" href="AccountDetails.jsp" >ACCOUNT DETAILS</a>
<a class="menuop" href="SearchBook1.jsp">SEARCH/ISSUE</a>
<a class="menuop" href="ReturnBook.jsp">RETURN</a>
<a class="menuop" href="UserHistory.jsp">HISTORY</a>
<br>
<br>
</div>
</div>
<br>


</body>
</html>								