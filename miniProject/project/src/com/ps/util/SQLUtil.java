package com.ps.util;

import java.sql.Connection;
import java.sql.DriverManager;


public class SQLUtil {
	public static Connection connect() throws Exception
	{
		Connection con;
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb","root","root");
		return con;
	}
}
