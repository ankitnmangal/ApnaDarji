package com.ApnaDarji.Authentication;

import java.io.PrintWriter;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

public class LogoutAction implements SessionAware{
	

	private SessionMap<String, Object> sessionMap; 
	@Override
	public void setSession(Map<String, Object> map) {
		// TODO Auto-generated method stub
		this.sessionMap = (SessionMap<String, Object>) map;
	}
	
	
	public void execute() throws Exception {
		ServletActionContext.getResponse().setContentType("text/plain");
	    PrintWriter responseStream = ServletActionContext.getResponse().getWriter();
	    Object inSessionCheck = sessionMap.get("inSession");
		if(inSessionCheck != null && (boolean)inSessionCheck)
		{
			boolean inSession = false;
			sessionMap.put("inSession",inSession);
			//removing USER Id from SESSION..........
			sessionMap.remove("userId");
			sessionMap.invalidate();
			inSession = false;
			sessionMap.put("inSession",inSession);
			System.out.println(inSession);
		    responseStream.print("removed");
		}
		else{
			 responseStream.print("Please Log In to Log Out");
		}
	}
}
