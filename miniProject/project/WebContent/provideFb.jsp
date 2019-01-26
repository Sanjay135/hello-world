<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd"> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.HashMap" %>
<%
String usn ="";
String value = "";
usn = request.getParameter("usn").toString();
%>
<jsp:useBean id="campusbean" class="bean.ProfileBean">
<jsp:setProperty name="campusbean" property="usn" value="<%=usn%>"/>
</jsp:useBean>
<%
//HashMap rec = new HashMap();
//rec = campusbean.isFeedBack(usn);
//usn = rec.get("usn").toString();
//value = rec.get("value").toString();

%>



<html> 
    <head> 
        <title>Feedback Form</title>
        
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
		<link rel="stylesheet" href="css/style.css" type="text/css">
    </head> 
    
    <nav class="navbar  navbar-fixed-top" style="position: absolute">
	<div class="container-fluid">
		<div class="navbar-header">
			<img src="msrit.png" height="80px" width="auto">
		</div>
		
		<div class="col col-md-offset-10">
		<ul class="nav navbar-nav">
			<li class="decor"><a href="student.jsp">HOME</a></li>
			<li class="decor"><a href="login.jsp">LOGOUT</a></li>
		</ul>
		</div>
	</div>
</nav>
    
    <body bgcolor="#ffffcc" class="upper-margin">
    <h3 align="center"><u>FACULTY FEEDBACK</u></h3>
        <form action ="FeedBackServlet" name="feedback"  id ="feedback" method="post">
          <input type="hidden" id="usn" name="usn" value="<%=usn%>"/>
            <TABLE style="background-color: #ECE5B6;" align="center" cellpadding = "10" WIDTH="150%" class="table">
                <tr>
                    <td width="20%"><b>Subjects</b></td>
                    <td width="20%"><b>Faculty</b></td>
                    <td><b>Ratings</b></td>
                </tr>
                
                <tr>
                    <td width="20%">Advanced Mathematics</td>
                    <td width="20%">Mr. Govindaraju</td>
                    <td width="10%"><input type="radio" name="sub1" value="1">Poor</td>
                    <td width="10%"><input type="radio" name="sub1" value="2">Average</td>
                    <td width="10%"><input type="radio" name="sub1" value="3">Good</td>
					<td width="10%"><input type="radio" name="sub1" value="4">Very Good</td>
					<td width="10%"><input type="radio" name="sub1" value="5">Excellent</td>
                </tr>
                <tr>
                    <td width="20%">Advanced DBMS</td>
                    <td width="20%">Mr. Mohan Kumar</td>
                    <td width="10%"><input type="radio" name="sub2" value="1">Poor</td>
                    <td width="10%"><input type="radio" name="sub2" value="2">Average</td>
                    <td width="10%"><input type="radio" name="sub2" value="3">Good</td>
					<td width="10%"><input type="radio" name="sub2" value="4">Very Good</td>
					<td width="10%"><input type="radio" name="sub2" value="5">Excellent</td>
                </tr>
                <tr>
                    <td width="20%">Advanced Computer Networks</td>
                    <td width="20%">Mrs. Monica Mundada</td>
                    <td width="10%"><input type="radio" name="sub3" value="1">Poor</td>
                    <td width="10%"><input type="radio" name="sub3" value="2">Average</td>
                    <td width="10%"><input type="radio" name="sub3" value="3">Good</td>
					<td width="10%"><input type="radio" name="sub3" value="4">Very Good</td>
					<td width="10%"><input type="radio" name="sub3" value="5">Excellent</td>
                </tr>
                <tr>
                    <td width="20%">Advanced Software Engg</td>
                    <td width="20%">Dr. Ramani</td>
                    <td width="10%"><input type="radio" name="sub4" value="1">Poor</td>
                    <td width="10%"><input type="radio" name="sub4" value="2">Average</td>
                    <td width="10%"><input type="radio" name="sub4" value="3">Good</td>
					<td width="10%"><input type="radio" name="sub4" value="4">Very Good</td>
					<td width="10%"><input type="radio" name="sub4" value="5">Excellent</td>
                </tr>
                <tr>
                    <td width="20%">Artificial Intelligence</td>
                     <td width="
                     20%">Mr. Jagadish Kallimani</td>
                    <td width="10%"><input type="radio" name="sub5" value="1">Poor</td>
                    <td width="10%"><input type="radio" name="sub5" value="2">Average</td>
                    <td width="10%"><input type="radio" name="sub5" value="3">Good</td>
					<td width="10%"><input type="radio" name="sub5" value="4">Very Good</td>
					<td width="10%"><input type="radio" name="sub5" value="5">Excellent</td>
                </tr>
                <tr>
                    <td width="20%">SDPD Laboratory</td>
                     <td width="20%">Mr. Pramod Sunagar</td>
                    <td width="10%"><input type="radio" name="sub6" value="1">Poor</td>
                    <td width="10%"><input type="radio" name="sub6" value="2">Average</td>
                    <td width="10%"><input type="radio" name="sub6" value="3">Good</td>
					<td width="10%"><input type="radio" name="sub6" value="4">Very Good</td>
					<td width="10%"><input type="radio" name="sub6" value="5">Excellent</td>
                </tr>
                <tr>
                    <td width="20%">Python Laboratory</td>
                     <td width="20%">Mrs. Rajarajeswari</td>
                    <td width="10%"><input type="radio" name="sub7" value="1">Poor</td>
                    <td width="10%"><input type="radio" name="sub7" value="2">Average</td>
                    <td width="10%"><input type="radio" name="sub7" value="3">Good</td>
					<td width="10%"><input type="radio" name="sub7" value="4">Very Good</td>
					<td width="10%"><input type="radio" name="sub7" value="5">Excellent</td>
                </tr>
              
				<tr><td></td><td></td>
				<td>
				<input type="submit" name="SUBMIT" value="submit" class="btn"/>
				</td></tr>
            </TABLE>
        </form>
    </body> 
</html>