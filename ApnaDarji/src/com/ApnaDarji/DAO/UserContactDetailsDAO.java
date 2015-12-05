/**
 * 
 */
package com.ApnaDarji.DAO;

import com.ApnaDarji.Model.UserContactDetails;


/**
 * @author DASHARATH1992
 *
 */
public interface UserContactDetailsDAO {

	public UserContactDetails getUserContactDetails(int userId);
	public void addUserContactDetails(UserContactDetails userContactDetail, int userId);
	public void updateUserContactDetails(UserContactDetails userContactDetails,int userId,int CON_DTLID);
	public void deleteUserContactDetails(int userId, int CON_DTLID);
	
}
