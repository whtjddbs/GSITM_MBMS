package com.gsitm.mbms.mypage;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @작성일 : 2019. 5. 28.
 * @작성자 : 이주현
 */

@Controller
@RequestMapping("/mypage")
public class MypageHistoryController {
	private static final Logger logger = LoggerFactory.getLogger(MypageHistoryController.class);

//	@Inject
//	private MypageHistoryService service;
	
	/** 예약현황 목록 */
	@RequestMapping(value = "/mypageStatusList", method = RequestMethod.GET)
	public String mypageStatusList(Model model, HttpServletRequest request) throws Exception {
		logger.info("mypageStatus ListPage!");

		return "/mypage/mypageStatusList";
	}
	
	/** 예약이력 목록 */
	@RequestMapping(value = "/mypageHistoryList", method = RequestMethod.GET)
	public String mypageHistoryList(Model model, HttpServletRequest request) throws Exception {
		logger.info("mypageHistory ListPage!");

//		List<MypageHistoryDTO> MypageHistoryList = service.selectAll();
//		model.addAttribute("MypageHistoryList", MypageHistoryList);

		return "/mypage/mypageHistoryList";
	}
}
