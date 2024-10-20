package com.dot1.service;

import java.util.List;

import com.dot1.pojo.Resource;
import com.dot1.pojo.ResourceBooking;

public interface SoftBookingService {

	public List<ResourceBooking> getAllResourceByDept(String department);

	public String saveResourcesForTask(Resource resource);

	public List<ResourceBooking> getBookedResourcesByTaskId(String taskId);
}
