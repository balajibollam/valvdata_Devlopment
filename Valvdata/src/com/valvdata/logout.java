package com.valvdata;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/logout")
public class logout extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3453564540532217086L;

	public void service(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
	{
		try
		{
            HttpSession session=request.getSession();  
            session.invalidate();  
            
			RequestDispatcher rd=request.getRequestDispatcher("login.jsp");  
			rd.forward(request, response);   
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
}
