/**
 * 
 */
package com.ApnaDarji.UserDetails;

import java.util.Map;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import com.ApnaDarji.DAO.UserShirtMeasurementDAO;
import com.ApnaDarji.DAO.UserShirtMeasurementDAOImpl;
import com.ApnaDarji.Model.UserShirtMeasurement;
import com.opensymphony.xwork2.ModelDriven;

/**
 * @author shekhawd
 *
 */
public class UpdateShirtMeasurementAction implements SessionAware,ModelDriven<UserShirtMeasurement> {

	private static final long serialVersionUID = 1453434534647563L;

	private UserShirtMeasurement userShirtMeasurement = new UserShirtMeasurement();
	private UserShirtMeasurementDAO shirtdao = new UserShirtMeasurementDAOImpl();
	private SessionMap<String, Object> sessionMap;

	// private UserTrouserMeasurement userTrouserMeasurement=new
		// UserTrouserMeasurement();
		// UserTrouserMeasurementDAO trouserdao= new
		// UserTrouserMeasurementDAOImpl();

	@Override
	public void setSession(Map<String, Object> map) {
		this.sessionMap = (SessionMap<String, Object>) map;
	}

	public UserShirtMeasurement getModel() {
		return userShirtMeasurement;
	}

	public String AddShirtMeasurement() throws Exception {
		String response = "";
		Object inSession = sessionMap.get("inSession");
		if(inSession == null || !(boolean)inSession)
		{
				Object userIdObj = sessionMap.get("userId");
				if(userIdObj != null && !("").equals(userIdObj.toString())&& userShirtMeasurement != null)
				{
					long userId = Long.parseLong(sessionMap.get("userId").toString());
					System.out.println(userShirtMeasurement.getShirtMeasurementId());
					if (userId > 0 ) 
					{
						System.out.println(userId);
						shirtdao.addUserShirtMeasurement(userShirtMeasurement, userId);
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
		// For trouser Testing

		// trouserdao.addUserTrouserMeasurement(userTrouserMeasurement, 2);
		//
		// trouserdao.updateUserTrouserMeasurement(userTrouserMeasurement, 2,
		// 1);
	}

	public String DeleteShirtMeasurement() throws Exception {
		String response = "error";
		Object inSession = sessionMap.get("inSession");
		if(inSession == null || !(boolean)inSession)
		{
				Object userIdObj = sessionMap.get("userId");
				if(userIdObj != null && !("").equals(userIdObj.toString())&& userShirtMeasurement != null)
				{
					long userId = Long.parseLong(sessionMap.get("userId").toString());
					System.out.println(userShirtMeasurement.getShirtMeasurementId());
					if (userId > 0 ) {
						System.out.println(userId);
						shirtdao.deleteUserShirtMeasurement(userId,
								userShirtMeasurement.getShirtMeasurementId());
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
	
	public String UpdateShirtMeasurement() throws Exception {
		String response = "";
		Object inSession = sessionMap.get("inSession");
		if(inSession == null || !(boolean)inSession)
		{
				Object userIdObj = sessionMap.get("userId");
				if(userIdObj != null && !("").equals(userIdObj.toString())&& userShirtMeasurement != null)
				{
					long userId = Long.parseLong(sessionMap.get("userId").toString());
					System.out.println(userId);
					if(userId > 0 )
					{
						shirtdao.updateUserShirtMeasurement(userShirtMeasurement, userId, userShirtMeasurement.getShirtMeasurementId());
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