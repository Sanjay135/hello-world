package com.ps.daoimp;

import java.sql.PreparedStatement;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.ps.pojo.Pojo;

import java.sql.Connection;
import com.ps.util.SQLUtil;

import java.util.*;

public class Daoimp {
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
	
}
