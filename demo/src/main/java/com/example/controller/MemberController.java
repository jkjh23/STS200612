package com.example.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.dao.MemberDAO;
import com.example.vo.MemberVO;

@Controller
@RequestMapping(value="/member")
public class MemberController {

	@Autowired
	private MemberDAO mDAO = null;  //MemberDAO mDAO = new MemberDAO()
	
	// 단축키
	// Ctrl ? -> 주석문
	// Ctrl Shift f -> 자동정렬
	
	@RequestMapping(value="/memberlist")
	public String memberlist(Model model) {
		// Model model = new Model();
		List<MemberVO> list = mDAO.selectMemberList();
		
		for (MemberVO tmp:list) {
			System.out.println(tmp.toString());
		}
		// model.addAttribute("name", "가나다");
		System.out.println(list.size());
		model.addAttribute("list", list); 		// hashmap<key, value> : C -> V로 값 전달
		return "memberlist";
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession httpSession) {
		// httpSession.setAttribute("SESSION_ID", null);
		httpSession.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginpost(@ModelAttribute MemberVO obj, HttpSession httpSession, HttpServletRequest request) {
		// DAO로 전달
		MemberVO obj1 = mDAO.selectMemberLogin(obj);
		if(obj1 != null) {
			httpSession.setAttribute("SESSION_ID", obj.getUserid());
			String backURL = (String) httpSession.getAttribute("CURRPAGE");
			return "redirect:" + backURL;	// 고정될 수 X(가변화 필요), 이전 페이지로 가야됨
		}
		return "redirect:" + request.getContextPath() + "/member/login";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join() {
		return "join"; //join.jsp를 표시하시오.
	}

	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinpost(@ModelAttribute MemberVO obj) {
		System.out.println(obj.toString());
		int ret = mDAO.insertMember(obj);
		
		if(ret > 0) { //회원가입 성공시
			return "redirect:/";
		}
		
		//회원가입 실패시
		return "redirect:/member/join";
	}
}