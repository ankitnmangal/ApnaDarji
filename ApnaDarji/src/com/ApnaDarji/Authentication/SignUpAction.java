package com.ApnaDarji.Authentication;

import java.io.PrintWriter;
import java.util.Date;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import Mailing.EmailUtility;

import com.ApnaDarji.DAO.UserDAO;
import com.ApnaDarji.DAO.UserDAOImpl;
import com.ApnaDarji.Model.User;
import com.opensymphony.xwork2.ModelDriven;

public class SignUpAction implements SessionAware, ModelDriven<User>{
	private String conPass;
	private User user = new User();
	UserDAO dao = new UserDAOImpl();
	private SessionMap<String, Object> sessionMap; 
	
	@Override
	public void setSession(Map<String, Object> map) {
		this.sessionMap = (SessionMap<String, Object>) map;
	}

	@Override
	public User getModel() {
		return user ;
	}
	
	public void execute() throws Exception {
		ServletActionContext.getResponse().setContentType("text/plain");
		PrintWriter responseStream = ServletActionContext.getResponse().getWriter();
		Object inSession = sessionMap.get("inSession");
		if(inSession == null || !(boolean)inSession)
		{
			boolean confirmCodeSession = false;
			sessionMap.put("confirmCodeSession",confirmCodeSession);
			String response = null;
			String emailId = user.getEmailId();
			System.out.println(user.getFirstName());
			System.out.println(user.getLastName());
			System.out.println(emailId);
			String validityMesg = ValidateUser.SignUpFormValidation(user,conPass);
			response = validityMesg;
			if(validityMesg.equals("success")){
				
				// Check if user exists
				boolean exists = dao.doUserExists(emailId);
				
				if(!exists)
				{
					
					try{
							sessionMap.put("signingUpUser",user);
							confirmCodeSession = true;
							int random = (int) (Math.random()*1000000);
							System.out.println(random);
							String confirmationCode = "AD"+random;
							System.out.println(confirmationCode);
							Date confirmationCodeGenerationTime = new Date();
							System.out.println(confirmationCodeGenerationTime);
							sessionMap.put("confirmationCodeGenerationTime",confirmationCodeGenerationTime);
							sessionMap.put("confirmationCode", confirmationCode);
							EmailUtility.sendEmail("", "", "", "", user.getEmailId(), "ApnaDarji Code Confirmation", "Your code is "+confirmationCode+", Please confirm in 15 minutes to sign up successfully.");
							sessionMap.put("confirmCodeSession",confirmCodeSession);
							response = "success";
						}
						catch(Exception e){
							response = "something went worng while sending you confirmation code";
							confirmCodeSession = false;
							e.printStackTrace();
						}
							
				}
				else{
					response = "User Already Exists Please Login.";
				}
			}
		    responseStream.print(response);
		}
		else{
			responseStream.print("You are already Logged In");
		}
		
	}

	public String getConPass() {
		return conPass;
	}

	public void setConPass(String conPass) {
		this.conPass = conPass;
	}

}
