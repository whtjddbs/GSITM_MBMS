package com.gsitm.mbms.notice;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @주제 :
 * @작성일 : 2019. 5. 16.
 * @작성자 : 송민기
 */


@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Inject
	private NoticeService service;
	
	/** 공지사항 목록------------------------------------------------------------------------------------- 
	 * @throws Exception */
	
	// 공지사항 글 보기 이동
	@RequestMapping(value = "/noticeList", method = RequestMethod.GET)
	public String noticeList( Model model, HttpServletRequest request) throws Exception {
		
		List<NoticeDTO> noticeList = service.selectAll();
		//System.out.println(noticeList.get(1));
		model.addAttribute("noticeList", noticeList);
		
		return "notice/noticeList";
	}
}
