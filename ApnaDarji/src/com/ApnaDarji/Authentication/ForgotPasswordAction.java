package com.ApnaDarji.Authentication;

import java.io.PrintWriter;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import Mailing.EmailUtility;

import com.ApnaDarji.DAO.PasswordDAO;
import com.ApnaDarji.DAO.PasswordDAOImpl;
import com.ApnaDarji.DAO.UserDAO;
import com.ApnaDarji.DAO.UserDAOImpl;

public class ForgotPasswordAction implements SessionAware{
	private String emailId;
	UserDAO userDAO = new UserDAOImpl();
	PasswordDAO passDAO = new PasswordDAOImpl();
	private SessionMap<String, Object> sessionMap; 
	
	@Override
	public void setSession(Map<String, Object> map) {
		this.sessionMap = (SessionMap<String, Object>) map;
	}

	
	public void execute() throws Exception {
		ServletActionContext.getResponse().setContentType("text/plain");
		PrintWriter responseStream = ServletActionContext.getResponse().getWriter();
		Object inSession = sessionMap.get("inSession");
		if(inSession == null || !(boolean)inSession)
		{
			String response = null;
			
			System.out.println(emailId);
			String validityMesg = ValidateUser.ForgotPassConfirmation(emailId);
			if(validityMesg.equals("success")){
				
				// Check if user exists
				boolean exists = userDAO.doUserExists(emailId);
				
				if(exists)
				{
					
					try{
							String pass = passDAO.getUserPassByEmailId(emailId);
							EmailUtility.sendEmail("", "", "", "", emailId, "ApnaDarji Password Information", "Your password is "+pass +". We are improving to give you best services, Soon there will be a password changing link availbale.");
							response = "success";
						}
						catch(Exception e){
							response = "something went worng while sending you an email.";
							e.printStackTrace();
						}
							
				}
				else{
					response = "Email Id not found!! Please Sign Up.";
				}
			}
		    responseStream.print(response);
		}
		else{
			responseStream.print("You are already Logged In");
		}
		
	}


	public String getEmailId() {
		return emailId;
	}


	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

}
