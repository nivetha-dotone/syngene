package com.dot1.dto;

public class TaskDTO {
	private int taskId;
	 public int getTaskId() {
		return taskId;
	}
	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}
	private String taskName;
     private String skill;
     private int noOfResources;
     private int noOfManDays;
     private String startDate;
     private String endDate;
	public String getTaskName() {
		return taskName;
	}
	public void setTaskName(String taskName) {
		this.taskName = taskName;
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
	public int getNoOfManDays() {
		return noOfManDays;
	}
	public void setNoOfManDays(int noOfManDays) {
		this.noOfManDays = noOfManDays;
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
}
