package com.ApnaDarji.Authentication;

import java.io.PrintWriter;
import java.util.Map;

import javax.xml.bind.ParseConversionEvent;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import com.ApnaDarji.DAO.PasswordDAO;
import com.ApnaDarji.DAO.PasswordDAOImpl;
import com.ApnaDarji.DAO.UserDAO;
import com.ApnaDarji.DAO.UserDAOImpl;
import com.ApnaDarji.Model.Password;
import com.ApnaDarji.Model.User;
import com.opensymphony.xwork2.ModelDriven;

public class ChangePasswordAction implements SessionAware, ModelDriven<Password> {

	Password pass = new Password();
	PasswordDAO daopass = new PasswordDAOImpl();

	private SessionMap<String, Object> sessionMap;

	@Override
	public void setSession(Map<String, Object> map) {
		this.sessionMap = (SessionMap<String, Object>) map;
	}

	@Override
	public Password getModel() {
		// TODO Auto-generated method stub
		return pass;
	}

	public void execute() throws Exception {
		ServletActionContext.getResponse().setContentType("text/plain");
		PrintWriter responseStream = ServletActionContext.getResponse()
				.getWriter();
		boolean inSession = false;
		String response = "";
		sessionMap.put("inSession", inSession);

		boolean credentialValidated = ValidateUser.ValidatePasswordFormat(pass);
		if (credentialValidated) {
			// UserID from Session
			long userId = Long.parseLong(sessionMap.get("userId").toString());
			System.out.println(userId);
			boolean PasswordUpdated = daopass.changePassword(pass, userId);

			if (PasswordUpdated) {
				response = "success";
			} else {
				response = "OLD Password is not correct"; 
			}

		} else {
			response = "Password and Confirm password does not match";
		}
		responseStream.println(response);
	}

}
