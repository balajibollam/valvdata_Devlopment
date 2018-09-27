<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<%@ page import="com.valvdata.dao.DBConnection"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery.datatable.min.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/buttons.dataTables.min.css"/>
<script src="<%=request.getContextPath()%>/js/jquery-1.12.4.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/dataTables.buttons.min.js"></script>
<style>
a#logout-button { 
    right: -1270px;
    position: relative;
    background: wheat;
    top: 30px;
    /* width: 000px; */
}
</style>
<script>
$(document).ready(function() { 
	var oTable = $('#user_tableId').dataTable( {
	//"processing": true,
	"ajax": {
	"url":  "defaultdatable",
	"dataSrc": "demo",
	"type": "GET"
	},
	
	} );
	
	
	
	$("body").delegate(".deletebutton", "click",function(){
		$(this).parent().parent().remove();  
		console.log(" inside the deletebutton = ===  "); 
	    $.ajax({   
	      type:"POST",
	      url:"deleteuser",   
	      data:{"id":$(this).attr("id")},
	       success: function (response)
	{
		if(response=="success")
			{
			 
				alert("user  successfully deleted");
			}
		
	},
	error: function (e)
	{
		console.log("Iam inside the Error"+e);
	}		  
	});
	   // alert("The paragraph was clicked."+$(this).parent().parent().remove());
	});   
	
	
	} );
	

	

</script>
</head>
<body>
<a id="logout-button" href="logout">Logout</a> 
<br/><br/><br/><br/> 
<table cellpadding="0" cellspacing="0" border="2"
id="user_tableId">
<thead>
<tr>
<th width="10%">FullName</th>
<th width="10%">Email</th>
<th width="10%">Role</th>
<th width="10%">Designation</th>
<th width="10%">MobileNumber</th>
<th width="10%">Delete</th>
</tr>
</thead>  
</table>
</body>
</html>