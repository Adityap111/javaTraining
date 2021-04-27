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

String str=request.getParameter("criteria");
String str1=request.getParameter("src");
String str2=str+" "+str1;
if(str==null)
{
	response.sendRedirect("SearchBook.jsp");
%>

	
<%
}
else
{	
	request.setAttribute("str", str2);
	RequestDispatcher d=request.getRequestDispatcher("SearchBookQuery.jsp");
	d.forward(request, response);
}
%>



</body>
</html>