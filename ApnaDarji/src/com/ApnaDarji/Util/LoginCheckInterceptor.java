package com.ApnaDarji.Util;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginCheckInterceptor extends AbstractInterceptor {

    
	private static final long serialVersionUID = 1L;

	@Override
    public String intercept(ActionInvocation invocation) throws Exception {
            Map<String, Object> session = invocation.getInvocationContext().getSession();
            Object inSessionObj = session.get("inSession");
            System.out.println("working in LoginCheckInterceptor with sess obj: "+inSessionObj);
            if ((Boolean)inSessionObj) 
            {
            		System.out.println("user is in session");
            		return invocation.invoke();
                   
            } 
            else 
            {
            	return Action.LOGIN;
            }
    }
}