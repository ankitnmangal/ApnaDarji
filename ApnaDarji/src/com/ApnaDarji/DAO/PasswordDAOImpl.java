/**
 * 
 */
package com.ApnaDarji.DAO;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.ApnaDarji.Hibernate.SessionProvider;
import com.ApnaDarji.Model.Password;

/**
 * @author shekhawd
 *
 */
public class PasswordDAOImpl implements PasswordDAO {

	public boolean changePassword(Password password, long userId) {

		boolean passwordUpdated = false;

		System.out.println("taking session");
		// get connection from session factory............
		Session session = SessionProvider.getSession();
		Transaction tx = null;
		System.out.println("got session");
		try {
			System.out.println("begin transaction");
			tx = session.beginTransaction();
			// do some work
			System.out.println("creating query");
			Query query = session
					.createQuery("update User as u set u.password=:password WHERE u.userId =:UserId and u.password=:passwordold");
			query.setString("passwordold", password.getPasswordOLD());

			query.setLong("UserId", userId);

			query.setString("password", password.getPasswordCNF());
			int rs = query.executeUpdate();
			

			System.out.println("query created");

			tx.commit();

			if (rs > 0) {

				passwordUpdated = true;
				System.out.println("your Password updated Sucessfully");

			} else {
				passwordUpdated = false;
				System.out.println("Password Not updated");

			}

		} catch (Exception e) {

			if (tx != null)
				tx.rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

		return passwordUpdated;
		// TODO Auto-generated method stub

	}
	
	@Override
	public String getUserPassByEmailId(String emailId) {
		String pass = null;

		System.out.println("taking session");
		// get connection from session factory............
		Session session = SessionProvider.getSession();
		Transaction tx = null;
		System.out.println("got session");
		try {
			System.out.println("begin transaction");
			tx = session.beginTransaction();
			// do some work
			System.out.println("creating query");
			Query query = session.createQuery("select u.password from User WHERE u.emailId =: emailId");
			query.setString("emailId", emailId);
			pass = (String) query.uniqueResult();
			   System.out.println(query.uniqueResult());
			   
			   System.out.println("query created");
			  
			   tx.commit();
			   
			   if(query.uniqueResult()==null)
			   {
				   
				   pass = null;
				   System.out.println("Password not Found");
				   
			   }
			   else
			   {
				   System.out.println("Password Found!!");
			   }
			  

		} catch (Exception e) {

			if (tx != null)
				tx.rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

		return pass;
		// TODO Auto-generated method stub
	}


}
