package com.dot1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dot1.dao.ProjectDao;
import com.dot1.dto.ProjectTaskRequest;
import com.dot1.pojo.Project;
import com.dot1.pojo.Resource;
import com.dot1.pojo.ResourceBooking;
@Service
public class ProjectServiceImpl implements ProjectService{

	@Autowired
	ProjectDao projectDao;
	
	@Override
	public String saveProjectTasksAndMachinery(ProjectTaskRequest request) {
		return projectDao.saveProjectTasksAndMachinery(request);
	}

	@Override
	public Project getProjectDetailsByCode(String projectCode) {
		return projectDao.getProjectDetailsByCode(projectCode);
	}

	@Override
	public List<Project> getAllProjects() {
		// TODO Auto-generated method stub
		return projectDao.getAllProjects();
	}

	@Override
	public List<Resource> getAllResourcesByDept(String department) {
		// TODO Auto-generated method stub
		return projectDao.getAllResourcesByDept(department);
	}

	@Override
	public List<ResourceBooking> getResourceDetails(String department, String skill) {
		// TODO Auto-generated method stub
		return projectDao.getResourceDetails(department,skill);
	}

	
}
