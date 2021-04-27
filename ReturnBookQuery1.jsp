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
</head>

<% 
Connection con=ConnectionHelper.getConnection();

Date fromdate;
Date todate = new Date(session.getLastAccessedTime());
String user=(String)session.getAttribute("user");
String str=request.getParameter("issue");
int c=Integer.parseInt(str);
String str1[] = request.getParameterValues("issue");

for(String s: str1)
{
	Date fromdate=
	
	String str4="Insert into Transreturn(username,bookid,fromdate,todate)"+
			"values(?,?,?,?)";
	PreparedStatement ps1=con.prepareStatement(str4);
	ps1=con.prepareStatement(str4);
	ps1.setString(1, s);
	ps1.setString(2, );
	ps1.setDate(3,new Date(session.getLastAccessedTime()));
	ps1.executeUpdate();
	
	
}
%>

</body>
</html>