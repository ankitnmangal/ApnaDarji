
package com.ApnaDarji.DAO;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.Query;

import com.ApnaDarji.Hibernate.SessionProvider;
import com.ApnaDarji.Model.UserContactDetails;

/**
 * @author DASHARATH1992
 *
 */
public class UserContactDetailsDAOImpl implements UserContactDetailsDAO {

	@Override
	public UserContactDetails getUserContactDetails(int userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addUserContactDetails(UserContactDetails userContactDetails,
			int userId) {
		// TODO Auto-generated method stub
		
		// take details from the form 
		
				userContactDetails.setUserId(userId);
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
				   session.save(userContactDetails);
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
	public void updateUserContactDetails(UserContactDetails userContactDetails,
			int userId, int CON_DTLID) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteUserContactDetails(int userId,int CON_DTLID) {
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
		   Query query = session.createQuery("delete FROM USERCONTACTDETAILS  as um WHERE um.userID = :userID and um.ISPRIMARYCONTACTDETAIL=true");
		   System.out.println("query created");
		   query.executeUpdate(); 
		   System.out.println("Deleted the USERCONTACTDETAILS of your account=== "+ userId);
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

	

	
	

}
