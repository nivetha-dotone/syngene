package com.dot1.dao;

import java.util.List;

import com.dot1.pojo.Resource;
import com.dot1.pojo.ResourceBooking;

public interface SoftBookingDao {

	List<ResourceBooking> getAllResourceByDept(String department);

	String saveResourcesForTask(Resource resource);

	List<ResourceBooking> getBookedResourcesByTaskId(String taskId);

	
}
