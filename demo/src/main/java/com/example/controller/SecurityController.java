package com.example.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.mapper.User1Mapper;
import com.example.vo.User1VO;

@Controller
@RequestMapping("/security")
public class SecurityController {
	
	@Autowired
	private User1Mapper user1Mapper;

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home1() {
		return "/security/home";
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "/security/join";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(@ModelAttribute User1VO obj, HttpServletRequest request) {
		System.out.println(obj.toString());
		
		// 패스워드 암호화(a → flk4322ldo@#44fsd@asdcx&*dfk) + salt(random값)
		// 같은 암호라도 다르게 보이기 위해 salt값이 필요함
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String str1 = passwordEncoder.encode(obj.getPassword());
		obj.setPassword(str1);
		
		user1Mapper.insertMember(obj);
		
		return "redirect:" +  request.getContextPath() +"/security/home";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "/security/login";
	}
	
	@RequestMapping(value = "/Page403", method = RequestMethod.GET)
	public String Page403() {
		return "/security/Page403";
	}
}