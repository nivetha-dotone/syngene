package com.dot1.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Repository;

import com.dot1.dto.MachineryDTO;
import com.dot1.dto.ProjectTaskRequest;
import com.dot1.dto.TaskDTO;
import com.dot1.pojo.Project;
import com.dot1.queries.ProjectQueryBank;
@Repository
public class ProjectDaoImpl implements ProjectDao{

	 @Autowired
	 private JdbcTemplate jdbcTemplate;
	
	@Override
	public String saveProjectTasksAndMachinery(ProjectTaskRequest request) {
		this.deleteProjectTasksAndMachinery(request.getProjectCode());
		String SAVE_PROJECT_TASKS = ProjectQueryBank.SAVE_PROJECT_TASKS;
		int[] save = jdbcTemplate.batchUpdate(SAVE_PROJECT_TASKS, new BatchPreparedStatementSetter() {
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				ps.setString(1, request.getProjectCode());
				ps.setString(2, request.getTasks().get(i).getTaskName());
				ps.setString(3, request.getTasks().get(i).getSkill());
				ps.setString(4,String.valueOf( request.getTasks().get(i).getNoOfResources()));
				ps.setString(5,String.valueOf( request.getTasks().get(i).getNoOfManDays()));
				ps.setString(6, request.getTasks().get(i).getStartDate());
				ps.setString(7, request.getTasks().get(i).getEndDate());
				ps.setString(8, "Admin");
				
			}

			public int getBatchSize() {
				return request.getTasks().size();
			}
		});
		
		String SAVE_PROJECT_MACHINERY = ProjectQueryBank.SAVE_PROJECT_MACHINERY;
		int[] saveMachine = jdbcTemplate.batchUpdate(SAVE_PROJECT_MACHINERY, new BatchPreparedStatementSetter() {
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				ps.setString(1, request.getProjectCode());
				ps.setString(2, request.getMachinery().get(i).getMachineName());
				ps.setString(3, String.valueOf(request.getMachinery().get(i).getNoOfHours()));
				ps.setString(4, "Admin");
				
			}
			public int getBatchSize() {
				return request.getMachinery().size();
			}
		});
			
		if(save.length>0 && saveMachine.length>0) {
			return "success";
		}
			return "failed";
		
	}

	@Override
	public Project getProjectDetailsByCode(String projectCode) {
		Project projectDetails;
		SqlRowSet rs = jdbcTemplate.queryForRowSet(ProjectQueryBank.GET_PROJECT_BY_CODE,projectCode);
		if(rs.next()) {
			projectDetails=new Project(rs.getInt("ProjectId") , rs.getString("ProjectCode") , 
					rs.getString("ProjectName"), rs.getString("ProjectManager") , rs.getString("OperatingUnit") ,
					rs.getString("Department") ,rs.getString("StartDate")  , rs.getString("EndDate") );
			
			SqlRowSet rs1 = jdbcTemplate.queryForRowSet(ProjectQueryBank.GET_ALL_TASKS_BY_PROJECT_CODE,projectCode);
			List<TaskDTO> tasks = new ArrayList<TaskDTO>();
			
			List<MachineryDTO> machineries = new ArrayList<MachineryDTO>();
			while(rs1.next()) {
				TaskDTO task = new TaskDTO();
				task.setTaskId(rs1.getInt("TaskId"));
				task.setTaskName(rs1.getString("TaskName"));
				task.setSkill(rs1.getString("Skill"));
				task.setNoOfResources(Integer.parseInt(rs1.getString("NoOfResources")));
				task.setNoOfResources(Integer.parseInt(rs1.getString("NoOfManDays")));
				task.setStartDate(rs.getString("StartDate"));
				task.setEndDate(rs.getString("EndDate"));
				tasks.add(task);
			}
			SqlRowSet rs2 = jdbcTemplate.queryForRowSet(ProjectQueryBank.GET_ALL_MACHINERY_BY_PROJECT_CODE,projectCode);
			while(rs2.next()) {
				MachineryDTO machine = new MachineryDTO();
				machine.setMachineName(rs2.getString("MachineName"));
				machine.setNoOfHours(Integer.parseInt(rs2.getString("NoOfHours")));
				machineries.add(machine);
			}
			projectDetails.setTasks(tasks);
			projectDetails.setMachinery(machineries);
			return projectDetails;
			
		}
		return null;
	}
	

	public synchronized boolean deleteProjectTasksAndMachinery(String projectCode){
		boolean status = false;

		Object[] object = new Object[]{projectCode};
		String query = " DELETE FROM PROJECTMACHINERY WHERE ProjectId=? " ;
		int i = jdbcTemplate.update(query, object);
		
		String query1 = " DELETE FROM PROJECTTASKS WHERE ProjectId=? " ;
		int j = jdbcTemplate.update(query1, object);
		
		if(i>0 && j>0){
			status = true;
		}
		return status;
	}
	

}
