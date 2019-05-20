package com.gsitm.mbms.notice;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @주제 : 
 * @작성일 : 2019. 5. 16.
 * @작성자 : 조성윤
 */
@Controller
@RequestMapping("/notice")
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	/** 공지사항 목록 */
	@RequestMapping(value="/noticeList", method=RequestMethod.GET)
	public String noticeList() {
		logger.info("noticeList Page !!");
		return "notice/noticeList";
	}
}
