package com.ApnaDarji.UserDetails;

import java.util.Map;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import com.ApnaDarji.DAO.UserTrouserMeasurementDAO;
import com.ApnaDarji.DAO.UserTrouserMeasurementDAOImpl;
import com.ApnaDarji.Model.UserTrouserMeasurement;
import com.opensymphony.xwork2.ModelDriven;

public class UpdateTrouserMeasurementAction implements SessionAware,
		ModelDriven<UserTrouserMeasurement> {

	private static final long serialVersionUID = 124564334647563L;

	private UserTrouserMeasurement userTrouserMeasurement = new UserTrouserMeasurement();
	private UserTrouserMeasurementDAO trouserdao = new UserTrouserMeasurementDAOImpl();
	private SessionMap<String, Object> sessionMap;

	@Override
	public void setSession(Map<String, Object> map) {
		this.sessionMap = (SessionMap<String, Object>) map;
	}

	public UserTrouserMeasurement getModel() {
		return userTrouserMeasurement;
	}

	public String AddTrouserMeasurement() throws Exception {
		String response = "";
		Object inSession = sessionMap.get("inSession");
		if(inSession == null || !(boolean)inSession)
		{
				Object userIdObj = sessionMap.get("userId");
				if(userIdObj != null && !("").equals(userIdObj.toString()) && userTrouserMeasurement != null)
				{
					long userId = Long.parseLong(sessionMap.get("userId").toString());
					System.out
							.println(userTrouserMeasurement.getTrouserMeasurementId());
					if (userId > 0) {
						System.out.println(userId);
						trouserdao.addUserTrouserMeasurement(userTrouserMeasurement,
								userId);
						response = "success";
					}
				}
				else 
				{
					response = "error";
				}
		} 
		else 
		{
			response = "error";
		}
		return response;
	}

	public String DeleteTrouserMeasurement() throws Exception {
		String response = "error";
		Object inSession = sessionMap.get("inSession");
		if(inSession == null || !(boolean)inSession)
		{
				Object userIdObj = sessionMap.get("userId");
				if(userIdObj != null && !("").equals(userIdObj.toString()) && userTrouserMeasurement != null)
				{
					long userId = Long.parseLong(sessionMap.get("userId").toString());
					System.out
							.println(userTrouserMeasurement.getTrouserMeasurementId());
					if (userId > 0 && userTrouserMeasurement != null) {
						System.out.println(userId);
						trouserdao.deleteUserTrouserMeasurement(userId,	userTrouserMeasurement.getTrouserMeasurementId());
						response = "success";
					}
				}
				else 
				{
					response = "error";
				}
		} 
		else 
		{
			response = "error";
		}
		return response;

	}

	public String UpdateTrouserMeasurement() throws Exception {
		String response = "";
		Object inSession = sessionMap.get("inSession");
		if(inSession == null || !(boolean)inSession)
		{
				Object userIdObj = sessionMap.get("userId");
				if(userIdObj != null && !("").equals(userIdObj.toString()) && userTrouserMeasurement != null)
				{
					long userId = Long.parseLong(sessionMap.get("userId").toString());
					System.out.println(userId);
					if (userId > 0 && userTrouserMeasurement != null) {
						trouserdao.updateUserTrouserMeasurement(userTrouserMeasurement,
								userId,
								userTrouserMeasurement.getTrouserMeasurementId());
						response = "success";
					}
				}
				else 
				{
					response = "error";
				}
		} 
		else 
		{
			response = "error";
		}

		return response;
	}
}