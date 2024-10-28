package com.dot1.queries;

public interface ProjectQueryBank {

	String GET_PROJECT_BY_CODE="SELECT ProjectId,ProjectCode,ProjectName,ProjectManager,OperatingUnit,Department,StartDate,EndDate,LastUpdatedBy "
			+ "  FROM dbo.PROJECTMASTER where ProjectCode=?";
	
	String SAVE_PROJECT_TASKS = "INSERT INTO dbo.PROJECTTASKS "
			+ "           (ProjectId,TaskName,Skill,NoOfResources,NoOfManDays,StartDate,EndDate,LastUpdatedBy,LastUpdatedDate) "
			+ "     VALUES "
			+ "           (?,?,?,?,?,?,?,?,GETDATE())";
	
	String SAVE_PROJECT_MACHINERY = "INSERT INTO dbo.PROJECTMACHINERY (ProjectId,MachineName,NoOfHours,LastUpdatedBy,LastUpdatedDate) VALUES (?,?,?,?,GETDATE())";

	String GET_ALL_TASKS_BY_PROJECT_CODE = "SELECT ProjectId,TaskId,TaskName,Skill,NoOfResources,NoOfManDays,StartDate,EndDate from dbo.PROJECTTASKS where ProjectId=? ";
	
	String GET_ALL_MACHINERY_BY_PROJECT_CODE = "SELECT ProjectId,MachineName,NoOfHours  from dbo.PROJECTMACHINERY where  ProjectId=?";

	String GET_ALL_PROJECTS = "SELECT ProjectId,ProjectCode,ProjectName,ProjectManager,Division,OperatingUnit,Department,StartDate,EndDate "
			+ " FROM dbo.PROJECTMASTER";

	String GET_ALL_RESOURCE_BY_DEPT = "SELECT Department,  Skill, COUNT(*) AS NumberOfResources "
			+ "FROM Resource where Department=? GROUP BY Department, Skill ORDER BY Department, Skill ;";

	String GET_ALL_RESOURCE_BY_DEPT_AND_SKILL = "select ResourceNumber,ResourceName,Department,Skill from RESOURCE where Department=? and skill=?";
}
