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
import com.ApnaDarji.Model.UserTrouserMeasurement;

/**
 * @author shekhawd
 *
 */
public class UserTrouserMeasurementDAOImpl implements UserTrouserMeasurementDAO {

	@Override
	public List<UserTrouserMeasurement> getUserTrouserMeasurement(long userId) {
		// TODO Auto-generated method stub


		List<UserTrouserMeasurement> userTrouserMeasurementList = new ArrayList<UserTrouserMeasurement>();

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
			Query query = session
					.createQuery("from UserTrouserMeasurement as a where a.userId=:userId");
			query.setLong("userId", userId);

			userTrouserMeasurementList = query.list();

			if (userTrouserMeasurementList == null) {

				System.out.println("NO trouser measurement Available");

			}
			System.out.println(userTrouserMeasurementList.size());
//			for (int i = 0; i < userTrouserMeasurementList.size(); i++) {
//				UserTrouserMeasurement addr = new UserTrouserMeasurement();
//				addr = userTrouserMeasurementList.get(i);
//				System.out.println(addr.getKnee());
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

		return userTrouserMeasurementList;
	}

	@Override
	public void addUserTrouserMeasurement(
			UserTrouserMeasurement userTrouserMeasurement, long userId) {

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

			userTrouserMeasurement.setuserId(userId);// Setting value of userId
														// into the
			// address object

			// Setting Some Dummy Value

			userTrouserMeasurement.setCrotch(15.6);

			session.save(userTrouserMeasurement);

			System.out.println("begin transaction");
			tx.commit();

			System.out.println("userTrouserMeasurement Added Susccefully");

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
	public boolean updateUserTrouserMeasurement(
			UserTrouserMeasurement userTrouserMeasurement, long userId,
			long trouserMeasurementId) {
		// TODO Auto-generated method stub

		boolean userTrouserMeasurementUpdated = true;
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
					.createQuery("update UserTrouserMeasurement as a set a.waist=:waist,a.hips=:hips,a.crotch=:crotch,a.thighWidth=:thighWidth,a.pantsLength=:pantsLength,a.inseam=:inseam,a.knee=:knee,a.halfHem=:halfHem,a.isPrimaryTrouserMeasurement=:isPrimaryTrouserMeasurement WHERE a.trouserMeasurementId =:trouserMeasurementId");

			query.setLong("trouserMeasurementId", trouserMeasurementId);
			
			
//			query.setDouble("waist", 14.00);
//			query.setDouble("hips", 15.999);
//			query.setDouble("crotch", 345.0);
//			query.setDouble("thighWidth",
//					3543.0);
//			query.setDouble("pantsLength",
//					0.9);
//			query.setDouble("inseam", 89.0);
//			query.setDouble("knee", 9);
//			query.setDouble("halfHem", 98);
//
//			query.setCharacter("isPrimaryTrouserMeasurement",
//					'Y');
			
			
//Original
			
			query.setDouble("waist", userTrouserMeasurement.getWaist());
			query.setDouble("hips", userTrouserMeasurement.getHips());
			query.setDouble("crotch", userTrouserMeasurement.getCrotch());
			query.setDouble("thighWidth",
					userTrouserMeasurement.getThighWidth());
			query.setDouble("pantsLength",
					userTrouserMeasurement.getPantsLength());
			query.setDouble("inseam", userTrouserMeasurement.getInseam());
			query.setDouble("knee", userTrouserMeasurement.getKnee());
			query.setDouble("halfHem", userTrouserMeasurement.getHalfHem());

			query.setCharacter("isPrimaryTrouserMeasurement",
					userTrouserMeasurement.getIsPrimaryTrouserMeasurement());

			int rs = query.executeUpdate();

			System.out.println("query created");

			tx.commit();

			if (rs > 0) {

				userTrouserMeasurementUpdated = true;
				System.out.println("your TrouserMeasurement updated Sucessfully");

			} else {
				userTrouserMeasurementUpdated = false;
				System.out.println("Your TrouserMeasurement Not updated");

			}

		} catch (Exception e) {

			if (tx != null)
				tx.rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
		return userTrouserMeasurementUpdated;

	}

	@Override
	public boolean deleteUserTrouserMeasurement(long userId,
			long trouserMeasurementId) {
		// TODO Auto-generated method stub

		boolean userTrouserMeasurementdeleted = false;
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
					.createQuery("delete from UserTrouserMeasurement as a  WHERE a.trouserMeasurementId =:trouserMeasurementId and userId=:userId");

			query.setLong("userId", userId);
			query.setLong("trouserMeasurementId", trouserMeasurementId);
			int rs = query.executeUpdate();
			System.out.println("query created");
			tx.commit();
			if (rs > 0) {
				userTrouserMeasurementdeleted = true;
				System.out
						.println("your UserTrouserMeasurement removed Sucessfully");
			} else {
				userTrouserMeasurementdeleted = false;
				System.out
						.println("UserTrouserMeasurement Not Deleted succesfully");
			}

		} catch (Exception e) {

			if (tx != null)
				tx.rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}

		return userTrouserMeasurementdeleted;
	}

}
