package com.dot1.dao;

import com.dot1.pojo.MasterUser;

public interface MasterUserDao {

	public MasterUser findMasterUserDetailsByUserName(String username,String password);
}
