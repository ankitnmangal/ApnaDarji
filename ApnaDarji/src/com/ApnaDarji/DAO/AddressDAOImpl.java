/**
 * 
 */
package com.ApnaDarji.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.ApnaDarji.Hibernate.SessionProvider;
import com.ApnaDarji.Model.Address;
import com.ApnaDarji.Model.Product;

/**
 * @author shekhawd
 *
 */
public class AddressDAOImpl implements AddressDAO {

	@Override
	public List<Address> getAllAddresses(long userId) {

		// TODO Auto-generated method stub
		
		List<Address> addressList= new ArrayList<Address>();
		
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
		   Query query = session.createQuery("from Address as a where a.userId=:userId");
		   query.setLong("userId", userId);
		   addressList = query.list();
		   
		   
		   System.out.println("query created");
		  
		   tx.commit();
		   
		   if(addressList==null)
		   {
			   
			   System.out.println("NO Address Available");
		   }
		  
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
	
		return addressList;
		
		
	}

		

	@Override
	public boolean updateAddress(Address address, long userId) {
		// TODO Auto-generated method stub
		boolean addressUpdated = true;
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
			Query query = session.createQuery("update Address as a set a.userName=:userName,a.houseNum=:houseNum,a.addressLine1=:addressLine1,a.addressLine2=:addressLine2,a.city=:city,a.state=:state,a.country=:country,a.postalCode=:postalCode,a.Landmark=:Landmark,a.addressType=:addressType,a.isPrimaryAddress=:isPrimaryAddress,a.alternateContactNumber=:alternateContactNumber WHERE a.addrId =:addrId");

			query.setLong("addrId", address.getAddrId());

			query.setString("userName", address.getUserName());
			query.setString("houseNum", address.getHouseNum());
			query.setString("addressLine1", address.getAddressLine1());
			query.setString("addressLine2", address.getAddressLine2());
			query.setString("city", address.getCity());
			query.setString("state", address.getState());
			query.setString("country", "INDIA");
			query.setString("postalCode", address.getPostalCode());
			query.setString("Landmark", address.getLandmark());
			query.setCharacter("isPrimaryAddress",address.getIsPrimaryAddress());
			query.setString("addressType", "HOME");
			query.setString("alternateContactNumber", address.getAlternateContactNumber());

			System.out.println("contact: "+address.getAlternateContactNumber());
			int rs = query.executeUpdate();

			System.out.println("query created");

			tx.commit();

			if (rs > 0) {

				addressUpdated = true;
				System.out.println("your Address updated Sucessfully");

			} else {
				addressUpdated = false;
				System.out.println("Address Not updated");

			}

		} catch (Exception e) {

			if (tx != null)
				tx.rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return addressUpdated;

	}

	@Override
	public boolean deleteAddress(long userId, long addrId) {

		boolean addressdeleted = false;
		System.out.println("taking session");
		// get connection from session factory............
		Session session = SessionProvider.getSession();
		if(session == null)System.out.println("null");
		Transaction tx = null;
		System.out.println("got session");
		try {
			System.out.println("begin transaction");
			tx = session.beginTransaction();
			// do some work
			System.out.println("creating query");
			Query query = session.createQuery("DELETE FROM Address WHERE userId =:userId AND addrId =:addrId" );

			query.setLong("userId", userId);
			query.setLong("addrId", addrId);
			int rs = query.executeUpdate();
			System.out.println("query created");
			tx.commit();
			if (rs > 0) {
				addressdeleted = true;
				System.out.println("your Address removed Sucessfully");
			} else {
				addressdeleted = false;
				System.out.println("Address Deleted succesfully");
			}

		} catch (Exception e) {

			if (tx != null)
				tx.rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

		return addressdeleted;
		// TODO Auto-generated method stub

	}

	

	@Override
	public void addAddress(Address address, long userId) {
		// TODO Auto-generated method stub
		
		
		// take details from the form

				System.out.println("taking session");
				// get connection from session factory............
				Session session = SessionProvider.getSession();
				Transaction tx = null;
				System.out.println("got session");
				try {
					System.out.println("begin transaction");
					if (session == null) {
						System.out.println("session is null");
					}
					tx = session.beginTransaction();
					address.setUserId(userId);// Setting value of userId into the
												// address object

					session.save(address);
					System.out.println("begin transaction");
					tx.commit();
					System.out.println("END transaction");
				} catch (Exception e) {

					if (tx != null) {
						tx.rollback();
					}

					e.printStackTrace();

				} finally {
					session.close();
				}

			}
}
