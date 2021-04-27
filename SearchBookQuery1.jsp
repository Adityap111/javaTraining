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
Connection con=ConnectionHelper.getConnection();
PreparedStatement ps;
ResultSet rs;
String str2=null;


String str=request.getParameter("criteria");
String str1=request.getParameter("src");

%>



<%	
if(request.getParameter("criteria")!=null)
{
if(str.equals("1"))
{	
	str2="select * from Books where Id=?";
	ps=con.prepareStatement(str2);
	ps.setInt(1, Integer.parseInt(str1));
	
	rs=ps.executeQuery();
	int row=0;
	while(rs.next())
	{
		row=rs.getRow();
	}
	if(row>0)
	{
		String str3="select * from Books where Id=?";
		ps=con.prepareStatement(str3);
		ps.setInt(1, Integer.parseInt(str1));
		
		ResultSet rs1=ps.executeQuery();
	
	%>
	<form method="post" action="IssueBook.jsp">
		<table  id="userhistory" border="3">
	<tr>
	<th>Id</th>
	<th>Name</th>
	<th>Author</th>
	<th>Edition</th>
	<th>Department</th>
	<th>Total Books</th>
	<th>Select</th>

	</tr>
	<%
	while(rs1.next())
	{
%>

<tr>
<td><%=rs1.getInt("Id") %></td>
<td><%=rs1.getString("name") %></td>
<td><%=rs1.getString("author") %></td>
<td><%=rs1.getString("edition") %></td>
<td><%=rs1.getString("dept") %></td>
<td><%=rs1.getInt("totalbooks") %></td>
<%
	if(rs1.getInt("totalbooks")>0)
	{
%>
<td><input type="checkbox" name="issue" value="<%= rs1.getInt("id")%>"></td>
<%
	}
	else
	{
%>
<td><input type="checkbox" disabled="disabled" name="issue" value="<%= rs1.getInt("id")%>"></td>
<%
	}
%>
</tr>
<% 
	}

	%>
</table>
<br>
<input style="margin-left: 50%;" class="subtn" type="submit" value="Issue">
</form>
<% 
	}

	else
	{
	%>
		<p class="msg">no record found</p>

	<%

	}

}






else if(str.equals("2"))
{	
	str2="select * from Books where dept=?";
	ps=con.prepareStatement(str2);
	ps.setString(1, str1);
	
	rs=ps.executeQuery();
	int row=0;
	while(rs.next())
	{
		row=rs.getRow();
	}
	if(row>0)
	{
		String str3="select * from Books where dept=?";
		ps=con.prepareStatement(str3);
		ps.setString(1, str1);		
		ResultSet rs1=ps.executeQuery();
	
	%>
	<form method="post" action="IssueBook.jsp">
		<table  id="userhistory" border="3">
	<tr>
	<th>Id</th>
	<th>Name</th>
	<th>Author</th>
	<th>Edition</th>
	<th>Department</th>
	<th>Total Books</th>
	<th>Select</th>

	</tr>
	<%
	while(rs1.next())
	{
%>

<tr>
<td><%=rs1.getInt("Id") %></td>
<td><%=rs1.getString("name") %></td>
<td><%=rs1.getString("author") %></td>
<td><%=rs1.getString("edition") %></td>
<td><%=rs1.getString("dept") %></td>
<td><%=rs1.getInt("totalbooks") %></td>
<%
	if(rs1.getInt("totalbooks")>0)
	{
%>
<td><input type="checkbox" name="issue" value="<%= rs1.getInt("id")%>"></td>
<%
	}
	else
	{
%>
<td><input type="checkbox" disabled="disabled" name="issue" value="<%= rs1.getInt("id")%>"></td>
<%
	}
%>
</tr>
<% 
	}

	%>
</table>
<br>
<input style="margin-left: 50%;" class="subtn" type="submit" value="Issue">
</form>
<% 
	}

	else
	{
	%>
		<p class="msg">no record found</p>

	<%

	}

}





else if(str.equals("3"))
{	
	str2="select * from Books where name=?";
	ps=con.prepareStatement(str2);
	ps.setString(1, str1);	
	rs=ps.executeQuery();
	int row=0;
	while(rs.next())
	{
		row=rs.getRow();
	}
	if(row>0)
	{
		String str3="select * from Books where name=?";
		ps=con.prepareStatement(str3);
		ps.setString(1, str1);		
		ResultSet rs1=ps.executeQuery();
	
	%>
	<form method="post" action="IssueBook.jsp">
		<table  id="userhistory" border="3">
	<tr>
	<th>Id</th>
	<th>Name</th>
	<th>Author</th>
	<th>Edition</th>
	<th>Department</th>
	<th>Total Books</th>
	<th>Select</th>

	</tr>
	<%
	while(rs1.next())
	{
%>

<tr>
<td><%=rs1.getInt("Id") %></td>
<td><%=rs1.getString("name") %></td>
<td><%=rs1.getString("author") %></td>
<td><%=rs1.getString("edition") %></td>
<td><%=rs1.getString("dept") %></td>
<td><%=rs1.getInt("totalbooks") %></td>
<%
	if(rs1.getInt("totalbooks")>0)
	{
%>
<td><input type="checkbox" name="issue" value="<%= rs1.getInt("id")%>"></td>
<%
	}
	else
	{
%>
<td><input type="checkbox" disabled="disabled" name="issue" value="<%= rs1.getInt("id")%>"></td>
<%
	}
%>
</tr>
<% 
	}

	%>
</table>
<br>
<input style="margin-left: 50%;" class="subtn" type="submit" value="Issue">
</form>
<% 
	}

	else
	{
	%>
		<p class="msg">no record found</p>

	<%

	}

}





else if(str.equals("4"))
{	
	str2="select * from Books where author=?";
	ps=con.prepareStatement(str2);
	ps.setString(1, str1);	
	rs=ps.executeQuery();
	int row=0;
	while(rs.next())
	{
		row=rs.getRow();
	}
	if(row>0)
	{
		String str3="select * from Books where author=?";
		ps=con.prepareStatement(str3);
		ps.setString(1, str1);		
		ResultSet rs1=ps.executeQuery();
	
	%>
	<form method="post" action="IssueBook.jsp">
		<table id="userhistory" border="3">
	<tr>
	<th>Id</th>
	<th>Name</th>
	<th>Author</th>
	<th>Edition</th>
	<th>Department</th>
	<th>Total Books</th>
	<th>Select</th>

	</tr>
	<%
	while(rs1.next())
	{
%>

<tr>
<td><%=rs1.getInt("Id") %></td>
<td><%=rs1.getString("name") %></td>
<td><%=rs1.getString("author") %></td>
<td><%=rs1.getString("edition") %></td>
<td><%=rs1.getString("dept") %></td>
<td><%=rs1.getInt("totalbooks") %></td>
<%
	if(rs1.getInt("totalbooks")>0)
	{
%>
<td><input type="checkbox" name="issue" value="<%= rs1.getInt("id")%>"></td>
<%
	}
	else
	{
%>
<td><input type="checkbox" disabled="disabled" name="issue" value="<%= rs1.getInt("id")%>"></td>
<%
	}
%>
</tr>
<% 
	}

	%>
</table>
<br>
<input style="margin-left: 50%;" class="subtn" type="submit" value="Issue">
</form>
<% 
	}

	else
	{
	%>
		<p class="msg">no record found</p>

	<%

	}

}






else
{	
	str2="select * from Books where name!=? OR 1=1";
	ps=con.prepareStatement(str2);
	ps.setString(1, str1);	
	rs=ps.executeQuery();
	int row=0;
	while(rs.next())
	{
		row=rs.getRow();
	}
	if(row>0)
	{
		String str3="select * from Books where name!=? OR 1=1";
		ps=con.prepareStatement(str3);
		ps.setString(1, str1);		
		ResultSet rs1=ps.executeQuery();
	
	%>
	<form method="post" action="IssueBook.jsp">
		<table id="userhistory" border="3">
	<tr>
	<th>Id</th>
	<th>Name</th>
	<th>Author</th>
	<th>Edition</th>
	<th>Department</th>
	<th>Total Books</th>
	<th>Select</th>

	</tr>
	<%
	while(rs1.next())
	{
%>

<tr>
<td><%=rs1.getInt("Id") %></td>
<td><%=rs1.getString("name") %></td>
<td><%=rs1.getString("author") %></td>
<td><%=rs1.getString("edition") %></td>
<td><%=rs1.getString("dept") %></td>
<td><%=rs1.getInt("totalbooks") %></td>
<%
	if(rs1.getInt("totalbooks")>0)
	{
%>
<td><input type="checkbox" name="issue" value="<%= rs1.getInt("id")%>"></td>
<%
	}
	else
	{
%>
<td><input type="checkbox" disabled="disabled" name="issue" value="<%= rs1.getInt("id")%>"></td>
<%
	}
%>
</tr>
<% 
	}

	%>
</table>
<br>
<input style="margin-left: 50%;" class="subtn" type="submit" value="Issue">
</form>
<% 
	}

	else
	{
	%>
		<p class="msg">no record found</p>

	<%

	}

}
}
else{
	%>
	<p class="msg">Choose / Enter value to continue</p>

<%
	
	
}
%>





</body>
</html>