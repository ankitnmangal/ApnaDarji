package com.ApnaDarji.Authentication;

import java.io.PrintWriter;
import java.util.Date;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import com.ApnaDarji.DAO.UserDAO;
import com.ApnaDarji.DAO.UserDAOImpl;
import com.ApnaDarji.Model.User;

public class CodeConfirmationAction implements SessionAware{
	
	private String codeConfirm;
	private SessionMap<String, Object> sessionMap; 
	
	@Override
	public void setSession(Map<String, Object> map) {
		this.sessionMap = (SessionMap<String, Object>) map;
	}
	
	public void execute() throws Exception {
		System.out.println(codeConfirm);
		ServletActionContext.getResponse().setContentType("text/plain");
	    PrintWriter responseStream = ServletActionContext.getResponse().getWriter();
		String res = null;
		
		Object confirmCodeSession = sessionMap.get("confirmCodeSession");
		if(confirmCodeSession != null && (boolean)confirmCodeSession == true)
		{
			String confirmationCode = (String) sessionMap.get("confirmationCode");
			Date confirmationCodeGenerationTime = (Date) sessionMap.get("confirmationCodeGenerationTime");
			Date now = new Date();
			 long diff = now.getTime() - confirmationCodeGenerationTime.getTime();
			 System.out.println(diff);
			 long diffMinutes = diff/(60);
			 System.out.println(diffMinutes+"diffMinutes");
			 System.out.println(confirmationCode);
			 System.out.println(codeConfirm);
			 if(diffMinutes < 15000 && diffMinutes > 0 && confirmationCode != null && !("").equals(confirmationCode.trim()))
			 {
				 if(codeConfirm != null && codeConfirm != null && !("").equals(codeConfirm.trim()) && codeConfirm.equals(confirmationCode))
				 {
					 System.out.println(confirmationCode);
					 User user = (User) sessionMap.get("signingUpUser");
					 UserDAO userDAO = new UserDAOImpl();
					 userDAO.addUser(user);
					 sessionMap.remove("signingUpUser");
					 sessionMap.put("userId", user.getUserId());
					 sessionMap.put("inSession", true);
					 res="success";
				 }
				 else{
					 res = "Confirmation code is not correct";
				 }
			 }
			 else
			 {
				 sessionMap.remove("confirmationCode");
				 sessionMap.remove("confirmationCodeGenerationTime");
				 sessionMap.put("confirmCodeSession", false);
				 sessionMap.remove("confirmCodeSession");
				 sessionMap.remove("signingUpUser");
				 res = "Your session has been expired, Please Sign Up again";
			 }
		}
		else{
			res = "Your session has been expired, Please Sign Up again";
		}
		
		 responseStream.println(res);
	}

	public String getCodeConfirm() {
		return codeConfirm;
	}

	public void setCodeConfirm(String codeConfirm) {
		this.codeConfirm = codeConfirm;
	}


}
