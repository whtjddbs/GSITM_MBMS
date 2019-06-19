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
	
	/** 날짜 검색을 통한 회의실 예약 이력 조회  **/
//	@RequestMapping("/selectHistoryReserve")
//	public String selectHistoryReserve(@RequestParam Map<String,Object> map, Model model, HttpSession session) throws Exception {
//		System.out.println(map.toString());
//		
//		String dateRange = (String) map.get("reservationtime");
//		String dates[] = dateRange.split("-");
//		map.put("startDate", dates[0].trim());
//		map.put("endDate", dates[1].trim());
//		map.put("empCount", (String) map.get("empCount") == "" ? 0 : map.get("empCount"));
//		
//		//회의실 검색 정보 저장
//		session.setAttribute("reservationInfo", map);
//		
//		List<MypageDTO> selectHistoryReserve = mypageService.selectHistoryReserve(map);
//		
//		model.addAttribute("selectHistoryReserve", selectHistoryReserve);
//		
//		return "/mypage/mypageHistoryList";
//	}

	
}
