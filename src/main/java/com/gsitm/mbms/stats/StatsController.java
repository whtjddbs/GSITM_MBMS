package com.gsitm.mbms.stats;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.gsitm.mbms.building.BuildingDTO;
import com.gsitm.mbms.building.BuildingService;
import com.gsitm.mbms.employee.EmployeeDTO;
import com.gsitm.mbms.employee.LoginService;

/**
 * @주제 :
 * @작성일 : 2019. 5. 16.
 * @작성자 : 송민기
 */

@Controller
@RequestMapping("/stats")
public class StatsController {

	private static final Logger logger = LoggerFactory.getLogger(StatsController.class);

	@Inject
	private StatsService StatsService;
	
	@Inject
	private BuildingService buildingService;
	/**
	 * 공지사항 목록-------------------------------------------------------------------------------------
	 * 
	 */

	
	
	
	@RequestMapping(value = "/statsMain", method = RequestMethod.GET)
	public void statsMain(Model model) throws Exception {
		
		//근무지(빌딩)리스트 가져오기
		List<BuildingDTO> buildingList = buildingService.selectAll();
		model.addAttribute("buildingList", buildingList);
		
		
		
		
	}
	
	/*
	// 공지사항 리스트
	// 전체보기-----------------------------------------------------------------------------------
	@RequestMapping(value = "/noticeList", method = RequestMethod.GET)
	public String noticeList(Model model, HttpServletRequest request, HttpSession session) throws Exception {

		//공지리스트 가져오기 및 모델에 추가
		List<NoticeDTO> noticeList = noticeService.selectAll();
		model.addAttribute("noticeList", noticeList);

		//세션정보 가져오기
		EmployeeDTO employeeDTO = (EmployeeDTO)session.getAttribute("login");

		//운영자리스트 가져오기
		List<EmployeeDTO> adminList = loginService.selectAllAdmin();
		
		//운영자인지 판별 및 모델에 추가
		boolean isAdmin =  false;
		for (int i = 0; i < adminList.size(); i++) {
			if(adminList.get(i).getEmpNo().equals(employeeDTO.getEmpNo())) {
				isAdmin=true;
				break;
			}
		}
		model.addAttribute("isAdmin", isAdmin);
		
		return "notice/noticeList";
	}
	
	*/
	
	
	
	
	
	
	
	

}
