<%@page import="java.sql.Date"%>
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
String sql = "select * from tranbook where username=? order by bookid" ;			
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

String str = "select * from tranbook where username=? order by bookid" ;			
PreparedStatement ps1 = con.prepareStatement(str);
ps1.setString(1,user);						
ResultSet rs1 = ps1.executeQuery();
%>
	<p style="font-weight: bold;margin-left: 80px;font-size: 30px">Select book to return</p>
	<form method="get" action="ReturnBookQuery.jsp">
	<table  id="userhistory" border="3">
	<tr>
	<th>BookID</th>
	<th>FromDate</th>
	<th>Select</th>
	</tr>
	
<%
	while(rs1.next())
	{
		int bid=rs1.getInt("bookid");
		Date fdate=rs1.getDate("FromDate");
		
%>
<tr>
<td><%=rs1.getInt("bookid") %></td>
<td><%=rs1.getDate("fromdate") %></td>
<td><input type="checkbox" name="issue" value="<%= rs1.getInt("bookid")%>"></td>
</tr>

<%
}
%>
	</table>
	<br>
	<input style="margin-left: 40%;"" class="subtn" type='submit' value='Return Books'>		
	
	</form>
	
<%
}
else
{
	%>
<p class="msg">no record found</p>
<%
}

%>

</body>
</html>