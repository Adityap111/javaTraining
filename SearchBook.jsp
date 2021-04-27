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
<form method="post" action="SearchBookNext.jsp" >
<p>
Select Search Criteria: 

</p>

<input type="radio" name="criteria" value="1" >By Book ID
<br>
<input type="radio" name="criteria" value="2" >By Department
<br>
<input type="radio" name="criteria" value="3" >By Book Name
<br>
<input type="radio" name="criteria" value="4" >By Author Name
<br>
<input type="radio" name="criteria" value="5" >All books
<br>
<br>

Insert Search Value:
<input type="text" name="src">
<br>
<input type="submit" value="Search">


</form>


</body>
</html>