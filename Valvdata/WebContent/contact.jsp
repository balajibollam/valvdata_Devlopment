<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
#contactPage {
   color: black;
    font-family: cursive;
    font-size: 21px;
}
#contactUs
{
 height: 31px;
    /* width: 34px; */
    overflow: visible;
    background: url(../images/generic/linkedin-icon.png) no-repeat 50% #61bf65;
   
    z-index: 51;
    position: relative;
}
#contact_heading
{
color:white;
}
#pplId,#ppemail,#ppquery
{
background-color: #ecf1e5 ;
   /*  background-color: #ffffff; */
    background-image: none;
    border: 1px solid #282828;
    border-radius: 4px;
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset;
    color: #888888;
    display: block;
    font-size: 14px;
    height: 18px;   
    line-height: 1.42857;
    padding: 8px 12px;
    transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s;
}
</style>

<script>
function queryPopup(message,dialogtitle)
{
	
	document.getElementById("qdialog").title=dialogtitle;

	
	mainDialog=$( "#qdialog" ).dialog({
			  modal: true,
                          width: "auto",
			  open: function() {
				  $(".ui-dialog-titlebar-close").hide();
		          $(this).html(message);
		        },
		        buttons : [{text:"ok",click: function() { $(this).dialog('close');}}]
		}); 
		
}	




function submitYourQuery()
{

	
$.ajax({
	type:"POST",
    url :"userqueryPage",
    data : $("#queryForm").serialize(),
    success: function (response)
    {
    	
    	if(response=="true")
    		{
    		
    		alert("You Query Submitted SuccessFully");
    		
    		}
    	
    },
    error: function (e)
    {
    	console.log("Iam inside the Error"+e);
    }
    
});

}


function validateQueryForm()
{
	var x = document.forms["queryForm"]["ppemail"].value;
    var atpos = x.indexOf("@");
    var dotpos = x.lastIndexOf(".");
    if(!($("#ppemail").val()!="" && $("#pplId").val()!="" && $("#ppquery").val()!="" ))
	{
    	alert("please enter all the maditory fields","Notice");
    return false;
	}
    else if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
    	alert("Not a valid e-mail address","Notice");
        return false;
    }
    else
    	submitYourQuery();
	
}

</script>
</head>
<body>
<span id="contactPage">
<h2  id="contact_heading" style="border-bottom: solid 1px;"><b>Valvdata Pvt Ltd.</b></h2>
HNO 11-5- 256/1/401,</br>
Road 03, Venkateshwara Colony,</br>
Saroornagar, Hyderabad, Rangareddi, Telangana - 500035<br/>
Email: CAYPREDDY@GMAIL.COM</br></br></br>
Please Provide Your Queries Here:</br>
<form id="queryForm" name="queryForm" type="post">
<input type="text" name="pplId" id="pplId" placeholder="Name"/><br/>
<input type="text"  name="ppemail" id="ppemail" placeholder="Email"/><br/>
<textarea id="ppquery" name="ppquery" placeholder="Your Query" rows="0" cols="50"></textarea><br/><br/><input id="contactUs" type="button" onclick="validateQueryForm()" value="Submit"/>
</form>
</span>

<span id="qdialog"/>
</body>
</html>