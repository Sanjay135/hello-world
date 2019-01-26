package bean;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;

import com.ps.daoimp.registerDAOImpl;

public class ProfileBean {
	String usn ="";
	public String getUsn() {
		return usn;
	}
	public void setUsn(String usn) {
		this.usn = usn;
	}
	
 public HashMap getRecords(String usn){
	 System.out.println("usn value in bean--"+usn);
	 registerDAOImpl dao = new registerDAOImpl();
	 HashMap hm = new HashMap();
	 hm = dao.profileData(usn);
	 System.out.println("bean method");
	 return hm;
 }
 
 public HashMap isFeedBack(String usn){
	 System.out.println("usn value in bean--"+usn);
	 registerDAOImpl dao = new registerDAOImpl();
	 HashMap hm = new HashMap();
	 hm = dao.isFeedback(usn);
	 System.out.println("bean method isfeedback details"+usn);
	 return hm;
 }
 
 public List viewFeedBack(){
	 registerDAOImpl dao = new registerDAOImpl();
	 List list = new ArrayList();
	 list = dao.viewFeedback();
	 System.out.println("bean method view feedback details");
	 return list;
 }
}
