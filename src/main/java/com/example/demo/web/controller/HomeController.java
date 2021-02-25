package com.example.demo.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.dao.ShowDao;
import com.example.demo.dto.TotalShow;
import com.example.demo.exception.PasswordMismatchException;
import com.example.demo.exception.UserNotFoundException;
import com.example.demo.service.ShowService;
import com.example.demo.service.UserService;
import com.example.demo.util.SessionUtils;
import com.example.demo.util.StringUtils;
import com.example.demo.vo.PutShows;
import com.example.demo.vo.Show;
import com.example.demo.vo.User;

@Controller
public class HomeController {

	@Autowired
	UserService userService;
	
	@Autowired
	ShowService showService;
	
	@RequestMapping("/loginform.do")
	public String loginform() {
		return "loginform";
	}
	
	@RequestMapping("/form.do")
	public String form() {
		return "form";
	}
	
	@RequestMapping("/my/info.do")
	public String info() {
		return "/my/info";
	}
	
	// spring-shop/login.do 요청에 대한 요청핸들러 메소드
	// id=사용자아이디&password=비밀번호가 요청파라미터로 전달된다.
	@RequestMapping("/login.do")
	public String login(@RequestParam("id") String userId,
			@RequestParam("password") String password) {
		
		if (StringUtils.isEmpty(userId) || StringUtils.isEmpty(password)) {
			return "redirect:loginform.do?error=empty";	// id, password값이 비어있으면 로그인폼을 요청하는 URL을 응답으로 보낸다. 
		}
		
		try {
			User user = userService.getLoginedUserInfo(userId, password);
			
			// 세션에 로그인된 사용자정보를 저장한다.
			SessionUtils.setAttribute("LOGINED_USER", user);
			
		} catch (UserNotFoundException e) {
			e.printStackTrace();
			return "redirect:loginform.do?error=notfound";
			
		} catch (PasswordMismatchException e) {
			e.printStackTrace();
			return "redirect:loginform.do?error=mismatch";
		}
		return "redirect:home.do";
	}
	
	// spring-shop/logout.do 요청에 대한 요청핸들러 메소드
	@RequestMapping("/logout.do")
	public String logout() {
		// 세션에서 로그인된 사용자 정보 삭제
		SessionUtils.removeAttribute("LOGINED_USER");
		
		return "redirect:home.do";
	}
	
	@RequestMapping("/home.do")
	public String home(Model model) {
		model.addAttribute("users", userService.getAllUsers());
		
		List<Show> showList = showService.getShowsHome();
		model.addAttribute("showList", showList);
		
		return "home";
	}
	
	@RequestMapping("/ticketOpen.do")
	public String ticket() {
		return "ticketOpen";
	}
	
	@RequestMapping("/notice.do")
	public String notice() {
		return "notice";
	}
	
	@RequestMapping("/searchMain.do")
	public String searchMain(@RequestParam("title") String title, Model model) {
		model.addAttribute("title", title);
		return "searchMain";
	}
}
