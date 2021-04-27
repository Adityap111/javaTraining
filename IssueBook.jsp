<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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
<jsp:include page="Menu.jsp"/>
<% 
Connection con=ConnectionHelper.getConnection();


String user=(String)session.getAttribute("user");
//String str=request.getParameter("issue");
//int c=Integer.parseInt(str);

if(request.getParameterValues("issue")!=null)
{
	String str1[] = request.getParameterValues("issue");	


for(String s: str1)
{
	String sql = "Select username from tranbook where bookid = ? ";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1,s);
	ResultSet rs =ps.executeQuery();
	String uname = null;
	if(rs.next()) 
	{
		uname = rs.getString("Username");
	}
	
	if(user.equals(uname))
	{
		%>
		<p class="msg">You have already issued the book with Id <%=s %></p>;
		<% 
		
	}
	else{
	String str3="update books set totalbooks=totalbooks-1 where id=?";
	PreparedStatement ps2=con.prepareStatement(str3);
	ps2.setInt(1,Integer.parseInt(s));
	ps2.executeUpdate();
	
	String str4="Insert into TranBook(username,bookid,fromdate)"+
			"values(?,?,?)";
	PreparedStatement ps1=con.prepareStatement(str4);
	ps1=con.prepareStatement(str4);
	ps1.setString(1, user);
	ps1.setString(2, s);
	ps1.setDate(3,new Date(session.getLastAccessedTime()));
	ps1.executeUpdate();
	
	%>
	<p class="msg">Book with Id <%=s %> Issued</p>;
	<% 
	
}}
}
else
{
	%>
	<p class="msg">Select book to continue</p>;
	<% 
}

%>


</body>
</html>