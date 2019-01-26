<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.ps.pojo.*"  %>

<% Pojo s = (Pojo)session.getAttribute("sess");
		if(s.getEmail() == null)
		{
			response.sendRedirect("login.jsp");
		}
	%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	
	<% 
	  String msg = "viewProfile.jsp?usn="+s.getEmail();
	
	 String msg1 = "provideFb.jsp?usn="+s.getEmail();
	  %>
	
	<!--  HEADER -->
<nav class="navbar  navbar-fixed-top" style="position: absolute">
	<div class="container-fluid">
		<div class="navbar-header">
			<img src="msrit.png" height="80px" width="auto">
		</div>
		
		<div class="col col-md-offset-9">
		<ul class="nav navbar-nav">
			<li class="active decor"><a href="#">HOME</a></li>
			<li class="decor"><a href="<%out.print(msg);%>">VIEW PROFILE</a></li>
			<li class="decor"><a href="login.jsp">LOGOUT</a></li>
		</ul>
		</div>
	</div>
</nav>


<!-- side navigation bar -->
<div class="clo col-xs-3">
<ul class="nav nav-pills nav-stacked">
  <li class="active"><a href="#">WELCOME</a></li>
  <li><a class="dropdown-item" href="attendence.jsp" style="textdecoration:none !important;">Attendence</a></li>
  <li><a class="dropdown-item" href="<%out.print(msg);%>">View Profile</a></li>
   <li><a class="dropdown-item" href="<%out.print(msg1);%>">Feedback</a></li>
</ul>
</div>

<!-- end side navigation bar -->

<span> <input="">

	<div class="upper-margin col-xs-offset-3" style="background-image:url(msrit_1.jpg); height:600px; background-size:cover; background-position:center; background-repeat:no-repeat;">
	
	<div class="inner-banner">

	</div>
	</div>

 <div class="f" style="background-color:black; position:relative; height:45px; color:white; bottom:0; width:100%; padding-top:10px;"><center>Contact info: 910000000</center></div>
	
</body>
</html>

