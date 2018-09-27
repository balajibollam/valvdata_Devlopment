package com.valvdata;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.valvdata.dao.DBConnection;

/**
 * Servlet implementation class UpdateServletDetails
 */
@WebServlet("/userUpdate")
public class UpdateUserDetails extends HttpServlet {
	
       
	/**
	 * 
	 */
	private static final long serialVersionUID = 2873864507672108830L;
	PreparedStatement  pstmt=null;
	Connection con=null;
	Statement  stmt=null;
	ResultSet rst=null;
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	try
	{
		String email=request.getParameter("email").trim();
		String pwd=request.getParameter("pwd").trim();
		String fullName=request.getParameter("fullName").trim();
		String designation=request.getParameter("designation").trim();
		String experiance=request.getParameter("exp").trim();
		String mobilenumber=request.getParameter("mobilenumber").trim();
		
		ServletContext context=getServletContext(); 
		
		//Database Insertion Logic Here
		con = DBConnection.getInstance().getConnection(context.getInitParameter("db_url"),context.getInitParameter("db_username"),context.getInitParameter("db_password"));
		stmt=con.createStatement();
		PrintWriter pw=response.getWriter();
		
		pstmt=con.prepareStatement("update valv_users set password=?,fullname=?,designation=?,experiance=?,mobilenumber=? where email=?");
 
  	  pstmt.setString(1,pwd);
  	  pstmt.setString(2,fullName);
  	  pstmt.setString(3,designation);
  	  pstmt.setString(4,experiance);
  	  pstmt.setString(5,mobilenumber);
  	  pstmt.setString(6,email);
  	  
  	int i=pstmt.executeUpdate();
 	  	System.out.println(".......4........"+i);
  	  response.sendRedirect("loginHome.jsp?msg=Details Updated Successfully");
		
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	}

	

}
