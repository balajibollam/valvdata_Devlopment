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
import javax.servlet.http.HttpSession;

import com.valvdata.dao.DBConnection;



@WebServlet("/loginPage")
public class LoginControl extends HttpServlet {


	/**
	 * 
	 */
	private static final long serialVersionUID = -325715730944834867L;
	PreparedStatement  pstmt=null;
	Connection con=null;
	Statement  stmt=null;
	ResultSet rst=null;
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		try {
			String uname=request.getParameter("uname").trim();
			String pwd=request.getParameter("pwd").trim();
			System.out.println("Reached here to the backend "+uname+pwd);
			PrintWriter pw=response.getWriter();
			ServletContext context=getServletContext(); 
			con = DBConnection.getInstance().getConnection(context.getInitParameter("db_url"),context.getInitParameter("db_username"),context.getInitParameter("db_password"));
			System.out.println(con);
			stmt=con.createStatement();
			HttpSession hs=request.getSession();
			
			
			
			if(uname.equals("admin") && pwd.equals("12345"))
			{
				System.out.println(".......14a........");
				hs.setAttribute("emailid","admin");
				hs.setAttribute("role","admin");
				//response.sendRedirect("AdminHome.jsp");
				
			} 
			 
			
			if(isLoginValid(uname,pwd))
			{
				String role=getUserRole(uname);
	            System.out.println("Printing Role Here"+role);
				hs.setAttribute("emailid",uname);
				hs.setAttribute("role",role);
				if(role.trim().equals("user"))
				response.sendRedirect("loginHome.jsp");	
				else if(role.trim().equals("admin"))
				response.sendRedirect("loginHomeAdmin.jsp");	
			}
			else
			response.sendRedirect("./login.jsp?msg=Check your password.");	
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	public boolean isLoginValid(String email,String password)
	{ 
		boolean isUserThere=false;
		try
		{
			
			System.out.println("======Entered Here============");
			//verify the subject name
			String sql="select count(*) from valv_users where email="
					+ "'" + email + "'" + " and password=" + "'" + password + "'";
			rst = stmt.executeQuery(sql);
			rst.next();
			
			System.out.println(sql); 
			if(rst.getInt(1)!=0)
				isUserThere=true;
			System.out.println("isLoginThere"+rst.getInt(1));
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return isUserThere;
	}
	
	public String getUserRole(String email)
	{
		String role="";
		try
		{
			System.out.println("======Entered Here============");
			//verify the subject name
			String sql="select role from valv_users where email="
					+ "'" + email + "'" ;
			rst = stmt.executeQuery(sql);
			rst.next();
			
			System.out.println(sql); 
			if(rst.getString(1)!=null)
				role=rst.getString(1);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return role;
	}
	
	
	
	
}
