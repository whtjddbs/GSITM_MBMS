package com.gsitm.mbms.stats;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
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
import com.gsitm.mbms.employee.DepartmentDTO;
import com.gsitm.mbms.employee.EmployeeDTO;
import com.gsitm.mbms.employee.LoginService;
import com.gsitm.mbms.reserve.ReserveHistoryDTO;
import com.gsitm.mbms.room.RoomDTO;
import com.gsitm.mbms.room.RoomService;

import lombok.extern.slf4j.Slf4j;

/**
 * @주제 :
 * @작성일 : 2019. 5. 16.
 * @작성자 : 송민기
 */

@Controller
@RequestMapping("/stats")
@Slf4j
public class StatsController {

	private static final Logger logger = LoggerFactory.getLogger(StatsController.class);

	@Inject
	private StatsService statsService;
	
	@Inject
	private BuildingService buildingService;
	
	@Inject
	private RoomService roomService;
	

/*	@RequestMapping(value = "/statsMain", method = RequestMethod.GET)
	public String statsMain(Model model) throws Exception {
		
		//근무지(빌딩)리스트 가져오기
		List<BuildingDTO> buildingList = buildingService.selectAll();
		model.addAttribute("buildingList", buildingList);
		
		//부서 리스트 가져오기
		List<DepartmentDTO> departmentList = statsService.selectAllDept();
		model.addAttribute("departmentList", departmentList);
		
		//현재 있는 모든 Room의 타입(회의실, 교육실, 기타 등) 가져오기
		List<RoomDTO> roomList = roomService.selectAllRoom();
		List<String> roomTypes = new ArrayList<String>();
		for (int i = 0; i < roomList.size(); i++) {
			String thisType = roomList.get(i).getRoomType();
			if (!roomTypes.contains(thisType)) {
				roomTypes.add(thisType);
			}
		}
		model.addAttribute("roomTypes", roomTypes);
		return "stats/statsMain";
	}
	*/
	
	@RequestMapping(value = "/statsMain", method = RequestMethod.GET)
	public String statsMain(Model model) throws Exception {
		
		//근무지(빌딩)리스트 가져오기
		List<BuildingDTO> buildingList = buildingService.selectAll();
		model.addAttribute("buildingList", buildingList);
		
		//부서 리스트 가져오기
		List<DepartmentDTO> departmentList = statsService.selectAllDept();
		model.addAttribute("departmentList", departmentList);
		
		//현재 있는 모든 Room의 타입(회의실, 교육실, 기타 등) 가져오기
		List<RoomDTO> roomList = roomService.selectAllRoom();
		List<String> roomTypes = new ArrayList<String>();
		for (int i = 0; i < roomList.size(); i++) {
			String thisType = roomList.get(i).getRoomType();
			if (!roomTypes.contains(thisType)) {
				roomTypes.add(thisType);
			}
		}
		model.addAttribute("roomTypes", roomTypes);
		
		
		//전체 기록 가져오기
		 List<ReserveHistoryDTO> historyList= statsService.selectAllHistory();
		 model.addAttribute("historyList", historyList);
		 
		
		return "stats/statsMain";
	}
	
	
	@RequestMapping(value = "/statsFiltering", method = RequestMethod.GET)
	public String availableRoomList(String buildingSelect, String deptSelect, String roomTypeSelect, String timeSelect, Model model) {
		
		// 근무지(빌딩)리스트 가져오기
		List<BuildingDTO> buildingList = buildingService.selectAll();
		model.addAttribute("buildingList", buildingList);

		// 부서 리스트 가져오기
		List<DepartmentDTO> departmentList = statsService.selectAllDept();
		model.addAttribute("departmentList", departmentList);

		// 현재 있는 모든 Room의 타입(회의실, 교육실, 기타 등) 가져오기
		List<RoomDTO> roomList = roomService.selectAllRoom();
		List<String> roomTypes = new ArrayList<String>();
		for (int i = 0; i < roomList.size(); i++) {
			String thisType = roomList.get(i).getRoomType();
			if (!roomTypes.contains(thisType)) {
				roomTypes.add(thisType);
			}
		}
		model.addAttribute("roomTypes", roomTypes);

		// 필터링할 정보 맵으로 모으기 :
		// 근무지로 거르면 해당 소속 회의실들 정보만 나오게,
		// 부서로 거르면 해당 부서에서 근무하는 직원들이 신청한 정보만 나오게
		// 날짜로 거르면 하루라도 시작~끝검색 날짜에 걸리면 나오게 (카운트 셀때는 1일 1회로 세야)
		
		Map<String, String> filterMap = new HashMap<String, String>();
		filterMap.put("buildingSelect", buildingSelect);
		filterMap.put("deptSelect", deptSelect);
		filterMap.put("roomTypeSelect", roomTypeSelect);
		filterMap.put("timeSelect", timeSelect);
		
		
		//필터링한 리스트 가져오기
		List<ReserveHistoryDTO> historyList = statsService.selectFilterHistory(filterMap);
		model.addAttribute("historyList", historyList);
		
		
		return "room/roomList";
	}

}
