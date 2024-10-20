package com.dot1.service;

import com.dot1.pojo.MasterUser;

public interface MasterUserService {

	public MasterUser findMasterUserDetailsByUserName(String username,String password);
}
