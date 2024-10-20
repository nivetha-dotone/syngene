package com.dot1.service;

import com.dot1.dto.ProjectTaskRequest;
import com.dot1.pojo.Project;

public interface ProjectService {

	public String saveProjectTasksAndMachinery(ProjectTaskRequest request);

	public Project getProjectDetailsByCode(String projectCode);
}
