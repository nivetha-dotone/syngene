package com.dot1.pojo;

import java.util.List;

public class Resource {
	private String department;
	private String skill;
	private int noOfResources;
	
	public Resource(String department, String skill, int noOfResources) {
		super();
		this.department = department;
		this.skill = skill;
		this.noOfResources = noOfResources;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getSkill() {
		return skill;
	}
	public void setSkill(String skill) {
		this.skill = skill;
	}
	public int getNoOfResources() {
		return noOfResources;
	}
	public void setNoOfResources(int noOfResources) {
		this.noOfResources = noOfResources;
	}
	
	private String projectId;
	private String taskId;
	public String getProjectId() {
		return projectId;
	}
	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}
	public String getTaskId() {
		return taskId;
	}
	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}

	private List<ResourceBooking> resourceBooking;

	public List<ResourceBooking> getResourceBooking() {
		return resourceBooking;
	}
	public void setResourceBooking(List<ResourceBooking> resourceBooking) {
		this.resourceBooking = resourceBooking;
	}
	public Resource(String department, String skill, int noOfResources, String projectId, String taskId,
			List<ResourceBooking> resourceBooking) {
		super();
		this.department = department;
		this.skill = skill;
		this.noOfResources = noOfResources;
		this.projectId = projectId;
		this.taskId = taskId;
		this.resourceBooking = resourceBooking;
	}
	public Resource() {
	}

	
}
