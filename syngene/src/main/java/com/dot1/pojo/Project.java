package com.dot1.pojo;

import java.util.List;

import com.dot1.dto.MachineryDTO;
import com.dot1.dto.TaskDTO;

public class Project {
	private int projectId;
	private String projectCode;
	private String projectName;
	private String projectManager;
	private String operatingUnit;
	private String department;
	private String startDate;
	private String endDate;
	public String getProjectCode() {
		return projectCode;
	}
	public void setProjectCode(String projectCode) {
		this.projectCode = projectCode;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getProjectManager() {
		return projectManager;
	}
	public void setProjectManager(String projectManager) {
		this.projectManager = projectManager;
	}
	public String getOperatingUnit() {
		return operatingUnit;
	}
	public void setOperatingUnit(String operatingUnit) {
		this.operatingUnit = operatingUnit;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public Project(String projectCode, String projectName, String projectManager, String operatingUnit,
			String department, String startDate, String endDate) {
		super();
		this.projectCode = projectCode;
		this.projectName = projectName;
		this.projectManager = projectManager;
		this.operatingUnit = operatingUnit;
		this.department = department;
		this.startDate = startDate;
		this.endDate = endDate;
	}
	public int getProjectId() {
		return projectId;
	}
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	public Project(int projectId, String projectCode, String projectName, String projectManager, String operatingUnit,
			String department, String startDate, String endDate) {
		super();
		this.projectId = projectId;
		this.projectCode = projectCode;
		this.projectName = projectName;
		this.projectManager = projectManager;
		this.operatingUnit = operatingUnit;
		this.department = department;
		this.startDate = startDate;
		this.endDate = endDate;
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
