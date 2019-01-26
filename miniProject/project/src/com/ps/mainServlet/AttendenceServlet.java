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

import com.ps.daoimp.AttendDAOimp;
import com.ps.pojo.AttendP;
import com.ps.pojo.Pojo;

/**
 * Servlet implementation class AttendenceServlet
 */
@WebServlet("/AttendenceServlet")
public class AttendenceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String req_type = request.getParameter("req_type");
		
		if(req_type.equals("GetAttendance"))
		{
			String usn = request.getParameter("atten_usn");
			String sem = request.getParameter("sem");
			
			Pojo u = new Pojo();
			u.setEmail(usn);
			u.setSem(sem);
			out.print("<p>before dao</p>");
			
			AttendP a = AttendDAOimp.getAttending(u);
			
			out.println("<p>servlet working</p>");
			
			/*HttpSession sess1 = request.getSession();
			sess1.setAttribute("attend", a);
			
			response.sendRedirect("attendence.jsp");*/
			
			request.setAttribute("attenObj", a);
			request.setAttribute("user",u);
			RequestDispatcher rd = request.getRequestDispatcher("attendence.jsp");
			rd.forward(request,response);
		}
		
		//Attendance page
		else if(req_type.equals("button"))
		{
			Pojo ses = (Pojo)request.getAttribute("sess");
			HttpSession sess = request.getSession();
			sess.setAttribute("sess", ses);
			response.sendRedirect("attendence.jsp");
			
		}
		
		//LOGOUT SERVLET
		else if(req_type.equals("logout"))
		{
			request.getSession().removeAttribute("sess");
			
			request.getSession().invalidate();
			response.sendRedirect("login.jsp");
		}
		
		else
		{
			response.sendRedirect("attendence.jsp");
		}
	}

}
