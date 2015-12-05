package com.ApnaDarji.UserDetails;

import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import com.ApnaDarji.Authentication.ValidateUser;
import com.ApnaDarji.DAO.UserDAO;
import com.ApnaDarji.DAO.UserDAOImpl;
import com.ApnaDarji.Model.User;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UpdateProfileAction extends ActionSupport implements SessionAware, ModelDriven<User>{
	
	private static final long serialVersionUID = 1L;
	
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
	
	public String execute() throws Exception {
		String response = "";
		Object inSession = sessionMap.get("inSession");
		if(inSession == null || !(boolean)inSession)
		{
				Object userId = sessionMap.get("userId");
				if(userId != null && !("").equals(userId.toString()) && user != null)
				{
	//				update the user  personal info in db for this userId
					response = SUCCESS;
				}
		}
		else
		{
			response = ERROR;
		}
		return response;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	
}
