package com.ps.daoimp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ps.pojo.AttendP;
import com.ps.pojo.Pojo;
import com.ps.util.SQLUtil;

public class AttendDAOimp {
	
	public static AttendP getAttending(Pojo u)
	{
		Connection con = null;
		AttendP a = new AttendP();
		List<String> ls2 = new ArrayList<String>();

		try
		{
			con = SQLUtil.connect();
			
			PreparedStatement ps = con.prepareStatement("select sub from attendence_subjects where sem=?");
			ps.setInt(1,Integer.parseInt(u.getSem()));
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				ls2.add(rs.getString("sub"));
			}
			a.setSub(ls2);
			
		}
		catch(Exception e)
		{
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
		
		try
		{
			con = SQLUtil.connect();
			
			PreparedStatement p = con.prepareStatement("select * from attendence_stu where user_id=? and sem=?");
			p.setString(1,u.getEmail());
			p.setInt(2,Integer.parseInt(u.getSem()));
			
			ResultSet r = p.executeQuery();
			
			if(r.next())
			{
				if(Integer.parseInt(u.getSem()) == 1)
				{
					a.setMaths(r.getInt("sub01"));
					a.setAdb(r.getInt("sub02"));
					a.setAi(r.getInt("sub03"));
					a.setClasses(r.getInt("classes_taken"));
					a.setName(r.getString("name"));
				}	
				
				else if(Integer.parseInt(u.getSem()) == 2)
				{
					a.setAlgo(r.getInt("sub04"));
					a.setIot(r.getInt("sub05"));
					a.setWeb(r.getInt("sub06"));
					a.setClasses(r.getInt("classes_taken"));
					a.setName(r.getString("name"));
				}
				
				else
				{
					a.setClasses(0);
				}
				
				
				
			}
			return a;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("error in dao");
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
		return a;
	}
}
