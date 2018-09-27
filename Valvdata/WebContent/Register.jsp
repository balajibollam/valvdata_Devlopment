<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui.css"/>
<script src="<%=request.getContextPath()%>/js/jquery-1.12.4.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-1.12.4.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-ui-timepicker-addon.js"></script>
<script src="<%=request.getContextPath()%>/js/main.js"></script>

<script>
//reusable dialog
function registerPopup(message,dialogtitle)
{
	
	document.getElementById("cdialog").title=dialogtitle;

	
	mainDialog=$( "#cdialog" ).dialog({
			  modal: true,
                          width: "auto",
			  open: function() {
				  $(".ui-dialog-titlebar-close").hide();
		          $(this).html(message);
		        },
			  buttons : [{text:"Login",click: function() {
				  window.location="login.jsp";
				  $(this).dialog('close');
			 
			  }}]
		}); 
		
}	




function RegisterToApp()
{

	
$.ajax({
	type:"POST",
    url :"registerPage",
    data : $("#registerForm").serialize(),
    success: function (response)
    {
    	console.log("register response from backend"+response);
    	//alert(response);
    	if(response=="true")
    		{
    		document.getElementById("errorMessage").innerHTML="";
    		registerPopup("You are done with Registration,Click Login button to login","Notice");
    		
    		}
    	else if(response=="duplicate")
    		{
    		customDialogMessageFrame("Email Id or Mobil Number already Registered!! Try with different values","Notice")
    		}
    
    	document.getElementById("registerForm").reset();
    	var d = new Date();
    	$("#id").val(d.getTime());
    	$("#creationDate").val(d);
    },
    error: function (e)
    {
    	console.log("Iam inside the Error"+e);
    }
    
});

}

function validateRegisterForm()
{
	var x = document.forms["myForm"]["email"].value;
    var atpos = x.indexOf("@");
    var dotpos = x.lastIndexOf(".");
    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
        alert("Not a valid e-mail address");
        return false;
    }
    else if(!($("#email").val()!="" && $("#fullName").val()!="" && $("#dateOfbirth").val()!="" && $("#mobilemumber").val()!="" && $("#pwd").val()!=""))
    	{
    	alert("please enter all the maditory fields");
        return false;
    	}
    else
    	RegisterToApp();
}


$(document).ready(function() {
	
	var d = new Date();
	$("#id").val(d.getTime());
	$("#creationDate").val(d);
	
	$( "#dateOfbirth" ).datetimepicker({
		  showOn: "button",
		buttonImage: "images/calendar.png",
		  buttonImageOnly: true,
		 
		 
		  dateFormat: 'mm/dd/yy',
		  timeFormat: 'h:mm:ss TT'
		 
	  });
});


</script>
</head>
<body>
<a id="home-button" href="<%=request.getContextPath()%>/index.jsp">Home</a> 
<div class="bg-r">

<br/>
<br/>
<br/>
<br/>
<div class="inner-r">
<img id="iconCom" src="images/iconCompany.png"/><br/><br/>

<form name="myForm" id="registerForm">

<b>Register</b><br/>
<input class="inputReg" placeholder="Email " name="email" type="text" id="email"/><br>
<input class="inputReg" placeholder="FullName " name="fullName" type="text" id="fullName"/><br>
<input class="inputReg" placeholder="DateOfBirth" type="text" name="dateOfbirth" id="dateOfbirth"/><br>
<input class="inputReg" placeholder="CreatePassword " type="password" name="pwd" id="pwd"/><br>
<input class="inputReg" placeholder="Designation" type="text" name="designation" id="designation"/><br>
<input class="inputReg" placeholder="Experiance(Years.Months)" type="number" name="experiance" id="experiance"/><br>
<input class="inputReg" placeholder="MobileNumber" type="number" name="mobilemumber" id="mobilemumber"/><br>
<input id="creationDate" style="display:none;" name="creationDate"  tyep="text"/>
<input id="id" style="display:none;" name="id"  tyep="text"/>
<input class="inputReg" type="button" id="register" value="Register" onclick="validateRegisterForm()"  /><br/>
<span id="errorMessage"></span><br/><br/>
</form>
</div>
</div>

<div id="cdialog"/>

</body>
</html>