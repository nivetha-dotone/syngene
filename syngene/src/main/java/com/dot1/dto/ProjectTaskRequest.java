package com.dot1.dto;

import java.util.List;

public class ProjectTaskRequest {
	private String projectCode;
	 public String getProjectCode() {
		return projectCode;
	}
	public void setProjectCode(String projectCode) {
		this.projectCode = projectCode;
	}
	private List<TaskDTO> tasks;
     private List<MachineryDTO> machinery;
	public List<TaskDTO> getTasks() {
		return tasks;
	}
	public void setTasks(List<TaskDTO> tasks) {
		this.tasks = tasks;
	}
	public List<MachineryDTO> getMachinery() {
		return machinery;
	}
	public void setMachinery(List<MachineryDTO> machinery) {
		this.machinery = machinery;
	}
}
