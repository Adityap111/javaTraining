<%@page import="java.sql.Date"%>
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
<jsp:include page="Menu.jsp"/>
<%

String user=(String)session.getAttribute("user");
Connection con=ConnectionHelper.getConnection();
	
if(request.getParameterValues("issue")!=null)
{

String str1[] = request.getParameterValues("issue");
		

			for(String s : str1)
			{
			String s1="select * from tranbook where username=?";
			PreparedStatement ps=con.prepareStatement(s1);
			ps.setString(1,user);
			
			ResultSet rs=ps.executeQuery();
			String uname = null;
			Date fdate;
			Date tdate =new Date(session.getLastAccessedTime());
			
			if(rs.next())
			{
			uname = rs.getString("Username");
			fdate = rs.getDate("Fromdate");
					
			
			String s2="insert into transreturn values(?,?,?,?)" ;
			PreparedStatement ps2=con.prepareStatement(s2);
			ps2.setString(1,user);
			ps2.setString(2,s);
			ps2.setDate(3,fdate);
			ps2.setDate(4,tdate);
			ps2.executeUpdate();
																	
			
			String s3="update books set totalbooks=totalbooks+1 where id=?";
			PreparedStatement ps4=con.prepareStatement(s3);
			ps4.setInt(1,Integer.parseInt(s));
			ps4.executeUpdate();
			
			String s4="Delete from tranbook where bookid=? and username=?";
			PreparedStatement ps1 = con.prepareStatement(s4);
			ps1.setString(1,s);
			ps1.setString(2,user);
			ps1.executeUpdate();
			%>
			<p class="msg">Book with Id <%=s %> returned </p>
			<%	
			
			}
			}
}
else{
	
	%>
	<p class="msg">Select Book To Return</p>
<% 
}
%>
</body>
</html>