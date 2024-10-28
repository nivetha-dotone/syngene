package com.dot1.dao;

import java.util.List;

import com.dot1.dto.ProjectTaskRequest;
import com.dot1.pojo.Project;
import com.dot1.pojo.Resource;
import com.dot1.pojo.ResourceBooking;

public interface ProjectDao {

	public String saveProjectTasksAndMachinery(ProjectTaskRequest request);

	public Project getProjectDetailsByCode(String projectCode);

	public List<Project> getAllProjects();

	public List<Resource> getAllResourcesByDept(String department);

	public List<ResourceBooking> getResourceDetails(String department, String skill);
}
