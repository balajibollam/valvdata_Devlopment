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

@WebServlet("/deleteuser")
public class DeleteUserByAdmin extends HttpServlet { 
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 398183545796397403L;
	PreparedStatement  pstmt=null;
	Connection con=null;
	Statement  stmt=null;
	ResultSet rst=null;
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		try {
			String mobileNumber=request.getParameter("id");
			System.out.println("Deleting MobileNumner="+mobileNumber);
			ServletContext context=getServletContext(); 
			//Database Insertion Logic Here
			con = DBConnection.getInstance().getConnection(context.getInitParameter("db_url"),context.getInitParameter("db_username"),context.getInitParameter("db_password"));
			stmt=con.createStatement();
			PrintWriter pw=response.getWriter();
			
			pstmt=con.prepareStatement("delete from  valv_users where mobilenumber=?");
			pstmt.setString(1, mobileNumber);
			int i=pstmt.executeUpdate();
			if(i==1)
			{
				pw.write("success");
			}
			
			
			
			
		}
		 catch(Exception e)
		{
			 e.printStackTrace();
		}
}
}
