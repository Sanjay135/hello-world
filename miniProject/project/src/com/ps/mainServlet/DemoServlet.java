package com.ps.mainServlet;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ps.daoimp.registerDAOImpl;


/**
 * Servlet implementation class DemoServlet
 */
@WebServlet("/DemoServlet")
public class DemoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DemoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		HashMap hm = new HashMap();
		String fname = request.getParameter("fname").toString();
		String usn = request.getParameter("usn").toString();
		String phone = request.getParameter("phone").toString();
		String dob = "NONE";
		String pwd1 = request.getParameter("pwd1").toString();
		String pwd2 = request.getParameter("pwd2").toString();
		String lname = request.getParameter("lname").toString();
		String addr = request.getParameter("addr").toString();
		String branch = request.getParameter("bran").toString();
		String course = request.getParameter("cour").toString();
		String role = request.getParameter("role").toString();
		
		hm.put("fname",fname);
		hm.put("lname",lname);
		hm.put("usn",usn);
		hm.put("phone",phone);
		hm.put("dob",dob);
		hm.put("pwd1",pwd1);
		hm.put("pwd2",pwd2);
		hm.put("addr",addr);
		hm.put("branch",branch);
		hm.put("course",course);
		hm.put("role", role);
		
		
		if(fname.isEmpty()||usn.isEmpty()||phone.isEmpty()||dob.isEmpty()||pwd1.isEmpty()||pwd2.isEmpty()
				|| lname.isEmpty() || addr.isEmpty()|| branch.equalsIgnoreCase("None") || course.equalsIgnoreCase("None") || role.equalsIgnoreCase("None"))
		{
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			out.println("<font color=red>Please fill all the fields</font>");
			rd.include(request, response);
		}
		else
		{
			if(!pwd1.equals(pwd2)){
				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				out.println("<font color=red>The password and confirm password entered are not same.</font>");
				rd.include(request, response);
				
			} else {
			registerDAOImpl dao = new registerDAOImpl();
			dao.registerData(hm);
			out.print("<p>Details registered Successfully!!!</p>");
			RequestDispatcher rd = request.getRequestDispatcher("success.jsp");
			rd.forward(request,response);
			}
		
		}
		
	}
}


