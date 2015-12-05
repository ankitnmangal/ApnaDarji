package com.ApnaDarji.Authentication;

import java.io.PrintWriter;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import com.ApnaDarji.DAO.UserDAO;
import com.ApnaDarji.DAO.UserDAOImpl;
import com.ApnaDarji.Model.User;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class LoginAction  implements SessionAware, ModelDriven<User>{

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
	    Object inSessionCheck = sessionMap.get("inSession");
		if(inSessionCheck == null || !(boolean)inSessionCheck)
		{
				boolean inSession = false;
				String response = "";
				sessionMap.put("inSession",inSession);
				String emailId = user.getEmailId();
				System.out.println(emailId + user.getFirstName() + user.getLastName());
				String validityMesg = ValidateUser.LoginFormValidation(user);
				response = validityMesg;
				
				if(validityMesg.equals("success"))
				{
					// get userId from db by emailId........
					long userId = dao.getUserIdByEmailId(emailId, user);
					if(userId == -1){
						response = "Email Id Not Found";
					}
					else if(userId == -2)
						{
						response = "Password Does Not Match";
						}
						else
							{
								System.out.println(userId);
								//PUTTING USER Id INTO SESSION..........
								sessionMap.put("userId", userId);
								inSession = true;
								sessionMap.put("inSession",inSession);
								System.out.println(inSession);
								response = "success";
							}
					
				}
			    responseStream.print(response);
			}
		else
		{
			responseStream.print("You are already Logged In");
		}
	}
}
