package com.dot1.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dot1.dto.ProjectTaskRequest;
import com.dot1.pojo.Project;
import com.dot1.pojo.Resource;
import com.dot1.service.ProjectService;

@Controller
@RequestMapping("/project")
public class ProjectController {
	
	@Autowired
	ProjectService projectService;
	
	 @GetMapping("/home")
	    public String home(HttpServletRequest request,HttpServletResponse response) {
	    	return "project/home";
	    }
	 
	 @GetMapping("/resource")
	    public String resource(HttpServletRequest request,HttpServletResponse response) {
	    	return "project/resourceAvailability";
	    }

	 @GetMapping("/costEstimations")
	    public String costEstimations(HttpServletRequest request,HttpServletResponse response) {
	    	return "project/costEstimations";
	    }

	 @GetMapping("/taskCreation")
	    public String taskCreation(HttpServletRequest request,HttpServletResponse response) {
	    	return "project/taskCreation";
	    }

	 @GetMapping("/softBooking")
	    public String softBooking(HttpServletRequest request,HttpServletResponse response) {
	    	return "project/softBooking";
	    }

	 @GetMapping("/resourceCosting")
	    public String resourceCosting(HttpServletRequest request,HttpServletResponse response) {
	    	return "project/resourceCosting";
	    }
	 
	
	 
	 @PostMapping("/resourcesearch")
		public ResponseEntity<List<Resource>> searchResources(
	            @RequestParam(value = "division", required = false) String division,
	            @RequestParam(value = "operatingUnit", required = false) String operatingUnit,
	            @RequestParam(value = "department", required = false) String department,
	            @RequestParam(value = "startDate", required = false) String startDate,
	            @RequestParam(value = "endDate", required = false) String endDate) {
	        try {
	        	  // Sample data (replace with your database queries)
		        List<Resource> resourcesList = new ArrayList<>();
		        resourcesList.add(new Resource("Dept1", "Java", 5));
		        resourcesList.add(new Resource("Dept2", "Python", 3));
		        resourcesList.add(new Resource("Dept1", "Angular", 7));

		        // Filter logic (this can be extended based on your needs)
		        List<Resource> filteredResources = new ArrayList<>();
		        for (Resource resource : resourcesList) {
		            if ((department == null || department.isEmpty() || resource.getDepartment().equalsIgnoreCase(department))) {
		                filteredResources.add(resource);
		            }
		        }

	            if (filteredResources.isEmpty()) {
	                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	            }
	            return new ResponseEntity<>(filteredResources, HttpStatus.OK);
	        } catch (Exception e) {
	            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	        }
	    }
	 
	 @PostMapping("/projectsearch")
		public ResponseEntity<List<Project>> projectsearch(
	            @RequestParam(value = "division", required = false) String division,
	            @RequestParam(value = "operatingUnit", required = false) String operatingUnit,
	            @RequestParam(value = "department", required = false) String department,
	            @RequestParam(value = "project", required = false) String project
	            ) {
	        try {
		        List<Project> projectList = new ArrayList<>();
		        projectList.add(new Project("1001", "Project Alpha", "John Doe", "OU1", "Dept1", "2024-01-01", "2024-12-31"));
		        projectList.add(new Project("1002", "Project Beta", "Jane Smith", "OU2", "Dept2", "2024-02-01", "2024-11-30"));
		        projectList.add(new Project("1003", "Project Gamma", "Jim Brown", "OU1", "Dept1", "2024-03-01", "2024-10-31"));

		        List<Project> filteredProjects = new ArrayList<>();
		        for (Project resource : projectList) {
		            if ((department == null || department.isEmpty() || resource.getDepartment().equalsIgnoreCase(department))) {
		            	filteredProjects.add(resource);
		            }
		        }

	            if (filteredProjects.isEmpty()) {
	                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	            }
	            return new ResponseEntity<>(filteredProjects, HttpStatus.OK);
	        } catch (Exception e) {
	            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	        }
	    }
	    
	 
	 @PostMapping("/saveProjectTasks")
	 public ResponseEntity<String> saveProjectTasks(@RequestBody ProjectTaskRequest request) {
		 // Handle the task saving logic here (save to the database, etc.)
		 // For demonstration, we are just printing the received data
		 System.out.println("Received tasks: " + request.getTasks());
		 System.out.println("Received machinery: " + request.getMachinery());
		 try {
			 String result = projectService.saveProjectTasksAndMachinery(request);
			 if(request.getTasks().size()>0 && result!=null) {
				 // Return success response
				 return new ResponseEntity<>("Project tasks saved successfully", HttpStatus.OK);
			 }
			 return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		 }catch(Exception e) {
			 return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		 }
	 }
	 
	 @PostMapping("/getProjectDetails")
	    public ResponseEntity<Project> getProjectDetails(@RequestParam("projectCode") String projectCode) {
	        // Fetch project details using the projectCode
		 Project projectDetails = projectService.getProjectDetailsByCode(projectCode);
	        
	        // Check if project details are found
	        if (projectDetails != null) {
	            return ResponseEntity.ok(projectDetails);
	        } else {
	            return ResponseEntity.status(404).body(null);  // Return 404 if project not found
	        }
	    }

}
