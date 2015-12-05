package com.ApnaDarji.DAO;

import com.ApnaDarji.Model.UserMeasurement;

public interface UserMeasurementDAO {

	public UserMeasurement getMeasurement(int userId);
	public void addMeasurement(UserMeasurement userMeasurement, int userId);
	public void updateMeasurement(UserMeasurement userMeasurement, int userId);
	public UserMeasurement deleteMeasurement(int userId, int M_ID);
}
