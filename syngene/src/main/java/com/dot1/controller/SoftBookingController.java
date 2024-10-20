package com.dot1.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dot1.pojo.Project;
import com.dot1.pojo.Resource;
import com.dot1.pojo.ResourceBooking;
import com.dot1.service.ProjectService;
import com.dot1.service.SoftBookingService;

@Controller
@RequestMapping("/soft")
public class SoftBookingController {
	
	@Autowired
	ProjectService projectService;
	
	@Autowired
	SoftBookingService softService;
	
	 @GetMapping("/projectDetailsView/{projectCode}")
	    public String viewIndividualProjectDetails(@PathVariable String projectCode,HttpServletRequest request,HttpServletResponse response) {
		 Project project  =null;
	    	try {
	    		project = projectService.getProjectDetailsByCode(projectCode);
	    		request.setAttribute("projectInfo", project);
	          
	    	}catch(Exception e) {
	    		
	    	}
	    	 return "soft/ProjectDetails";
	    }
	 
	 @PostMapping("/getAvailableResources")
	    public ResponseEntity<List<ResourceBooking>> getAvailableResources(@RequestParam("department") String department) {
	        List<ResourceBooking> resourceList = softService.getAllResourceByDept(department);
	        if (resourceList != null && resourceList.size()>0) {
	            return ResponseEntity.ok(resourceList);
	        } else {
	            return ResponseEntity.status(404).body(null);  // Return 404 if  not found
	        }
	    }
	 
	 @PostMapping("/bookResources")
	 public ResponseEntity<String> bookResourcesForTask(@RequestBody Resource resource) {
		 try {
			 String result = softService.saveResourcesForTask(resource);
			 if(resource.getResourceBooking().size()>0 && result!=null) {
				 // Return success response
				 return new ResponseEntity<>("Resources for task saved successfully", HttpStatus.OK);
			 }
			 return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		 }catch(Exception e) {
			 return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		 }
	 }
	 
	 @PostMapping("/getBookedResources")
	 public ResponseEntity<List<ResourceBooking>> getBookedResources(@RequestParam("taskId") String taskId) {
	     List<ResourceBooking> bookedResources = softService.getBookedResourcesByTaskId(taskId);
	     if (bookedResources != null && !bookedResources.isEmpty()) {
	         return ResponseEntity.ok(bookedResources);
	     } else {
	         return ResponseEntity.status(404).body(null);
	     }
	 }


}
