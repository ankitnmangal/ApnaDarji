package com.ApnaDarji.DAO;

import com.ApnaDarji.Model.Password;
import com.ApnaDarji.Model.User;

public interface UserDAO {

	User getUserDetails(long userId);
	long  getUserIdByEmailId(String emailId, User user);
	boolean doUserExists(String emailId);
	boolean ValidateCredentials(User user);
	boolean addUser(User user);
}
