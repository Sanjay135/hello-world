<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<title>Insert title here</title>

<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">


<style>
h3{
  font-family: Calibri; 
  font-size: 25pt;         
  font-style: normal; 
  font-weight: bold; 
  color:black;
  text-align: center; 
  text-decoration: underline
}

table{ssss
  font-family: Calibri; 
  color:black; 
  font-size: 11pt; 
  font-style: normal;
  font-weight: bold;
  text-align:; 
  background-color: #DAFF33; 
  border-collapse: collapse; 
  border: 2px solid navy
}
table.inner{
  border: 0px
}

</style>


</head>
<%@ page import="java.util.HashMap" %>
<%
String usn ="";
String branch ="";
String fname,lname,addr,phone,course = "";
usn = request.getParameter("usn").toString();
%>
<jsp:useBean id="campusbean" class="bean.ProfileBean">
<jsp:setProperty name="campusbean" property="usn" value="<%=usn%>"/>
</jsp:useBean>
<%

HashMap rec = new HashMap();
rec = (HashMap) campusbean.getRecords(usn);
usn = rec.get("usn").toString();
fname = rec.get("fname").toString();
lname = rec.get("lname").toString();
addr = rec.get("addr").toString();
phone = rec.get("phone").toString();
branch = rec.get("branch").toString();
if(branch.equalsIgnoreCase("BIO")) branch = "Biotechnology";
if(branch.equalsIgnoreCase("CSE")) branch = "Computer Science Engineering";
if(branch.equalsIgnoreCase("CIV")) branch = "Civil Engineering";
if(branch.equalsIgnoreCase("EEE")) branch = "Electricals and Electronics Engineering";
if(branch.equalsIgnoreCase("ECE")) branch = "Electronics and Communication";
if(branch.equalsIgnoreCase("EIM")) branch = "Electronics and Instrumentation";
if(branch.equalsIgnoreCase("ISE")) branch = "Information Science Engineering";
if(branch.equalsIgnoreCase("ME")) branch = "Mechanical Engineering";
if(branch.equalsIgnoreCase("MED")) branch = "Medical Electronics";
if(branch.equalsIgnoreCase("TCE")) branch = "Telecommunication Engineering";
	    
course = rec.get("course").toString();
if(course.equalsIgnoreCase("UG")) course = "Under Graduate";
if(course.equalsIgnoreCase("PG")) course = "Post Graduate";
%>

<body>

<nav class="navbar  navbar-fixed-top" style="position: absolute">
	<div class="container-fluid">
		<div class="navbar-header">
			<img src="msrit.png" height="80px" width="auto">
		</div>
		
		<div class="col col-md-offset-10">
		<ul class="nav navbar-nav">
		<li class="active decor"><a href="student.jsp">HOME</a></li>
			<li class="decor"><a href="login.jsp">LOGOUT</a></li>
			
		</ul>
		</div>
	</div>
</nav>

<br>
<br>

<h3 class="upper-margin">USER PROFILE</h3>


 
<table align="center" cellpadding = "10" width="70%">
 
<!----- First Name ---------------------------------------------------------->
<tr>
<td>First Name</td>
<td><%=fname%></td>
</tr>
 </br>
<!----- Last Name ---------------------------------------------------------->
<tr>
<td>Last Name</td>
<td><%=lname%>
</td>
</tr>

<tr>
<td>USN</td>
<td><%=usn%>
</td>
</tr>
<tr>
<td>Address</td>
<td><%=addr%>
</td>
</tr>
<tr>
<td>Phone Number</td>
<td><%=phone%>
</td>
</tr>
 <tr>
<td>Branch</td>
<td><%=branch%>
</td>
</tr>

<tr>
<td>Course</td>
<td><%=course%>
</td>
</tr>



</table>
 
</form>


<div class="f" style="background-color:black; position:absolute; height:45px; color:white; bottom:0; width:100%; padding-top:10px;"><center>Contact info: 910000000</center></div>
 
</body>


</html>