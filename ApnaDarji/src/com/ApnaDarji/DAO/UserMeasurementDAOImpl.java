package com.ApnaDarji.DAO;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.ApnaDarji.Hibernate.SessionProvider;
import com.ApnaDarji.Model.UserMeasurement;

public class UserMeasurementDAOImpl implements UserMeasurementDAO {

	@Override
	public UserMeasurement getMeasurement(int userId) {
		
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addMeasurement(UserMeasurement userMeasurement, int userId) {
		// TODO Auto-generated method stub
		userMeasurement.setShirtChest(34.23f);
		userMeasurement.setShirtLength(35.343f);
		userMeasurement.setShirtNeckMeasurement(23.3432f);
		userMeasurement.setUserID(userId);
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
		   session.save(userMeasurement);
		   System.out.println("begin transaction");
		   tx.commit();
		   System.out.println("END transaction");
		}
		catch (Exception e) 
		{
			
		   if (tx!=null) {
			   tx.rollback();
		   }
		   
		   
		   e.printStackTrace(); 
		   
		}
		finally 
		{
		   session.close();
		}
	}
	
	
	
	
	@Override
	public void updateMeasurement(UserMeasurement userMeasurement, int userId) {
			// TODO Auto-generated method stub
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
			   Query query = session.createQuery("update USERCONTACTDETAILS set TROUSERLENGTH = :TROUSERLENGTH" +
	    				" where M_ID = :M_ID");
			   query.setParameter("M_ID", userMeasurement.getM_ID());
			   query.setParameter("TROUSERLENGTH", userMeasurement.getTrouserLength());
			   
			   System.out.println("query created");
			   int res=query.executeUpdate(); 
			   System.out.println("Updated the USERMEASUREMENT of your account=== "+ userId +"Account Affected="+res);
			   tx.commit();
			}
			catch (Exception e) 
			{
				
			   if (tx!=null) tx.rollback();
			   e.printStackTrace(); 
			   
			}
			finally 
			{
			   session.close();
			}
	}
	
	// delete UserMeasurement

	public UserMeasurement deleteMeasurement(int userId,int M_ID) {
		// TODO Auto-generated method stub
		
		
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
		   Query query = session.createQuery("delete FROM USERMEASUREMENT  as um WHERE um.M_ID="  +M_ID);
		   query.setParameter("M_ID", M_ID);
		   System.out.println("query created");
		   int res=query.executeUpdate(); 
		   System.out.println("Deleted the USERMEASUREMENT of your account=== "+ userId +"Account Affected="+res);
		   tx.commit();
		}
		catch (Exception e) 
		{
			
		   if (tx!=null) tx.rollback();
		   e.printStackTrace(); 
		   
		}
		finally 
		{
		   session.close();
		}
		return null;
	}
	
		
	

}
