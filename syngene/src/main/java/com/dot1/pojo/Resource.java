package com.dot1.pojo;

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

}
