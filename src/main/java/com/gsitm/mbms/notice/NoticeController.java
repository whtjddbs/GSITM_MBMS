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

	/**
	 * 공지사항
	 * 목록-------------------------------------------------------------------------------------
	 * 
	 * @throws Exception
	 */

	// 공지사항 리스트 전체보기-----------------------------------------------------------------------------------
	@RequestMapping(value = "/noticeList", method = RequestMethod.GET)
	public String noticeList(Model model, HttpServletRequest request) throws Exception {

		List<NoticeDTO> noticeList = service.selectAll();
		model.addAttribute("noticeList", noticeList);

		return "notice/noticeList";
	}

	// 공지사항 글 상세보기---------------------------------------------------------------------------------------
	@RequestMapping(value = "/noticeDetail", method = RequestMethod.GET)
	public void noticeDetail(@RequestParam("notice_no") int notice_no, Model model) throws Exception {
		
		model.addAttribute("noticeDTO", service.selectByNoticeNo(notice_no));
	}

	// delete----------------------------------------------------------------------------------------------------
	// 글삭제
	@RequestMapping(value = "/noticeDelete", method = RequestMethod.POST)
	public String noticeDelete(@RequestParam("notice_no") int notice_no, Model model) throws Exception {
		
		service.delete(notice_no);
		return "redirect:/notice/noticeList";
	}

	// update-----------------------------------------------------------------------------------------------------
	// 글 수정 폼 보기
	@RequestMapping(value = "/noticeUpdateForm", method = RequestMethod.POST)
	public void noticeUpdateForm(@RequestParam("notice_no") int notice_no,  Model model) throws Exception {
		model.addAttribute("noticeDTO", service.selectByNoticeNo(notice_no));
	}

	// 글 수정 submit
	@RequestMapping(value = "/updateSubmit", method = RequestMethod.POST)
	public String updateSubmit(NoticeDTO noticeDTO,  Model model) throws Exception {

		service.update(noticeDTO);

		return "notice/noticeList";
	}

}
