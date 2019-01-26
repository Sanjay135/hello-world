package com.ps.mainServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ps.daoimp.registerDAOImpl;

/**
 * Servlet implementation class FeedBackServlet
 */
@WebServlet("/FeedBackServlet")
public class FeedBackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FeedBackServlet() {
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
				System.out.println("Hello-----");
				String sub1 = request.getParameter("sub1").toString();
				String sub2 = request.getParameter("sub2").toString();
				String sub3 = request.getParameter("sub3").toString();
				String sub4 = request.getParameter("sub4").toString();
				String sub5 = request.getParameter("sub5").toString();
				String sub6 = request.getParameter("sub6").toString();
				String sub7 = request.getParameter("sub7").toString();
				String usn = request.getParameter("usn").toString();
				System.out.println("sub1---"+sub1);
				System.out.println("sub2----"+sub2);
				System.out.println("sub3----"+sub3);
				System.out.println("sub4----"+sub4);
				System.out.println("sub5----"+sub5);
				System.out.println("sub6----"+sub6);
				hm.put("sub1", sub1);
				hm.put("sub2", sub2);
				hm.put("sub3", sub3);
				hm.put("sub4", sub4);
				hm.put("sub5", sub5);
				hm.put("sub6", sub6);
				hm.put("sub7", sub7);
				hm.put("usn",usn);
				try{
				if(sub1.isEmpty()||sub2.isEmpty()||sub3.isEmpty()||sub4.isEmpty()||sub5.isEmpty()||sub6.isEmpty()
						|| sub7.isEmpty())
				{
					RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
					out.println("<font color=red>Please provide rating for all the faculties.</font>");
					rd.include(request, response);
				}
				else
				{
					registerDAOImpl dao = new registerDAOImpl();
					dao.updateFeedbackData(hm);
					out.print("<p>Feedback details submitted successfully!!!</p>");
					RequestDispatcher rd = request.getRequestDispatcher("FSuccess.jsp");
					rd.forward(request,response);
					
				}
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			}
				
}
