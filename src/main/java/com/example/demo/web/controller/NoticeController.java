package com.example.demo.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.service.NoticeService;
import com.example.demo.service.ShowService;
import com.example.demo.vo.Notice;
import com.example.demo.vo.Show;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	NoticeService noticeService;
	
	@Autowired
	ShowService showService;

	@RequestMapping("/list.do")
	public String notice(@RequestParam(name = "opt", required = false, defaultValue = "title") String opt,
						@RequestParam(name = "keyword", required = false) String keyword,
						@RequestParam(name = "sort", required = false, defaultValue = "date") String sort,
						@RequestParam(name = "pageNo", required = false, defaultValue = "1") int pageNo,
						@RequestParam(name = "rows", required = false, defaultValue = "10") int rows,
						Model model) {
		// 티켓오픈
		List<Show> showList = showService.getShowsHome();
				
		// 공지 검색조건을 저장하는 Map객체 생성
		Map<String, Object> condition = new HashMap<String, Object>();

		if (opt != null && !opt.isEmpty() && keyword != null && !keyword.isEmpty()) {
			condition.put("opt", opt);
			condition.put("keyword", keyword);
		}
		
		condition.put("pageNo", pageNo);
		condition.put("rows", rows);
		condition.put("begin", (pageNo - 1) * rows + 1);
		condition.put("end", pageNo * rows);
		condition.put("sort", sort);
		
		// 뷰에 표시할 공지 정보와 페이징 정보를 조회한다.
		Map<String, Object> resultMap = noticeService.getNotices(condition);
		
		model.addAttribute("showList", showList);
		model.addAttribute("page", resultMap.get("pagination"));
		model.addAttribute("notices", resultMap.get("notices"));
		
		return "notice/list";
	}

	@RequestMapping("/detail.do")
	public String detail(@RequestParam("noticeNo") int noticeNo, Model model) {
		Notice notice = noticeService.getNoticeByNo(noticeNo);

		model.addAttribute("notice", notice);
		// model.addAttribute("pageNo", pageNo); 굳이 모델에 담기보다는 param.pageNo이 나으려나
		return "notice/detail";
	}

}
