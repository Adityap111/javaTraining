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
</head>
<body>
<%
		String user = request.getParameter("username");
		String pwd = request.getParameter("password");
		session.setAttribute("user", user);
		Connection con = ConnectionHelper.getConnection();
		String cmd = "select count(*) cnt from LibUsers where username = ? and password = ?";
		PreparedStatement pst = con.prepareStatement(cmd);
		pst.setString(1, user);
		pst.setString(2, pwd);
		ResultSet rs = pst.executeQuery();
		rs.next();
		int count = rs.getInt("cnt");
		if(count == 1) {
			response.sendRedirect("Menu.jsp");
	%>
	
	<% 
		} else { 
	%>
		<jsp:include page="index.jsp" />
		<p class="msg"> Invalid Credential....</p>
	<% 
		}
	%>
</body>
</html>