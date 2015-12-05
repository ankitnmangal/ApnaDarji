package com.ApnaDarji.UserDetails;

import java.util.Map;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import com.ApnaDarji.DAO.AddressDAO;
import com.ApnaDarji.DAO.AddressDAOImpl;
import com.ApnaDarji.DAO.UserDAO;
import com.ApnaDarji.DAO.UserDAOImpl;
import com.ApnaDarji.Model.Address;
import com.opensymphony.xwork2.ModelDriven;

public class UpdateAddressAction implements SessionAware, ModelDriven<Address>{
	
	private static final long serialVersionUID = 145345734583647563L;
	
	private Address address = new Address();
	AddressDAO addDao= new AddressDAOImpl();
	private SessionMap<String, Object> sessionMap; 
	
	@Override
	public void setSession(Map<String, Object> map) {
		this.sessionMap = (SessionMap<String, Object>) map;
	}

	@Override
	public Address getModel() {
		return address ;
	}
	
	public String UpdateAddress() throws Exception {
		String response = "";
		Object inSession = sessionMap.get("inSession");
		if(inSession == null || !(boolean)inSession)
		{
				Object userIdObj = sessionMap.get("userId");
				if(userIdObj != null && !("").equals(userIdObj.toString()) && address != null)
				{
					long userId =  Long.parseLong(userIdObj.toString());
					System.out.println(address.getAlternateContactNumber());
					addDao.updateAddress(address, userId);
					response = "success";
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

	public String DeleteAddress(){
		String response = "";
		Object inSession = sessionMap.get("inSession");
		if(inSession == null || !(boolean)inSession)
		{
				Object userIdObj = sessionMap.get("userId");
				if(userIdObj != null && !("").equals(userIdObj.toString()) && address != null)
				{
					long userId =  Long.parseLong(userIdObj.toString());
					long addId = address.getAddrId();
					if(userId > 0  && addId > 0)
					{
						System.out.println(userId+addId);
						addDao.deleteAddress(userId, addId);
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
	
	public String AddAddress(){
		String response = "";
		Object inSession = sessionMap.get("inSession");
		if(inSession == null || !(boolean)inSession)
		{
				Object userIdObj = sessionMap.get("userId");
				if(userIdObj != null && !("").equals(userIdObj.toString()) && address != null)
				{
					long userId =  Long.parseLong(userIdObj.toString());
					System.out.println(address.getAddrId());
					if(userId > 0)
					{
						System.out.println(userId);
						addDao.addAddress(address, userId);
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