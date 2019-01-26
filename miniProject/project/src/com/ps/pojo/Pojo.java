package com.ps.pojo;

import java.util.*;

public class Pojo {

	String email=" ";
	String pass=" ";
	String role=" ";
	boolean v=false;
	String sem=" ";
	int seq=0;
	
	List<Integer> ls = new ArrayList<Integer>();
	
	/*LOGIN*/
	public void setEmail(String email)
	{
		this.email = email;
	}
	
	public String getEmail()
	{
		return email;
	}
	
	public void setPass(String pass)
	{
		this.pass = pass;
	}
	
	public String getPass()
	{
		return pass;
	}
	
	public void setRole(String role)
	{
		this.role = role;
	}
	
	public String getRole()
	{
		return role;
	}
	
	public void setValid(boolean v)
	{
		this.v=v;
	}
	
	public boolean getValid()
	{
		return v;
	}
	
	/*semester*/
	public void setSem(String sem)
	{
		this.sem=sem;
	}
	
	public String getSem()
	{
		return sem;
	}
	
	/*Week*/
	public void setSeq(List<Integer> ls)
	{
		this.ls= new ArrayList<Integer>(ls);
	}
	
	public List<Integer> getSeq()
	{
		return this.ls;
	}
	
}
