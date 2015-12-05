/**
 * 
 */
package com.ApnaDarji.DAO;

import java.util.List;

import com.ApnaDarji.Model.UserShirtMeasurement;

/**
 * @author shekhawd
 *
 */
public interface UserShirtMeasurementDAO {

	
	public List<UserShirtMeasurement> getUserShirtMeasurement(long userId);
	public void addUserShirtMeasurement(UserShirtMeasurement userShirtMeasurement, long userId);
	public boolean updateUserShirtMeasurement(UserShirtMeasurement userShirtMeasurement,long userId,long shirtMeasurementId);
	public boolean deleteUserShirtMeasurement(long userId, long shirtMeasurementId);
}
