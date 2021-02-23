package com.example.demo.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.dao.ShowDao;
import com.example.demo.dto.TotalShow;
import com.example.demo.service.ShowService;
import com.example.demo.service.UserService;
import com.example.demo.vo.PutShows;
import com.example.demo.vo.Show;

@Controller
public class HomeController {

	@Autowired
	UserService userService;
	
	@Autowired
	ShowService showService;
	
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
