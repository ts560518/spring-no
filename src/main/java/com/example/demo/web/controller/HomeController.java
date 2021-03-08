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

import com.example.demo.dto.OrderDto;
import com.example.demo.exception.DuplicatedUserIdException;
import com.example.demo.exception.PasswordMismatchException;
import com.example.demo.exception.UserNotFoundException;
import com.example.demo.service.NoticeService;
import com.example.demo.service.OrderService;
import com.example.demo.service.ShowService;
import com.example.demo.service.UserService;
import com.example.demo.util.SessionUtils;
import com.example.demo.util.StringUtils;
import com.example.demo.vo.Notice;
import com.example.demo.vo.Order;
import com.example.demo.vo.Show;
import com.example.demo.vo.ShowUserPointHistories;
import com.example.demo.vo.User;
import com.example.demo.vo.UserCoupon;
import com.example.demo.web.annotation.LoginUser;
import com.example.demo.web.form.UserForm;

@Controller
public class HomeController {
	
	@Autowired
	OrderService orderService;

	@Autowired
	UserService userService;
	
	@Autowired
	ShowService showService;
	
	@Autowired
	NoticeService noticeService;
	
	@RequestMapping("/loginform.do")
	public String loginform() {
		return "loginform";
	}
	
	@RequestMapping("/form.do")
	public String form() {
		return "form";
	}
	
	@RequestMapping("/my/info.do")
	public String info(@LoginUser User user, Model model) {
		
		int orderCount = orderService.getCountOrderByUserNo(user.getNo());
		List<OrderDto> order = orderService.getOrderByUserNo(user.getNo());
		List<OrderDto> coupon = orderService.getCouponByUserNo(user.getNo());
		List<ShowUserPointHistories> point = orderService.getPointByUserNo(user.getNo());
		
		model.addAttribute("orderCount", orderCount);
		model.addAttribute("user", user);
		model.addAttribute("order", order);
		model.addAttribute("coupon", coupon);
		model.addAttribute("point", point);
		
		return "/my/info";
	}
	
	@RequestMapping("/my/checkPassword.do")
	public String checkPassword(@LoginUser User user, Model model) {
		if (user == null) {
			return "redirect:loginform.do?error=notfound";
		}
		model.addAttribute("user", user);
		
		return "/my/checkPassword";
	}
	
	@RequestMapping("/my/modifyForm.do")
	public String checkPassword(@RequestParam("id") String userId, 
								@RequestParam("password") String password, 
								@LoginUser User user, Model model) {
		
		// 기재된 id, password로 저장된 유저의 정보를 가져온다.
		try { 
			User savedUser = userService.getLoginedUserInfo(userId, password);
			model.addAttribute("user", savedUser);
		
		} catch (PasswordMismatchException e) {
			e.printStackTrace();
			return "redirect:checkPassword.do?error=mismatch";
		}
		
		return "/my/modifyForm";
	}
	
	@RequestMapping("/my/updateUser.do")
	public String updateUser(@RequestParam("password") String password,
							@RequestParam("tel") String tel,
							@RequestParam("postAddress") String postAddress,
							@RequestParam("address1") String address1,
							@RequestParam("address2") String address2,
							@RequestParam("address3") String address3,
							@RequestParam("emailReceivingConsent") String emailReceivingConsent,
							@RequestParam("smsReceivingConsent") String smsReceivingConsent,
							@LoginUser User user) {
		
		User savedUser = userService.getUserById(user.getId());
		savedUser.setPassword(password);
		savedUser.setTel(tel);
		
		String address = "(" + postAddress + ")" + " " + address1 + " " + address2 + " " + address3;
		
		savedUser.setAddress(address);
		savedUser.setEmailReceivingConsent(emailReceivingConsent);
		savedUser.setSmsReceivingConsent(smsReceivingConsent);
		
		userService.updateUser(savedUser);
		
		return "redirect:info.do";
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
			String userAbleStatus = userService.getUserAbleStatusById(userId);
			// 세션에 로그인된 사용자정보를 저장한다.
			SessionUtils.setAttribute("LOGINED_USER", user);
			if (userAbleStatus == "N") {
				return "redirect:loginform.do?error=notfound";
			}
			
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
	
	@RequestMapping("/completed.do")
	public String completed() {
		return "completed";
	}
	
	@RequestMapping("/register.do")
	public String register(UserForm userForm) throws IOException {
		// User객체를 생성해서 UserForm객체의 값을 복사한다.
		// MultipartFile타입의 객체가 복사되지 않도록 한다.(User와 UserForm에서 각각 다른 이름을 사용한다.)
		String address = "(" + userForm.getPostAddress() + ")" + " " + userForm.getAddress1() + " " + userForm.getAddress2() + " " + userForm.getAddress3();
		
		// user_no랑 user_role에 넣기위해서 no를 구함
		int no = userService.getUserNo();
		
		User user = new User();
		UserCoupon userCoupon = new UserCoupon();
		user.setNo(no);
		BeanUtils.copyProperties(userForm, user);
		user.setAddress(address);
		userCoupon.setUserNo(no);
		
		try {
			userService.addNewUser(user);
			userService.addNewUserRole(user.getNo());
			userService.insertUserCouponHistory(userCoupon);
		} catch (DuplicatedUserIdException e) {
			e.printStackTrace();
			return "redirect:form.do?error=dup";
		}
		
		return "redirect:completed.do";
	}
	
	@RequestMapping("/home.do")
	public String home(Model model) {
		model.addAttribute("users", userService.getAllUsers());
		
		// 홈페이지 랭킹별 3개
		List<Show> showRankList = showService.getShowRankHome();
		
		// 홈페이지 공지사항 뿌리기
		List<Notice> noticeList = noticeService.getNoticeHome();
		// 티켓오픈
		List<Show> showList = showService.getShowsHome();
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("showRankList", showRankList);
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
