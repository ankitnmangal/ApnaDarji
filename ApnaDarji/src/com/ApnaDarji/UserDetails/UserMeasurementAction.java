package com.ApnaDarji.UserDetails;

import java.io.PrintWriter;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import com.ApnaDarji.Authentication.ValidateUser;
import com.ApnaDarji.DAO.UserMeasurementDAO;
import com.ApnaDarji.DAO.UserMeasurementDAOImpl;
import com.ApnaDarji.Model.UserMeasurement;
public class UserMeasurementAction implements SessionAware {

	private UserMeasurement userMeasurement = new UserMeasurement();
	private SessionMap<String, Object> sessionMap; 
	private UserMeasurementDAO userMeasDAO= new UserMeasurementDAOImpl();
	
	
	@Override
	public void setSession(Map<String, Object> map) {
		this.sessionMap = (SessionMap<String, Object>) map;
	}


	public void execute() throws Exception {
		int userId =   (int) sessionMap.get("userId");
		userMeasDAO.addMeasurement(userMeasurement, userId);
		
	}
	

}
