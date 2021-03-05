package com.example.demo.web.controller;

import org.apache.commons.lang3.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.MailService;

@Controller
public class UserController {

	@Autowired
	MailService mailService;
	
	// 인증번호를 발행해서 전달받은 메일주소로 발송하는 컨트롤러
	@RequestMapping(path ="/sendRandom.do", produces = "text/plain")
	public @ResponseBody String sendRandom(@RequestParam("email") String to) {
		// 발행된 인증코드
		String code = String.valueOf(RandomUtils.nextInt(100000, 1000000));
		
		// 메일의 제목
		String subject = "NO24 회원가입용 이메일 인증코드";
		// 메일의 내용
		String text = "다음의 인증코드로 인증확인을 해주셔야 회원가입이 진행됩니다." + "\n\n" + code;
		mailService.sendSimpleMessage(to, subject, text);
		
		return code;
	}
}
