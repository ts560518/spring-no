package com.example.demo.web.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.exception.DuplicatedUserIdException;
import com.example.demo.exception.PasswordMismatchException;
import com.example.demo.exception.UserNotFoundException;
import com.example.demo.service.ShowService;
import com.example.demo.service.UserService;
import com.example.demo.util.SessionUtils;
import com.example.demo.util.StringUtils;
import com.example.demo.vo.Show;
import com.example.demo.vo.User;
import com.example.demo.web.form.UserForm;
import com.example.demo.web.view.PlainTextView;

@Controller
public class HomeController {

	@Autowired
	UserService userService;
	
	@Autowired
	ShowService showService;
	
	@Autowired
	PlainTextView plainTextView;
	
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
	
	// spring-shop/checkUserId.do 요청에 대한 요청핸들러 메소드
	// 아이디를 전달받아서 사용가능한 아이디인지 아닌지를 응답으로 보낸다.
	@RequestMapping("/checkUserId.do")
	public ModelAndView checkUserId(@RequestParam("userId") String userId) {
		ModelAndView mav = new ModelAndView();
		mav.setView(plainTextView);
		
		boolean isExist = userService.isExistUserId(userId);
		if (isExist) {
			mav.addObject("message", "이미 사용중인 아이디입니다.");
		} else {
			mav.addObject("message", "사용가능한 아이디입니다.");
		}
		
		return mav;
	}
	
	@RequestMapping("/register.do")
	public String register(UserForm userForm) throws IOException {
		// User객체를 생성해서 UserForm객체의 값을 복사한다.
		// MultipartFile타입의 객체가 복사되지 않도록 한다.(User와 UserForm에서 각각 다른 이름을 사용한다.)
		User user = new User();
		BeanUtils.copyProperties(userForm, user);
		
		try {
			userService.addNewUser(user);
		} catch (DuplicatedUserIdException e) {
			e.printStackTrace();
			return "redirect:form.do?error=dup";
		}
		
		return "redirect:completed.do";
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
	
	@RequestMapping("/area.do")
	public String area() {
		return "/about/area";
	}
	
	@RequestMapping("/rank.do")
	public String rank() {
		return "/about/rank";
	}
}
