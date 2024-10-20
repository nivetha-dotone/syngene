package com.dot1.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dot1.dao.ProjectDao;
import com.dot1.dto.ProjectTaskRequest;
import com.dot1.pojo.Project;
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

	
}
