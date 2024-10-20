package com.dot1.queries;

public interface SoftBookingQueryBank {

	String GET_RESOURCES_BYDEPT="SELECT ResourceId ,ResourceName,Department,Skill FROM dbo.RESOURCE where Department=?";
	String SAVE_RESOURCE_FOR_TASK = "INSERT INTO dbo.PROJECTTASKRESOURCE "
			+ "           (ProjectId,TaskId,ResourceId,ResourceName,Department,Skill,StartDate,EndDate,Slot,LastUpdatedBy,LastUpdatedDate) "
			+ "     VALUES "
			+ "           (?,?,?,?,?,?,?,?,?,?,GETDATE())";
	String GET_RESOURCES_BYTASK = "SELECT ProjectTaskResourceId,ProjectId,TaskId,ResourceId,ResourceName,Department,Skill,StartDate,EndDate,Slot "
			+ " FROM dbo.PROJECTTASKRESOURCE where TaskId=?";
}
