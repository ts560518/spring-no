package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl implements MailService {

	@Autowired
	JavaMailSender emailSender;
	
	@Override
	public void sendSimpleMessage(String to, String subject, String text) {
		// SimpleMailMessage는 일반적인 텍스트를 포함하는 메일을 표현하는 객체다.
		SimpleMailMessage message = new SimpleMailMessage();
		// 보내는 사람
		message.setFrom("zcam9708@gmail.com");
		// 받는 사람
		message.setTo(to);
		// 제목
		message.setSubject(subject);
		// 내용
		message.setText(text);
		
		// 메일을 발송하는 MailSender를 이용해서 메일을 발송한다.
		emailSender.send(message);
	}
}
