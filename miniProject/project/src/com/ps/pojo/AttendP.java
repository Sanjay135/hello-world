package com.ps.pojo;

import java.util.ArrayList;
import java.util.List;

public class AttendP {
	
	private int m = 0;
	private int adb = 0;
	private int taken=0;
	private int ai=0;
	private int web=0;
	private int algo=0;
	private int iot=0;
	
	private List<String> subj;
	private String name="";
	
	public void setMaths(int m)
	{
		this.m = m;
	}
	public int getMaths()
	{
		return this.m;
	}
	
	/*ADBMS ATTENDANCE*/
	public void setAdb(int adb)
	{
		this.adb = adb;
	}
	public int getAdb()
	{
		return this.adb;
	}
	
	/*Ai ATTENDANCE*/
	public void setAi(int ai)
	{
		this.ai = ai;
	}
	public int getAi()
	{
		return this.ai;
	}
	
	/*Algo ATTENDANCE*/
	public void setAlgo(int algo)
	{
		this.algo = algo;
	}
	public int getAlgo()
	{
		return this.algo;
	}
	
	/*IOT ATTENDANCE*/
	public void setIot(int iot)
	{
		this.iot = iot;
	}
	public int getIot()
	{
		return this.iot;
	}
	
	/*Web ATTENDANCE*/
	public void setWeb(int web)
	{
		this.web = web;
	}
	public int getWeb()
	{
		return this.web;
	}
	
	/*TOTAL CLASSES TAKEN*/
	public void setClasses(int taken)
	{
		this.taken = taken;
	}
	public int getClasses()
	{
		return this.taken;
	}
	
	/*List of subjects*/
	public void setSub(List<String> subj)
	{
		this.subj = new ArrayList<String>(subj);
	}
	public List<String> getSub()
	{
		return new ArrayList<String>(this.subj);
	}
	
	/*Name of student*/
	public void setName(String name)
	{
		this.name = name;
	}
	public String getName()
	{
		return this.name;
	}
}
