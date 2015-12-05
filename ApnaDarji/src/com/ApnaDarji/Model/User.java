package com.ApnaDarji.Model;

import java.util.Date;
import java.util.List;

public class User {
	
	private long userId;
	private String firstName;
	private String lastName;
	private String emailId;
	private String password;
	private String PrimaryContactNO;
	private String DOReg;
	private List<Address> addrList;
	private List<UserShirtMeasurement> shirtMeasureList;
	private List<UserTrouserMeasurement> trouserMeasureList;
	public long getUserId() {
		return userId;
	}
	public String getFirstName() {
		return firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public String getEmailId() {
		return emailId;
	}
	public String getPassword() {
		return password;
	}
	public String getPrimaryContactNO() {
		return PrimaryContactNO;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setPrimaryContactNO(String primaryContactNO) {
		PrimaryContactNO = primaryContactNO;
	}

	public List<Address> getAddrList() {
		return addrList;
	}
	public void setAddrList(List<Address> addrList) {
		this.addrList = addrList;
	}
	public List<UserShirtMeasurement> getShirtMeasureList() {
		return shirtMeasureList;
	}
	public void setShirtMeasureList(List<UserShirtMeasurement> shirtMeasureList) {
		this.shirtMeasureList = shirtMeasureList;
	}
	public List<UserTrouserMeasurement> getTrouserMeasureList() {
		return trouserMeasureList;
	}
	public void setTrouserMeasureList(
			List<UserTrouserMeasurement> trouserMeasureList) {
		this.trouserMeasureList = trouserMeasureList;
	}
	public String getDOReg() {
		return DOReg;
	}
	public void setDOReg(String dOReg) {
		DOReg = dOReg;
	}
	


}
