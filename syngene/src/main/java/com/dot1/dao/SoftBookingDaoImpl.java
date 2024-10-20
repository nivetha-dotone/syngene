package com.dot1.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Repository;

import com.dot1.pojo.Resource;
import com.dot1.pojo.ResourceBooking;
import com.dot1.queries.SoftBookingQueryBank;
@Repository
public class SoftBookingDaoImpl implements SoftBookingDao{

	 @Autowired
	 private JdbcTemplate jdbcTemplate;
	 
	@Override
	public List<ResourceBooking> getAllResourceByDept(String department) {

		SqlRowSet rs = jdbcTemplate.queryForRowSet(SoftBookingQueryBank.GET_RESOURCES_BYDEPT,department);
		List<ResourceBooking> resourceList = new ArrayList<ResourceBooking>();
		while(rs.next()) {
			ResourceBooking resource =new ResourceBooking();
			resource.setDepartment(rs.getString("Department"));
			resource.setResourceId(String.valueOf(rs.getInt("ResourceId")));
			resource.setResourceName(rs.getString("ResourceName"));
			resourceList.add(resource);
		}
		return resourceList;
	}

	@Override
	public String saveResourcesForTask(Resource resource) {
		String SAVE_RESOURCE_FOR_TASK = SoftBookingQueryBank.SAVE_RESOURCE_FOR_TASK;
		int[] save = jdbcTemplate.batchUpdate(SAVE_RESOURCE_FOR_TASK, new BatchPreparedStatementSetter() {
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				ps.setString(1, resource.getProjectId());
				ps.setString(2,resource.getTaskId());
				ps.setString(3, resource.getResourceBooking().get(i).getResourceId());
				ps.setString(4,resource.getResourceBooking().get(i).getResourceName());
				ps.setString(5,resource.getResourceBooking().get(i).getDepartment());
				ps.setString(6,null);
				ps.setString(7,resource.getResourceBooking().get(i).getStartDate());
				ps.setString(8,resource.getResourceBooking().get(i).getEndDate());
				ps.setString(9, resource.getResourceBooking().get(i).getSlot());
				ps.setString(10, "Admin");
				
			}

			public int getBatchSize() {
				return resource.getResourceBooking().size();
			}
		});
		if(save.length>0) {
			return "success";
		}
		return null;
	}

	@Override
	public List<ResourceBooking> getBookedResourcesByTaskId(String taskId) {
		SqlRowSet rs = jdbcTemplate.queryForRowSet(SoftBookingQueryBank.GET_RESOURCES_BYTASK,taskId);
		List<ResourceBooking> resourceList = new ArrayList<ResourceBooking>();
		while(rs.next()) {
			ResourceBooking resource =new ResourceBooking();
			resource.setDepartment(rs.getString("Department"));
			resource.setResourceId(String.valueOf(rs.getInt("ResourceId")));
			resource.setResourceName(rs.getString("ResourceName"));
			resource.setStartDate(rs.getString("StartDate"));
			resource.setEndDate(rs.getString("EndDate"));
			resource.setSlot(rs.getString("Slot"));
			resourceList.add(resource);
		}
		return resourceList;
	}

}
