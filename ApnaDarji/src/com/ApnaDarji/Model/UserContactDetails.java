/**
 * 
 */
package com.ApnaDarji.Model;


public class UserContactDetails {
	 
	private int Con_DtlId;
	private int userId;
	private int addId;
	private String emailId;
	private char isVerifiedContactNumber;
	private String primaryContactNumber;
	private String alternateContactNumber;
	
	public int getCon_DtlId() {
		return Con_DtlId;
	}
	public void setCon_DtlId(int con_DtlId) {
		Con_DtlId = con_DtlId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getAddId() {
		return addId;
	}
	public void setAddId(int addId) {
		this.addId = addId;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public char isVerifiedContactNumber() {
		return isVerifiedContactNumber;
	}
	public void setVerifiedContactNumber(char isVerifiedContactNumber) {
		this.isVerifiedContactNumber = isVerifiedContactNumber;
	}
	public String getPrimaryContactNumber() {
		return primaryContactNumber;
	}
	public void setPrimaryContactNumber(String primaryContactNumber) {
		this.primaryContactNumber = primaryContactNumber;
	}
	public String getAlternateContactNumber() {
		return alternateContactNumber;
	}
	public void setAlternateContactNumber(String alternateContactNumber) {
		this.alternateContactNumber = alternateContactNumber;
	}

	
}
