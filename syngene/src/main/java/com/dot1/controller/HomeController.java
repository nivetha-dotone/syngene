package com.dot1.controller;

import java.util.stream.Stream;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dot1.service.MasterUserService;
import com.dot1.pojo.MasterUser;

@Controller
public class HomeController {
	
	@Autowired
	MasterUserService masterUserService;

	@RequestMapping(path = "/userlogin", method = RequestMethod.POST)
	public String login(@RequestParam("email") String em, @RequestParam("password") String pwd, HttpSession session) {

		MasterUser user = masterUserService.findMasterUserDetailsByUserName(em, pwd);

		
		if (user != null) {
			 String initials = Stream.of(user.getFirstName(), user.getLastName())
		                .map(name -> String.valueOf(name.charAt(0)))  // Get the first character
		                .reduce("", (a, b) -> a + b); 
			session.setAttribute("userInitials", initials);
			session.setAttribute("loginuser", user);
			return "WelcomePage";
		} else {
			session.setAttribute("msg", "invalid email and password");
			return "redirect:/UserLogin.jsp";
		}

	}
}
