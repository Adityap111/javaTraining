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
</head>
<body>
<%
String user=(String)session.getAttribute("user");
Connection con=ConnectionHelper.getConnection();


	String str="select * from Tranbook where username=?";
	PreparedStatement ps=con.prepareStatement(str);
	ps.setString(1,user);
	ResultSet rs=ps.executeQuery();
%>
<form method="get" action="ReturnBookQuery.jsp">
<table border="3">
<tr>
<th>BookID</th>
<th>FromDate</th>
<th>Select</th>



<%	
	while(rs.next())
	{
%>
<tr>
<td><%=rs.getInt("bookid") %></td>
<td><%=rs.getDate("fromdate") %></td>
<td><input type="checkbox" name="issue" value="<%= rs.getInt("bookid")%>"></td>
</tr>

<%		
	}
%>
</table>
<input type="submit"value="Return book">
</form>

</body>
</html>