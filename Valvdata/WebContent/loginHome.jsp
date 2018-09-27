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
<style>
a#logout-button {
    right: -1270px;
    position: relative;
    background: wheat;
    top: 30px;
    /* width: 000px; */
}
</style>
</head>
<body>
<div class="bg-loginhome">

<a id="logout-button" href="logout">Logout</a>
<div class="inner-loginhome">

<% 
if(request.getParameter("msg")!=null)
{
%>
<tr><td colspan="2" align="center"><p><b><font color="grenn"><%=request.getParameter("msg") %></font></b></p>
<%
}
%>
<% 
String name=(String)session.getAttribute("emailid");  
out.print("Hello <b>"+name+"</b>");  
%><br/>
<font color="green">Welcome To ValvData</font>
<br/><br/>
<font color="blue">Please Find Your Details Below . If Any Modifications Required please edit here<br/>
</font><b>Note:</b> Email id , DOB can't be changed.<br/>
<%
Connection con=null;
PreparedStatement pstmt;
ResultSet rs=null;
try
{ 
	
	con = DBConnection.getInstance().getConnection(getServletContext().getInitParameter("db_url"),getServletContext().getInitParameter("db_username"),getServletContext().getInitParameter("db_password"));
       	  pstmt=con.prepareStatement("select * from valv_users where email=?");
       	  pstmt.setString(1,name);
    	   rs=pstmt.executeQuery();
}
catch(Exception e)
{
	e.printStackTrace();
}
if(rs!=null)
{
			

int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{
	   
	   
	   DisRow++;
	%>
<form action="userUpdate" type="POST">
	<br/><br/>
   Email:	<input class="inputReg" value=<%=name%> name="email" readonly></br>
   password:<input class="inputReg" type="text"value=<%=rs.getString(4)%> name="pwd"></br>
   Fullaname:<input class="inputReg" type="text"value=<%=rs.getString(1)%> name="fullName"></br>
   Designation:<input class="inputReg" type="text"value=<%=rs.getString(6)%> name="designation"></br>
   Experiance:<input class="inputReg" type="text"value=<%=rs.getString(7)%> name="exp"></br>
   MobileNumber:<input class="inputReg" type="text"value=<%=rs.getString(8)%> name="mobilenumber"></br>
   <input class="inputReg" type="submit" id="edit" value="Edit"  /><br/>
   </form>
	<%
	}
	rs.close();	
	con.close();
if(DisRow==0)
{	
	%>		
	  <tr><th colspan=6>No Jobs found</th></tr>
	<%
}
}
%>


<span id="errorMessage"></span><br/><br/>
</div>
</div>
</body>
</html>