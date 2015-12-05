package com.ApnaDarji.UserDetails;

import java.util.Map;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import com.ApnaDarji.DAO.AddressDAO;
import com.ApnaDarji.DAO.AddressDAOImpl;
import com.ApnaDarji.DAO.UserDAO;
import com.ApnaDarji.DAO.UserDAOImpl;
import com.ApnaDarji.DAO.UserShirtMeasurementDAO;
import com.ApnaDarji.DAO.UserShirtMeasurementDAOImpl;
import com.ApnaDarji.DAO.UserTrouserMeasurementDAO;
import com.ApnaDarji.DAO.UserTrouserMeasurementDAOImpl;
import com.ApnaDarji.Model.User;
import com.opensymphony.xwork2.ModelDriven;

public class UserAccountDisplayAction implements SessionAware,ModelDriven<User>{
 
	private static final long serialVersionUID = 1L;
	private User user = new User();
	private SessionMap<String, Object> sessionMap; 
	
	@Override
	public void setSession(Map<String, Object> map) {
		this.sessionMap = (SessionMap<String, Object>) map;
	}

	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return user;
	}
	
	
	public String execute() throws Exception {
		String res = "error";
		System.out.println("UserAccountDisplay Action");
		if(sessionMap.get("inSession") != null && (boolean)sessionMap.get("inSession") == true){
			if(sessionMap.get("userId") != null)
			{
				long userId = Long.parseLong(sessionMap.get("userId").toString());
				System.out.println(userId);
				if(userId > -1l)
					{
//						user.setFirstName("arpit");
						AddressDAO addrDAO = new AddressDAOImpl();
						UserDAO userDAO = new UserDAOImpl();
						UserShirtMeasurementDAO shirtDAO = new UserShirtMeasurementDAOImpl();
						UserTrouserMeasurementDAO trouserDAO = new UserTrouserMeasurementDAOImpl();
						System.out.println("sdfsdfsdfsdfsdfsdfsdfihgoidhfgoidhfgoihdfoighdoifhgoidhfgiodhdfsdfsdf"+userId);
						User tempuser = userDAO.getUserDetails(userId);
						user.setFirstName(tempuser.getFirstName());
						user.setDOReg(tempuser.getDOReg());
						user.setEmailId(tempuser.getEmailId());
						user.setLastName(tempuser.getLastName());
						user.setPassword(tempuser.getPassword());
						user.setPrimaryContactNO(tempuser.getPrimaryContactNO());
						user.setUserId(tempuser.getUserId());
						user.setAddrList(tempuser.getAddrList());
						System.out.println(user.getAddrList());
						user.setShirtMeasureList(tempuser.getShirtMeasureList());
						user.setTrouserMeasureList(tempuser.getTrouserMeasureList());
						res = "success";
					}
				else
					{
						res= "error";
					}
			}
			else{
				res= "error";
			}
		}
		else{
			res = "error";
		}
		return res;
	}


	
}
