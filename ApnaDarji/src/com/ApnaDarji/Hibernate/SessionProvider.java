package com.ApnaDarji.Hibernate;

import org.hibernate.Session;
import org.hibernate.cfg.Configuration;

public class SessionProvider {

	public static Session getSession() {
		Session session = null;
		try{
			Configuration config = new Configuration().configure("hibernate.cfg.xml");
			System.out.println("config done");
			 session = config.buildSessionFactory().openSession();
			
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		
		return session;
	}

}
