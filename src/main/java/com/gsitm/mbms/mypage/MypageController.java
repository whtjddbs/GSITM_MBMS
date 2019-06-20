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
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @작성일 : 2019. 5. 28.
 * @작성자 : 이주현
 */

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Inject
	private MypageService mypageService;
	
//	@Autowired
//	private ReserveService reserveService;
//	
//	@Autowired
//	private BuildingService buildingService;

	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);

	/** 예약현황 목록 */
	@RequestMapping(value = "/mypageStatusList", method = RequestMethod.GET)
	public String mypageStatusList(Model model, HttpServletRequest request) throws Exception {
		logger.info("mypageStatus ListPage!");

		List<MypageDTO> mypageStatusList = mypageService.selectAllStatus();

		model.addAttribute("mypageStatusList", mypageStatusList);
		
		return "/mypage/mypageStatusList";
	}
	
	/** 회의 참석자 목록 */
	@RequestMapping(value = "/mypageMemberList", method = RequestMethod.GET)
	public String mypageMemberList(Model model, HttpServletRequest request) throws Exception {

		List<MypageDTO> mypageMemberList = mypageService.selectMemberList();
		
		model.addAttribute("mypageMemberList", mypageMemberList);
		
		return "/mypage/mypageStatusList";
	}
	
	/** 예약이력 목록 */
	@RequestMapping(value = "/mypageHistoryList", method = RequestMethod.GET)
	public String selectAllMypageHistory(Model model, HttpServletRequest request) throws Exception {
		//logger.info("mypageHistory ListPage!");

		List<MypageDTO> mypageHistoryList = mypageService.selectAllHistory();

		model.addAttribute("mypageHistoryList", mypageHistoryList);

		return "/mypage/mypageHistoryList";
	}
	
	/** 예약 삭제 */
	@RequestMapping(value = "/mypageDelete", method = RequestMethod.POST)
	public String mypageDelete(@RequestParam("reserveNo") int reserveNo, Model model) throws Exception {
		
		mypageService.delete(reserveNo);
		return "redirect:/mypage/mypageStatusList";
	}
	

	
}
