<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.ps.pojo.*"  %>

<% Pojo s = (Pojo)session.getAttribute("sess");
		if(s.getEmail() == null)
		{
			response.sendRedirect("login.jsp");
		}
		
		else
		{
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h4>Successfully login: proctor </h4>
	
	<a href="attendence.jsp"><input type="submit" name="req_type" value="button" class="btn btn-warning"></a>
</body>
</html>

	<%
	}
	%>