<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.*" %>
<%@ page import="com.ps.pojo.AttendP" %>
<%@ page import="com.ps.pojo.Pojo" %>

<% Pojo ses = (Pojo)session.getAttribute("sess");
		if(ses.getEmail() == null)
		{
			response.sendRedirect("login.jsp");
		}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>

<!--  HEADER -->
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

<h3 class="text-primary text-center upper-margin">Student Attendence</h3>
	
	<div class="row">
	
	</div>
	<div class="upper-margin">
		<div class="container">
			<form action="attenden" method="post" class="form-inline well">
				<div>
				
					<span>
					<label for="usn"></label>
					<input type="text" name="atten_usn" id="usn" class="form-control" placeholder="USN">
					</span>
					
					<span><label for="a"></label>
					<label for="sems"></label>
					<select name="sem" class="form-control" id="sems">
					<option value=1>semester 1</option>
					<option value=2>semester 2</option>
					</select>
					</span>
				
					<span>
					<label for="sub"></label>
					<input type="submit" name="req_type" value="GetAttendance" onclick="myAttendence()" class="form-control btn btn-primary" id="sub">
					</span>
					
				</div>
			</form>
		</div>
	</div>
	
	<hr>
	
	<% AttendP i = (AttendP)request.getAttribute("attenObj");
					
		Pojo u = (Pojo)request.getAttribute("user");
		
	%>
	
	<div>
	<%
	if(i!=null && (i.getClasses() == 0))
	{
		out.print("<h4 class=\"text-danger text-center\">Please enter correct USN!!</h4>");
	}
	
	else
	{
	%>
	</div>
	
	<div class="col col-xs-offset-2">
		<span style="color:red;"><% if(i!=null) out.print("Name: "+i.getName()); %></span>
		<span style="color:red;" class="col col-xs-offset-1"><% if(i!=null) out.print("USN: "+u.getEmail()); %></span>
		<span style="color:red;" class="col col-xs-offset-1"><% if(i!=null) out.print("Semester: "+u.getSem()); %></span>
	</div>
	
	<br>
<!--      TABLE    -->

	<% if(i!=null)
	{
		
	%>
	<div class="col col-xs-offset-1 col-xs-8" id="myTable" style="display:block;">
	<table class="table table-bordered">
	<thead>
		<tr class="bg-info">
		<th scope="row">Subjects</th>
		<th scope="row">Classes Attened</th>
		<th scope="row">Total Classes</th>
		<th scope="row">Percentage</th>
		</tr>
	</thead>
	
	
	
	<tbody>	
		<tr>
		<td scope="row">
			<% if(i!=null){
					List<String> s = new ArrayList<String>();
					s = i.getSub();
					out.print(s.get(0));
			}
			%></td>
		<td><% if(i != null && u.getSem().equals("1"))
				{
					int v1 = i.getMaths(); 
					out.print(v1);
				}
				else if(i!=null && u.getSem().equals("2"))
				{
					int v1 = i.getAlgo();
					out.print(v1);
				}
			%></td>
		<td><% if(i != null)
				{
					int v2 = i.getClasses(); 
					out.print(v2);
				}
			%></td>
				
		<td><% if(i != null && u.getSem().equals("1")) 
			{
				int v1 = i.getMaths();
				float f = ((float)v1/(float)i.getClasses())*100;
				out.print(f); 
			}
			else if(i != null && u.getSem().equals("2"))
			{
				int v1 = i.getAlgo();
				float f = ((float)v1/(float)i.getClasses())*100;
				out.print(f);
			}
			%></td>
		</tr>
		
		<!-- SECOND ROW OF TABLE -->
		<tr>
		<td scope="row">
		<% if(i!=null){
					List<String> s = new ArrayList<String>();
					s = i.getSub();
					out.print(s.get(1));
			}
			%>
		</td>
		<td><% if(i != null && u.getSem().equals("1"))
				{
					int v1 = i.getAdb(); 
					out.print(v1);
				}
				else if(i!=null && u.getSem().equals("2"))
				{
					int v1 = i.getIot();
					out.print(v1);
				}
		%></td>
		<td><% if(i != null) out.print(i.getClasses()); %></td>
		
		<td><% 
		if(i != null && u.getSem().equals("1")) 
		{
			int v1 = i.getAdb();
			float f = ((float)v1/(float)i.getClasses())*100;
			out.print(f); 
		}
		else if(i != null && u.getSem().equals("2"))
		{
			int v1 = i.getIot();
			float f = ((float)v1/(float)i.getClasses())*100;
			out.print(f);
		}
		%></td>
		</tr>
		
		<!-- THIRD ROW OF TABLE -->
		<tr>
		<td scope="row">
		<% if(i!=null){
					List<String> s = new ArrayList<String>();
					s = i.getSub();
					out.print(s.get(2));
			}
			%>
		</td>
		<td><% if(i != null && u.getSem().equals("1"))
				{
					int v1 = i.getAi(); 
					out.print(v1);
				}
				else if(i!=null && u.getSem().equals("2"))
				{
					int v1 = i.getWeb();
					out.print(v1);
				}
		%></td>
		<td><% if(i != null) out.print(i.getClasses()); %></td>
		
		<td><% 
		if(i != null && u.getSem().equals("1")) 
		{
			int v1 = i.getAi();
			float f = ((float)v1/(float)i.getClasses())*100;
			out.print(f); 
		}
		else if(i != null && u.getSem().equals("2"))
		{
			int v1 = i.getWeb();
			float f = ((float)v1/(float)i.getClasses())*100;
			out.print(f);
		}
		%></td>
		</tr>
		
		
		<!-- FOUTH ROW OF TABLE -->
		<% int v1,v2,v3,sum,sum1,t;
			float f;
			//total for 2nd colunm (1st sem)
			v1=i.getMaths();
			v2=i.getAdb();
			v3=i.getAi();
			sum = v1+v2+v3;
			
			//total for 2nd column (2nd sem)
			v1=i.getAlgo();
			v2=i.getIot();
			v3=i.getWeb();
			sum1 = v1+v2+v3;
			
		%>
		<tr>
		<td scope="row"></td>
		<td><b>
		<%
			if(i!=null && u.getSem().equals("1"))
			{
				
				out.print(sum);
			}
			else if(i!=null && u.getSem().equals("2"))
			{
				
				out.print(sum1);
			}
		%>
		</b></td>
		
		<td><b>
		<% t = i.getClasses();
			t=t*3;
		out.print(t); %></b></td>
		
		<td><b>
		<%
			if(u.getSem().equals("1"))
			{
				f = ((float)sum/(float)t)*100;
				out.print(f);
			}
			else if(u.getSem().equals("2"))
			{
				f = ((float)sum1/(float)t)*100;
				out.print(f);
			}
		%></b></td>
		
		
	</tbody>	
	</table>
	</div>

	
	
	<div class="col col-offset-3">
	<h5>You must have 85% and above to be eligible for Final exams.</h5>
	<h4>You have <% if(u.getSem().equals("1")) out.print(((float)sum/((float)i.getClasses()*3))*100); 
						else if(u.getSem().equals("2")) out.print(((float)sum1/((float)i.getClasses()*3))*100);%></h4>
	</div>
	
	<%
	}
	}
	%>
	
	<div class="f" style="background-color:black; position:absolute; height:45px; color:white; bottom:0; width:100%; padding-top:10px;"><center>Contact info: 910000000</center></div>	
	
</body>
</html>