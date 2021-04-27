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
<jsp:include page="Menu.jsp"/>
<%
String user=(String)session.getAttribute("user");

Connection con = ConnectionHelper.getConnection();
String sql = " SELECT * FROM TranBook WHERE Username = ? order by bookid"; 			
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,user);			
ResultSet rs = ps.executeQuery();

int row=0;

while(rs.next())
{
	row=rs.getRow();
	
}

if(row>0)
{
	String sql1 = "SELECT * FROM TranBook WHERE Username=? order by bookid"; 			
	PreparedStatement ps1 = con.prepareStatement(sql1);
	ps1.setString(1,user);			
	ResultSet rs1 = ps1.executeQuery();
%>
<table id="userhistory" border='3'>
<tr>
<th>Book ID</th>
<th>From Date</th></tr>

<%
while(rs1.next()){
		%>
		<tr>
		<td><%=rs1.getInt("BookId") %></td>
		<td><%=rs1.getDate("fromdate") %></td>
		</tr>
		<%
	}
	
	
}
else
{
%>
	<p class="msg">no record found</p>

<%

}

%>

</table>

</body>
</html>