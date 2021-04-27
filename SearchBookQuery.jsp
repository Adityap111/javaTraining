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
<jsp:include page="Menu.jsp"/>
<%
String user=(String)session.getAttribute("user");
Connection con=ConnectionHelper.getConnection();
PreparedStatement ps;

String str=(String)request.getAttribute("str");
String str1=(String)request.getAttribute("str1");

String ar[]=str.split(" ");

%>
<p><%=ar[0]"==="+ar[1] %></p>


	
if(str1!=null)
{


	if(str.equals("1"))
	{	
	String str2="select * from Books where Id=?";
	ps=con.prepareStatement(str2);
	ps.setInt(1, Integer.parseInt(str1));
	
	ResultSet rs=ps.executeQuery();
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
		<table border="3">
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
<input type="submit" value="Issue">
</form>
<% 
	}

	else
	{
	%>
		<p>no record found</p>

	<%

	}
	
	
	}

%>


<%

if(str.equals("2"))
{	
	String str2="select * from Books where Dept=?";
	ps=con.prepareStatement(str2);
	ps.setString(1, str1);
	
	ResultSet rs=ps.executeQuery();
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
		<table border="3">
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
<input type="submit" value="Issue">
</form>
<% 
}

	else
	{
	%>
		<p>no record found</p>

	<%

	}
	
	
	}

%>

<%

if(str.equals("3"))
{	
	String str2="select * from Books where name=?";
	ps=con.prepareStatement(str2);
	ps.setString(1, str1);
	
	ResultSet rs=ps.executeQuery();
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
		<table border="3">
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
<input type="submit" value="Issue">
</form>
<% 
}

	else
	{
	%>
		<p>no record found</p>

	<%

	}
	
	
	}

%>


<%

if(str.equals("4"))
{	
	String str2="select * from Books where author=?";
	ps=con.prepareStatement(str2);
	ps.setString(1, str1);
	
	ResultSet rs=ps.executeQuery();
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
		<table border="3">
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
<input type="submit" value="Issue">
</form>
<% 
}
	else
	{
	%>
		<p>no record found</p>

	<%

	}
	
	
	}
%>

<%
}
else
{

		if(str.equals("5"))
		{	
			String str2="select * from Books";
			ps=con.prepareStatement(str2);
			
			ResultSet rs=ps.executeQuery();
			int row=0;
			while(rs.next())
			{
				row=rs.getRow();
			}
			if(row>0)
			{
				String str3="select * from Books";
				ps=con.prepareStatement(str3);
				ResultSet rs1=ps.executeQuery();
			
			%>
			<form method="post" action="IssueBook.jsp">
				<table border="3">
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
		<input type="submit" value="Issue">
		</form>
		<% 
		}

			else
			{
			%>
				<p>no record found</p>

			<%

			}
			
			
			}
		%>


<%} %>


</body>
</html>