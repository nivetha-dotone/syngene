package com.dot1.dao;

import com.dot1.dto.ProjectTaskRequest;
import com.dot1.pojo.Project;

public interface ProjectDao {

	public String saveProjectTasksAndMachinery(ProjectTaskRequest request);

	public Project getProjectDetailsByCode(String projectCode);
}
