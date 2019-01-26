<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.ps.pojo.Pojo" %>


    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Proctor Management System Login</title>

<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>


<nav class="navbar  navbar-fixed-top" style="position: absolute">
	<div class="container-fluid">
		<div class="navbar-header">
			<img src="msrit.png" height="80px" width="auto">
		</div>
		
		<div class="col col-md-offset-10">
		<ul class="nav navbar-nav">
			<li class="active decor"><a href="#">LOGIN</a></li>
			<li class="decor"><a href="index.jsp">REGISTER</a></li>
		</ul>
		</div>
	</div>
</nav>




	<!-- LOGIN SERVICE --> 
	<div class="upper-margin">
		<div class="container">
			<div class="row">
				<center><h1>LOGIN</h1></center>
				<p>Please enter your credentials</p>
				<hr>
				
				<div class="row">
	
				<div class="col col-xs-offset-3 col-xs-6">		
						<br><br>
						<form action="account" method="post" class="well">
							
								<label for="r">Role</label><select name="role" class="form-control" id="r">
													<option value="default">--SELECT--</option>
													<option value="P">Proctor</option>
													<option value="S">Student</option></select>
													
								<label>Login</label> <input type="text" name="email" class="form-control" />
								<label>Password:</label><input type="password" name="pass" class="form-control" />
								<br>
								<input type="submit" name="request_type" value="login" class="btn btn-primary" />
								
								<a href="index.jsp" style="textdecoration:none !important;"><button type="button" class="btn btn-primary" style="float:right">Register</button></a>
								
						</form>	
				</div>	
				
				 </div>
			</div>
		</div>	
	</div>	
	
	
	<div class="f" style="background-color:#818181; position:absolute; height:45px; color:white; bottom:0; width:100%; padding-top:10px;"><center>Contact info: 910000000</center></div>			
</body>
</html>