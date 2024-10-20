package com.dot1.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dot1.pojo.Project;
import com.dot1.service.ProjectService;

@Controller
@RequestMapping("/soft")
public class SoftBookingController {
	
	@Autowired
	ProjectService projectService;
	
	
	
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

}
