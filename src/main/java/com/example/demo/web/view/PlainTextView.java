package com.example.demo.web.view;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.AbstractView;

@Component
public class PlainTextView extends AbstractView {

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String text = (String) model.get("message");
		
		response.setContentType("text/plain;charset=utf-8");
		// 브라우저에게 1글자씩 내보내는 스트림
		PrintWriter out = response.getWriter();
		out.println(text);
	}
}
