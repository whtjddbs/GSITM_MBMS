package com.gsitm.mbms.reserve;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gsitm.mbms.building.BuildingDTO;
import com.gsitm.mbms.building.BuildingService;
import com.gsitm.mbms.room.RoomDTO;

/**
 * @주제 : 
 * @작성일 : 2019. 5. 24.
 * @작성자 : 조성윤
 */
@Controller
@RequestMapping("/reserve")
public class ReserveController {
	@Autowired
	private ReserveService reserveService;
	@Autowired
	private BuildingService buildingService;

	@RequestMapping("/roomList")
	public String roomList(Model model) {
		
		List<RoomDTO> rooms = reserveService.selectAllRoom();
		List<BuildingDTO> buildings = buildingService.SelectAll();
		
		model.addAttribute("rooms", rooms);
		model.addAttribute("buildings", buildings);
		
		return "room/roomList";
	}
	
	@RequestMapping("/roomSearch")
	public ModelAndView roomSearch(@RequestParam Map<String, String> map, Model model) {
		
		List<RoomDTO> rooms = reserveService.selectRoomBySearch(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("rooms", rooms);
		mav.setViewName("jsonView");	
		return mav;
	}
}