/**
 * 
 */
package com.ApnaDarji.DAO;

import java.util.ArrayList;
import java.util.List;

import com.ApnaDarji.Model.UserShirtMeasurement;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.ApnaDarji.Hibernate.SessionProvider;

/**
 * @author shekhawd
 *
 */
public class UserShirtMeasurementDAOImpl implements UserShirtMeasurementDAO {

	@Override
	public List<UserShirtMeasurement> getUserShirtMeasurement(long userId) {
		// TODO Auto-generated method stub

		List<UserShirtMeasurement> userShirtMeasurementList = new ArrayList<UserShirtMeasurement>();

		System.out.println("taking session");
		// get connection from session factory............
		Session session = SessionProvider.getSession();
		Transaction tx = null;
		if (session == null) {
			System.out.println("session is null");
		} else {
			System.out.println("got session");
		}

		try {
			System.out.println("begin transaction");
			tx = session.beginTransaction();
			// do some work
			System.out.println("creating query");
			Query query = session.createQuery("from UserShirtMeasurement as a where a.userId=:userId");
			query.setLong("userId", userId);

			userShirtMeasurementList = query.list();

			if (userShirtMeasurementList == null) {

				System.out.println("NO measurement Available");

			}
			System.out.println(userShirtMeasurementList.size());
//			for (int i = 0; i < userShirtMeasurementList.size(); i++) {
//				UserShirtMeasurement addr = new UserShirtMeasurement();
//				addr = userShirtMeasurementList.get(i);
//				System.out.println(addr.getCollar());
//			}

			System.out.println("query created");

			tx.commit();

		} catch (Exception e) {

			if (tx != null)
				tx.rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

		return userShirtMeasurementList;
	}

	@Override
	public void addUserShirtMeasurement(
			UserShirtMeasurement userShirtMeasurement, long userId) {
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

			userShirtMeasurement.setUserId(userId);// Setting value of userId
													// into the
			// address object

			// Setting Some Dummy Value

			userShirtMeasurement.setCollar(20.00);
			userShirtMeasurement.setElbow(456.00);

			session.save(userShirtMeasurement);

			System.out.println("begin transaction");
			tx.commit();

			System.out.println("userShirtMeasurement Added Susccefully");

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

	@Override
	public boolean updateUserShirtMeasurement(UserShirtMeasurement userShirtMeasurement, long userId,long shirtMeasurementId) 
	{
		// TODO Auto-generated method stub
		boolean userShirtMeasurementUpdated = true;
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
					.createQuery("update UserShirtMeasurement as a set a.collar=:collar,a.halfChest=:halfChest,a.halfWaist=:halfWaist,a.halfHips=:halfHips,a.sleeveLength=:sleeveLength,a.elbow=:elbow,a.foreArm=:foreArm,a.halfBicep=:halfBicep,a.cuff=:cuff,a.yoke=:yoke,a.shirtLength=:shirtLength,a.halfArmhole=:halfArmhole,a.shortSleeveLength=:shortSleeveLength,a.shortSleeveOpening=:shortSleeveOpening,isPrimaryShirtMeasurement=:isPrimaryShirtMeasurement WHERE a.shirtMeasurementId =:shirtMeasurementId");

			query.setLong("shirtMeasurementId", shirtMeasurementId);
			query.setDouble("collar",userShirtMeasurement.getCollar());
			query.setDouble("halfChest",userShirtMeasurement.getHalfChest());
			query.setDouble("halfWaist",userShirtMeasurement.getHalfWaist());
			query.setDouble("halfHips",userShirtMeasurement.getHalfHips());
			query.setDouble("sleeveLength",userShirtMeasurement.getSleeveLength());
			query.setDouble("elbow",userShirtMeasurement.getElbow());
			query.setDouble("foreArm",userShirtMeasurement.getForeArm());
			query.setDouble("halfBicep",userShirtMeasurement.getHalfBicep());
			query.setDouble("cuff",userShirtMeasurement.getCuff());
			query.setDouble("yoke",userShirtMeasurement.getYoke());
			query.setDouble("shirtLength",userShirtMeasurement.getShirtLength());
			query.setDouble("halfArmhole",userShirtMeasurement.getHalfArmhole());
			query.setDouble("shortSleeveLength",userShirtMeasurement.getShortSleeveLength());
			query.setDouble("shortSleeveOpening",userShirtMeasurement.getShortSleeveOpening());
			query.setCharacter("isPrimaryShirtMeasurement",	userShirtMeasurement.getIsPrimaryShirtMeasurement());

			int rs = query.executeUpdate();

			System.out.println("query created");

			tx.commit();

			if (rs > 0) {

				userShirtMeasurementUpdated = true;
				System.out.println("your ShirtMeasurement updated Sucessfully");

			} else {
				userShirtMeasurementUpdated = false;
				System.out.println("Your ShirtMeasurement Not updated");

			}

		} catch (Exception e) {

			if (tx != null)
				tx.rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return userShirtMeasurementUpdated;

	}

	@Override
	public boolean deleteUserShirtMeasurement(long userId,
			long shirtMeasurementId) {
		// TODO Auto-generated method stub

		boolean userShirtMeasurementdeleted = false;
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
					.createQuery("delete from UserShirtMeasurement as a  WHERE a.shirtMeasurementId =:shirtMeasurementId and userId=:userId");

			query.setLong("userId", userId);
			query.setLong("shirtMeasurementId", shirtMeasurementId);
			int rs = query.executeUpdate();
			System.out.println("query created");
			tx.commit();
			if (rs > 0) {
				userShirtMeasurementdeleted = true;
				System.out
						.println("your UserShirtMeasurement removed Sucessfully");
			} else {
				userShirtMeasurementdeleted = false;
				System.out
						.println("UserShirtMeasurement Not  Deleted succesfully");
			}

		} catch (Exception e) {

			if (tx != null)
				tx.rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

		return userShirtMeasurementdeleted;

	}
}
