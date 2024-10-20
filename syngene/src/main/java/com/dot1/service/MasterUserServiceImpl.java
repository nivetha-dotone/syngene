package com.dot1.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dot1.dao.MasterUserDao;
import com.dot1.pojo.MasterUser;
@Service
public class MasterUserServiceImpl implements MasterUserService{

	private static final Logger log = LoggerFactory.getLogger(MasterUserServiceImpl.class.getName());
	
	@Autowired
	MasterUserDao masterUserDao;
	
	@Override
	public MasterUser findMasterUserDetailsByUserName(String username, String password) {
		log.info("Entering into findMasterUserDetailsByUserName service method "+username+" "+password);
		return masterUserDao.findMasterUserDetailsByUserName(username, password);
	}

}
