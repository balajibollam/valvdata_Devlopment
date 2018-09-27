<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui.css"/>
<script src="<%=request.getContextPath()%>/js/jquery-1.12.4.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>
<script src="<%=request.getContextPath()%>/js/main.js"></script>s
<script>
function check()
{
<%
if(request.getParameter("msg")!=null)
{
%>
var msg='Please Check your userid and password';
customDialogMessageFrame(msg,"notice");
<%
}


if(request.getParameter("msg1")!=null)
{
%>
var msg1='Permission not granted';
alert(msg1);
<%
}

%>
}
function loginToApp()
{
	
$.ajax({
	type:"POST",
    url :"loginPage",
    data : $("#loginForm").serialize(),
    success: function (response)
    {
    	alert(response);
    	if(response=="true")
    		document.getElementById("errorMessage").innerHTML="";
    	else
    		document.getElementById("errorMessage").innerHTML="Please Enter the Correct UserName and password";
    
    	$("#uname").val("");
    	$("#pwd").val("");
    },
    error: function (e)
    {
    	console.log("Iam inside the Error"+e);
    }
    
});


}
</script>
<style>

</style>
</head>

<body onload="check()"> 
<a id="home-button" href="<%=request.getContextPath()%>/index.jsp">Home</a>
<div class="bg">

<br/>
<br/>
<br/>
<br/>
<div class="inner">
<img id="iconCom" src="images/iconCompany.png"/><br/><br/>

<form id="loginForm" action="loginPage" type="POST" onsubmit="return verifyLogin()">

<b>Sign In</b><br/>
<input placeholder="Email " name="uname" type="text" id="uname"/><br>
<input placeholder="Password " type="password" name="pwd" id="pwd"/><br>
<input type="submit" id="login" value="Login"  /><br/><br/>
<span id="errorMessage"></span><br/><br/>
No account? <a href="Register.jsp">Create one!</a>
</form>
</div>
</div>
<div id="cdialog"/>
</body>
</html>