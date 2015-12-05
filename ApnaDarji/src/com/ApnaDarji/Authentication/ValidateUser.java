package com.ApnaDarji.Authentication;

import com.ApnaDarji.Model.Password;
import com.ApnaDarji.Model.User;

public class ValidateUser {

	public static String SignUpFormValidation(User user, String conPass) {

		if (user.getFirstName() == null || ("").equals(user.getFirstName())) {
			return "Please check your First Name";
		} else {
			if (user.getLastName() == null || ("").equals(user.getLastName())) {
				return "Please check your Last Name";
			} else {
				if (!user.getEmailId().contains("@")) {
					return "Invalid Email Id";
				} else {
					if (!user.getPassword().equals(conPass)) {
						return "Password Mismatch";
					} else {
						if (user.getPrimaryContactNO() != null
								&& user.getPrimaryContactNO().length() != 10) {
							return "Mobile Number is not Correct";
						}
					}
				}

			}

		}

		return "success";
	}

	public static String Validate(User user) {
		// TODO Auto-generated method stub
		return "success";
	}

	public static String PersonalInfoValidation(User user) {
		// TODO Auto-generated method stub
		return "success";
	}

	public static String LoginFormValidation(User user) {
		// TODO Auto-generated method stub
		return "success";
	}

	public static String ForgotPassConfirmation(String emailId) {
		// TODO Auto-generated method stub
		return "success";
	}

	public static boolean ValidatePasswordFormat(Password pass) {

		boolean validatedPasswordFormat = true;
		if (pass.getPasswordNEW() != null && !pass.getPasswordNEW().equals("")
				&& pass.getPasswordNEW().equals(pass.getPasswordCNF())) 
		{
			validatedPasswordFormat = true;
		}
		else
		{
			validatedPasswordFormat = false;
		}
		return validatedPasswordFormat;
	}

}
