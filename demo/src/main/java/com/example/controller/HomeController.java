package com.example.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
// import는  Ctrl + Shift + o

@Controller

// public class HomeController extends Controller {
public class HomeController {
	
//	@RequestMapping(value="/")	// 크롬 127.0.0.1:8080/
//	public String home() {
//		return "index";
//	}
	
	@RequestMapping(value="/")	// 크롬 127.0.0.1:8080/
	public String home(HttpSession httpSession) {
//		String userid = (String)httpSession.getAttribute("SESSION_ID");
		return "index";
	}
	
//	@RequestMapping(value="/test1")
//	public String test1() {
//		return "";
//	}
}
