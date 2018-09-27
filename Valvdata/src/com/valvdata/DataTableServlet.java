package com.valvdata;

import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import java.sql.Connection;

import com.valvdata.dao.DBConnection;

@WebServlet("/defaultdatable")
public class DataTableServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1546047190245363097L;
	PreparedStatement  pstmt=null;
	Connection con=null;
	Statement  stmt=null;
	ResultSet rst=null;
	protected void service(HttpServletRequest req, HttpServletResponse res)
	{
		try     
		{
			PrintWriter out = res.getWriter();
			ServletContext context=getServletContext(); 

			//Database Insertion Logic Here
			con = DBConnection.getInstance().getConnection(context.getInitParameter("db_url"),context.getInitParameter("db_username"),context.getInitParameter("db_password"));
			stmt=con.createStatement();
			JSONObject userJSON=new JSONObject();  
		    JSONArray users=new JSONArray();
			
		    ResultSet rs=stmt.executeQuery("select fullname,email,role,designation,mobilenumber from valv_users");
		    
		    while(rs.next())
		    {
		    	String fullname=rs.getString(1);
		    	String email=rs.getString(2);
		    	String role=rs.getString(3);
		    	String designation=rs.getString(4);
		    	String mobilenumber=rs.getString(5); 
		    	JSONArray user=new JSONArray();
		    	user.put(fullname);
		    	user.put(email);
		    	user.put(role);
		    	user.put(designation);
		    	user.put(mobilenumber);
		        user.put("<button class='deletebutton'  id="+mobilenumber+">Delete</button> ");
		    	users.put(user);  
		    }
		    
		 	userJSON.put("demo", users);     
			
			System.out.println("========="+userJSON.toString()); 
			
			String json = "{ \"demo\":[[\"First Name\",\"Last Name\",\"Address1\",\"Address2\"],[\"First Name\",\"Last Name\",\"Address1\",\"Address2\"]]}";
			out.println(userJSON.toString());      
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
