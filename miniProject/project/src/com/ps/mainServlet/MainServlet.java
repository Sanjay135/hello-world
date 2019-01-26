package com.ps.mainServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.ps.daoimp.*;
import com.ps.pojo.Pojo;


/**
 * Servlet implementation class MainServlet
 */
@WebServlet("/MainServlet")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    
	/*protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}*/
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String e = request.getParameter("email");
		String p = request.getParameter("pass");
		String r = request.getParameter("role");		
		String req_type = request.getParameter("request_type");
		
		if(req_type.equals("login"))
		{
		try
		{
		Pojo u = new Pojo();
		u.setEmail(e);
		u.setPass(p);
		u.setRole(r);
		u = Daoimp.validate(u);
		
		if(u.getValid())
		{
			
			if(r.equals("P"))
			{
				HttpSession session = request.getSession();
				session.setAttribute("sess",u);
				
				/*RequestDispatcher rd = request.getRequestDispatcher("proctor.jsp");
				rd.forward(request,response);*/
				response.sendRedirect("proctor.jsp");
			}
			else if(r.equals("S"))
			{
				HttpSession session = request.getSession();
				session.setAttribute("sess",u);
				
				response.sendRedirect("student.jsp");
			}
			
		}
		else
		{
			out.print("<p>wrong details</p>");
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request,response);
		}
		}
		catch(Exception e1)
		{
			e1.printStackTrace();
		}
	}
	}
}
