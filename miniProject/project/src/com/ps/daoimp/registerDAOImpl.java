package com.ps.daoimp;



import java.sql.PreparedStatement;


import java.sql.ResultSet;
import java.sql.SQLException;

import com.ps.pojo.Pojo;

import java.sql.Connection;
import java.sql.DriverManager;

import com.ps.util.SQLUtil;

import java.util.*;

public class registerDAOImpl {
	public static Pojo validate(Pojo u)
	{
		Connection con = null;
		try
		{
		con = SQLUtil.connect();
		PreparedStatement ps = con.prepareStatement("select * from password_table where user_id=? and password=? and type=?");
		ps.setString(1,u.getEmail());
		ps.setString(2,u.getPass());
		ps.setString(3,u.getRole());
				
		ResultSet rs = ps.executeQuery();
		
		if(rs.next())
		{
			u.setEmail(rs.getString("user_id"));
			u.setPass(rs.getString("password"));
			u.setRole(rs.getString("type"));
			u.setValid(true);
		}
		else
		{
			u.setValid(false);
		}
		}
		catch(Exception e)
		{
			System.out.println("error in Dao");
			e.printStackTrace();
		}
		finally
		{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return u;
	}
	
	public boolean registerData(HashMap hm)
	{
		System.out.println("Inside impl method");
		Connection con = null;
		String str,str1 = "";
		try
		{
		con = SQLUtil.connect();
		str = "insert into password_table(user_id,password,type) values(?,?,?)";
		str1 = "insert into cand_details(n_user_id,fname,lname,addr,phone,branch,course) values(?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(str);
		ps.setString(1, hm.get("usn").toString());
		ps.setString(2, hm.get("pwd1").toString());
		ps.setString(3, hm.get("role").toString());
		ps.executeUpdate();
		PreparedStatement ps1 = con.prepareStatement(str1);
		
		ps1.setString(1, hm.get("usn").toString());
		ps1.setString(2, hm.get("fname").toString());
		ps1.setString(3, hm.get("lname").toString());
		//ps1.setString(4, dob);
		ps1.setString(4, hm.get("addr").toString());
		ps1.setString(5, hm.get("phone").toString());
		ps1.setString(6, hm.get("branch").toString());
		ps1.setString(7, hm.get("course").toString());
		ps1.executeUpdate();
		}
		
		catch(Exception e)
		{
			System.out.println("error in Dao");
			e.printStackTrace();
		}
		finally
		{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return true;
	}
	
	public HashMap profileData(String usn)
	{
		System.out.println("Inside profileData impl method");
		Connection con = null;
		String str,str1 = "";
		HashMap hm = null;
		try
		{
		con = SQLUtil.connect();
		str = "Select n_user_id,fname,lname,addr,phone,branch,course from cand_details where n_user_id='"+usn+"'";
		PreparedStatement ps = con.prepareStatement(str);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			hm = new HashMap();
			hm.put("usn", rs.getString("n_user_id"));
			hm.put("fname", rs.getString("fname"));
			hm.put("lname", rs.getString("lname"));
			hm.put("addr", rs.getString("addr"));
			hm.put("phone", rs.getString("phone"));
			hm.put("branch", rs.getString("branch"));
			hm.put("course", rs.getString("course"));
			}
		}
		
		catch(Exception e)
		{
			System.out.println("error in Dao");
			e.printStackTrace();
		}
		finally
		{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println("hm values---"+hm);
		return hm;
	}
	
	public boolean updateFeedbackData(HashMap hm)
	{
		System.out.println("Inside impl method"+hm);
		Connection con = null;
		String str = "";
		//System.out.println("sub1 value "+Integer.parseInt(hm.get("sub1").toString()));
		try
		{
		con = SQLUtil.connect();
		str = "insert into feedback_details(n_user_id,sub1,sub2,sub3,sub4,sub5,sub6,sub7) values(?,?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(str);
		ps.setString(1, hm.get("usn").toString());
		ps.setInt(2, Integer.parseInt(hm.get("sub1").toString()));
		ps.setInt(3, Integer.parseInt(hm.get("sub2").toString()));
		ps.setInt(4, Integer.parseInt(hm.get("sub3").toString()));
		ps.setInt(5, Integer.parseInt(hm.get("sub4").toString()));
		ps.setInt(6, Integer.parseInt(hm.get("sub5").toString()));
		ps.setInt(7, Integer.parseInt(hm.get("sub6").toString()));
		ps.setInt(8, Integer.parseInt(hm.get("sub7").toString()));
		
		ps.executeUpdate();
		}
		
		catch(Exception e)
		{
			System.out.println("error in Dao");
			e.printStackTrace();
		}
		finally
		{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return true;
	}
	
	public HashMap isFeedback(String usn)
	{
		System.out.println("Inside isFeedback impl method");
		Connection con = null;
		String str,str1 = "";
		HashMap hm = null;
		try
		{
		con = SQLUtil.connect();
		str = "Select n_user_id from feedback_details where n_user_id='"+usn+"'";
		PreparedStatement ps = con.prepareStatement(str);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			hm = new HashMap();
			hm.put("usn", rs.getString("n_user_id"));
			hm.put("value","NA");
			}
		}
		
		catch(Exception e)
		{
			System.out.println("error in Dao");
			e.printStackTrace();
		}
		finally
		{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println("hm values---"+hm);
		return hm;
	}
	
	public List viewFeedback()
	{
		System.out.println("Inside isFeedback impl method");
		Connection con = null;
		String str,str1 = "";
		HashMap hm = null;
		List list = new ArrayList();
		try
		{
		con = SQLUtil.connect();
		str = "Select a.n_user_id usn,b.fname name,a.sub1 sub1,a.sub2 sub2,a.sub3 sub3,a.sub4 sub4,a.sub5 sub5,a.sub6 sub6,a.sub7 sub7 from feedback_details a,cand_details b where a.n_user_id=b.n_user_id ";
		PreparedStatement ps = con.prepareStatement(str);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			hm = new HashMap();
			hm.put("usn", rs.getString("usn"));
			hm.put("name", rs.getString("name"));
			hm.put("sub1",rs.getString("sub1"));
			hm.put("sub2", rs.getString("sub2"));
			hm.put("sub3", rs.getString("sub3"));
			hm.put("sub4", rs.getString("sub4"));
			hm.put("sub5", rs.getString("sub5"));
			hm.put("sub6", rs.getString("sub6"));
			hm.put("sub7", rs.getString("sub7"));
			list.add(hm);
			}
		}
		
		catch(Exception e)
		{
			System.out.println("error in Dao");
			e.printStackTrace();
		}
		finally
		{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println("hm values---"+hm);
		return list;
	}

}
