/**
 * 
 */
package com.ApnaDarji.DAO;

import java.util.List;

import com.ApnaDarji.Model.UserTrouserMeasurement;



/**
 * @author shekhawd
 *
 */
public interface UserTrouserMeasurementDAO {

	
	public List<UserTrouserMeasurement> getUserTrouserMeasurement(long userId);
	public void addUserTrouserMeasurement(UserTrouserMeasurement userTrouserMeasurement, long userId);
	public boolean updateUserTrouserMeasurement(UserTrouserMeasurement userTrouserMeasurement,long userId,long trouserMeasurementId);
	public boolean deleteUserTrouserMeasurement(long userId, long trouserMeasurementId);
	
	
}
