package com.dot1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dot1.dao.SoftBookingDao;
import com.dot1.pojo.Resource;
import com.dot1.pojo.ResourceBooking;
@Service
public class SoftBookingServiceImpl implements SoftBookingService{

	@Autowired
	SoftBookingDao dao;
	@Override
	public List<ResourceBooking> getAllResourceByDept(String department) {
		
		return dao.getAllResourceByDept(department);
	}
	@Override
	public String saveResourcesForTask(Resource resource) {
		// TODO Auto-generated method stub
		return dao.saveResourcesForTask(resource);
	}
	@Override
	public List<ResourceBooking> getBookedResourcesByTaskId(String taskId) {
		// TODO Auto-generated method stub
		return dao.getBookedResourcesByTaskId(taskId);
	}

}
