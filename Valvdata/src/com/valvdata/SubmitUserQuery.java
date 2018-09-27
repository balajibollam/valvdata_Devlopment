package com.valvdata;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/userqueryPage")
public class SubmitUserQuery extends HttpServlet {
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 1145565399779024429L;

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		try
		{
		String uname=request.getParameter("pplId");
	    String email=request.getParameter("ppemail");
	    String query=request.getParameter("ppquery");
	    String mailBody ="Hi Admin,<br>"+"<div style='color:#0000FF'>User: "+uname+" With Email("+email+") Enterted Below Query</div>"
		        +"<b>Query:</b>"+query+"<br><br>"
		        +"Hi  "+uname+",<br><div> We will look into your query and reply you shorlty</div>"
				+"<br><br> <b>This is Autogenerted mail, please don't reply for this</b><br><br>"
		    +"<br><br>Regards<br/><b>ValvdataAdmin</b>";
	    ServletContext context=getServletContext(); 
	    if(context.getInitParameter("mailflag").equals("true"))
			 new Sendmail().sendemailevent(context.getInitParameter("fromamail"), email, context.getInitParameter("cc"),context.getInitParameter("bcc"),"ValvData HelpLine(AutoGeneratedMail)", mailBody, "");

	    PrintWriter pw=response.getWriter();
	    pw.write("true");
	    System.out.println("hai"+context.getInitParameter("mailflag"));
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
}
