package com.dot1.queries;

public interface MasterUserQueryBank {

	String GET_MASTERUSER_BY_USERNAME_AND_PASSWROD ="select mu.UserId,mu.EmailId,mu.FirstName,mu.LastName,mu.UserName,mu.RoleName,mu.ContactNumber,mu.Status "
			+ "	 from MasterUser mu where mu.UserName=? and mu.Password=?";
	

}
