package com.example.demo.web.controller.api;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.stringtemplate.v4.compiler.STParser.mapExpr_return;

import com.example.demo.dto.PutSeat;
import com.example.demo.service.GenreService;
import com.example.demo.service.ShowService;
import com.example.demo.service.UserService;
import com.example.demo.vo.User;

@RestController("apiMemberController")
@RequestMapping("/api/member")
public class MemberAjaxController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping("checkUserId.do")
	public Map<String, Boolean> checkUserId(@RequestParam("userId") String userId) {
		Map<String, Boolean> result = new HashMap<>();
		
		User user = userService.getUserById(userId);
		System.out.println(user);
		if (user == null) {
			result.put("exist", false);
		} else {
			result.put("exist", true);
		}
		
		return result;
	}
}
