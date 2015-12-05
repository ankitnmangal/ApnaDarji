/**
 * 
 */
package com.ApnaDarji.DAO;

import com.ApnaDarji.Model.Password;

/**
 * @author shekhawd
 *
 */
public interface PasswordDAO {

	public boolean changePassword(Password password,long userId);
	public String getUserPassByEmailId(String emailId);

}
