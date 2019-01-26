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
<style>
input.txt {
color: #00008B;
background-color: #E3F2F7;
border: 1px inset #00008B;
width: 200px;
}
input.btn {
color: #00008B;
background-color: #ADD8E6;
border: 1px outset #00008B;
}
form div {
clear: left;
margin: 0;
padding: 0;
padding-top: 5px;
}
form div label {
float: left;
width: 40%;
font: bold 0.9em Arial, Helvetica, sans-serif;
}
fieldset {
border: 1px dotted #61B5CF;
margin-top: 1.4em;
padding: 0.6em;
}
legend {
font: bold 0.8em Arial, Helvetica, sans-serif;
color: #00008B;
background-color: #FFFFFF;
}
</style>
</head>
<body>
<form action ="DemoServlet" name="registration"  id ="registration" method="post">
<h1>User Registration Form</h1>
<h5>Note: All fields marked with <font color="red">*</font> are mandatory</h5>
<form>
<fieldset>
<legend>Personal Information</legend>
<div>
<label for="fname">First Name<font color="red">*</font></label>
<input type="text" name="fname" id="fname" maxlength="15" class="txt"/>
</div>
<div>
<label for="lname">Last Name<font color="red">*</font></label>
<input type="text" name="lname" id="lname" maxlength="15" class="txt"/>
</div>
<div>
<label for="pwd1">Password<font color="red">*</font></label>
<input type="password" name="pwd1" id="pwd1" maxlength="15" class="txt"/>
</div>
<div>
<label for="pwd2">Confirm Password<font color="red">*</font></label>
<input type="password" name="pwd2" id="pwd2" maxlength="15" class="txt"/>
</div>
</fieldset>
<fieldset>
<legend>Other Details</legend>
<div>
<label for="usn">USN<font color="red">*</font></label>
<input type="text" name="usn" id="usn" maxlength="15" class="txt"/>
</div>
<div>
<label for="address1">Phone Number<font color="red">*</font></label>
<input type="text" name="phone" id="phone" maxlength="15" class="txt" />
</div>
<div>
<label for="addr">Address<font color="red">*</font></label>
<input type="textarea" name="addr" id="addr" maxlength="30" class="txt" />
</div>
<div>
<label for="bran">Branch<font color="red">*</font></label>
<select name="bran" id="bran" style="width:200px;">
<option value="NONE">Click to Select</option>
<option value="BIO">Biotechnology</option>
<option value="CSE">Computer Science</option>
 <option value="CIV">Civil Engineering</option>
  <option value="EEE">Electricals and Electronics</option>
    <option value="ECE">Electronics and Communication</option>
      <option value="EIM">Electronics and Instrumentation</option>
    <option value="ISE">Information Science</option>
     <option value="ME">Mechanical Engineering</option>
    <option value="MED">Medical Electronics</option>
    <option value="TCE">Telecommunication</option>
   
    </select>
</div>
<div>
<label for="cour">Course<font color="red">*</font></label>
<select name="cour" id="cour" style="width:200px;">
<option value="NONE">Click to Select</option>
<option value="UG">UG</option>
    <option value="PG">PG</option>
      <option value="PhD">PhD</option>
  </select>    
</div>
<div>
<label for="role">Role<font color="red">*</font></label>
<select name="role" id="cour" style="width:200px;">
<option value="NONE">Click to Select</option>
<option value="P">Proctor</option>
    <option value="S">Student</option>
  </select>    
</div>
</fieldset>
<div>
<input type="submit" name="submit" id="submit" value="Register" class="btn" />
</div>
</form>
</form>
</body>

</html>