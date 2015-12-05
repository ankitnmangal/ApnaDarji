package com.ApnaDarji.DAO;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;












import com.ApnaDarji.Hibernate.SessionProvider;
import com.ApnaDarji.Model.Address;
import com.ApnaDarji.Model.Password;
import com.ApnaDarji.Model.User;
import com.ApnaDarji.Model.UserShirtMeasurement;
import com.ApnaDarji.Model.UserTrouserMeasurement;

public class UserDAOImpl implements UserDAO {
	

	private static final Logger logger = Logger.getLogger(ProductDAOImpl.class);
	@Override
	public User getUserDetails(long userId) {
		User user =  new User();
		List<Address> addressList= new ArrayList<Address>();
		List<UserShirtMeasurement> userShirtMeasurementList = new ArrayList<UserShirtMeasurement>();
		List<UserTrouserMeasurement> userTrouserMeasurementList = new ArrayList<UserTrouserMeasurement>();
		System.out.println("taking session");
		//get connection from session factory............
		Session session = SessionProvider.getSession();
		Transaction tx = null;
		if(session == null){
			System.out.println("session is null");
		}
		else{
			System.out.println("got session");
		}
		
		try 
		{
			System.out.println("begin transaction");
		   tx = session.beginTransaction();
		   // do some work
		   System.out.println("creating query");
		   Query query = session.createQuery("from User as user where user.userId=:userId");
		   query.setLong("userId", userId);
		   user =  (User) query.list().get(0);
		   query = session.createQuery("from Address as a where a.userId=:userId");
		   query.setLong("userId", userId);
		    addressList = query.list();
		    user.setAddrList(addressList);
		     query = session.createQuery("from UserShirtMeasurement as a where a.userId=:userId");
			query.setLong("userId", userId);
			userShirtMeasurementList = query.list();
			user.setShirtMeasureList(userShirtMeasurementList);
			query = session.createQuery("from UserTrouserMeasurement as a where a.userId=:userId");
			query.setLong("userId", userId);
			userTrouserMeasurementList = query.list();
			user.setTrouserMeasureList(userTrouserMeasurementList);
		   System.out.println("query created");
		  
		   tx.commit();
		}
		catch (Exception e) 
		{
			
		   if (tx!=null)
		   {
			   tx.rollback();
		   }
		   e.printStackTrace(); 
		   logger.error("LOG4J ERROR :"+e.toString(),e);
		   
		}
		finally 
		{
		   session.close();
		}
	
		return user;
	}
	
	
	@Override
	public long getUserIdByEmailId(String emailId, User user) {
		
		 long userId  = 0;
		System.out.println("taking session");
		//get connection from session factory............
		Session session = SessionProvider.getSession();
		Transaction tx = null;
		System.out.println("got session");
		try 
		{
			System.out.println("begin transaction");
			if(session == null){
				System.out.println("session is null");
			}
		   tx = session.beginTransaction();
		   // do some work
		   System.out.println("creating query");
		   Query query = session.createQuery("SELECT u.userId FROM User as u WHERE u.emailId = :emailId");
		   query.setString("emailId", emailId);
		   System.out.println("query created");
		   
		   if(query.uniqueResult()==null)
		   {
			   System.out.println("Emaiil ID not found" + query);
			   userId = -1;
			   tx.commit();
			   return userId;
		   }
		   else
		   {
			   		tx = session.beginTransaction();
				   query = session.createQuery("SELECT u.userId from User as u WHERE u.emailId =:emailId and u.password=:password");
				   query.setString("emailId", user.getEmailId());
				   query.setString("password", user.getPassword());
				   System.out.println("query created");
				   tx.commit();
				   if(query.uniqueResult()==null)
				   {
					   userId = -2;
					   System.out.println("Password doest not match");
				   }
				   else
				   {
					   userId =(long) query.uniqueResult();
					   System.out.println("got userId === "+ userId);
				   }
		   }
		}
		catch (Exception e) 
		{
			
		   if (tx!=null) 
			{
			   	tx.rollback();
			 }
		   e.printStackTrace(); 
		   logger.error("LOG4J ERROR :"+e.toString(),e);
		   
		}
		finally 
		{
		   session.close();
		}
		return userId;
	}

	@Override
	public boolean doUserExists(String emailId) {
		boolean exists=false;
		
		System.out.println("taking session");
		//get connection from session factory............
		Session session = SessionProvider.getSession();
		Transaction tx = null;
		if(session == null){
			System.out.println("session is null");
		}
		else{
			System.out.println("got session");
		}
		
		try 
		{
			System.out.println("begin transaction");
		   tx = session.beginTransaction();
		   // do some work
		   System.out.println("creating query");
		   Query query = session.createQuery("SELECT u.emailId from User as u WHERE u.emailId =:emailId");
		   query.setString("emailId", emailId);
		   query.uniqueResult();
		   System.out.println(query.uniqueResult());
		   
		   System.out.println("query created");
		  
		   tx.commit();
		   
		   if(query.uniqueResult()==null)
		   {
			   
			   exists=false;
			   System.out.println("Emaiil ID not found");
		   }
		   else
		   {
			   exists=true;
			   System.out.println("Your account already exist with us");
		   }
		  
		}
		catch (Exception e) 
		{
			
		   if (tx!=null) tx.rollback();
		   e.printStackTrace(); 
		   logger.error("LOG4J ERROR :"+e.toString(),e);
		   
		}
		finally 
		{
		   session.close();
		}
		return exists;
	}


	@Override
	public boolean addUser(User user) {
		
		boolean done = false;
		System.out.println("taking session");
		//get connection from session factory............
		Session session = SessionProvider.getSession();
		Transaction tx = null;
		System.out.println("got session");
		try 
		{
			System.out.println("begin transaction");
			if(session == null)
			{
					System.out.println("session is null");
			}
		   tx = session.beginTransaction();
		// 1) create a java calendar instance
		   Calendar calendar = Calendar.getInstance();
		   
		   // 2) get a java.util.Date from the calendar instance.
		   //    this date will represent the current instant, or "now".
		   java.util.Date now = calendar.getTime();
		   // 3) a java current time (now) instance
		   java.sql.Timestamp currentTimestamp = new java.sql.Timestamp(now.getTime());
		   user.setDOReg(currentTimestamp.toString());
		   session.save(user);
		   System.out.println("begin transaction");
		   tx.commit();
		   System.out.println("begin transaction");
		   done = true;
		}
		catch (Exception e) 
		{
			
		   if (tx!=null) {
			   tx.rollback();
			   done = false;
		   }
		   
		   
		   e.printStackTrace(); 
		   logger.error("LOG4J ERROR :"+e.toString(),e);
		   
		}
		finally 
		{
		   session.close();
		}
		return done;
	}

	@Override
	public boolean ValidateCredentials(User user) {
		
		boolean credentialsValidated = false;
		System.out.println("taking session");
		//get connection from session factory............
		Session session = SessionProvider.getSession();
		Transaction tx = null;
		System.out.println("got session");
		try 
		{
			System.out.println("begin transaction");
		   tx = session.beginTransaction();
		   // do some work
		   System.out.println("creating query");
		   Query query = session.createQuery("SELECT u.emailId from User as u WHERE u.emailId =:emailId and u.password=:password");
		   query.setString("emailId", user.getEmailId());
		   query.setString("password", user.getPassword());
		   query.uniqueResult();
		   System.out.println(query.uniqueResult());
		   
		   System.out.println("query created");
		  
		   tx.commit();
		   
		   if(query.uniqueResult()==null)
		   {
			   
			   credentialsValidated = false;
			   System.out.println("Password not Matched");
			   
		   }
		   else
		   {
			   credentialsValidated = true;
			   System.out.println("Password Matched");
		   }
		  
		}
		catch (Exception e) 
		{
			
		   if (tx!=null) tx.rollback();
		   e.printStackTrace(); 
		   logger.error("LOG4J ERROR :"+e.toString(),e);
		   
		}
		finally 
		{
		   session.close();
		}
		
		
		
		
		// TODO Auto-generated method stub
		return credentialsValidated;
	}

}
