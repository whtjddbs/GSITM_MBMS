package com.gsitm.mbms.room;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gsitm.mbms.building.BuildingController;
import com.gsitm.mbms.building.BuildingDTO;
import com.gsitm.mbms.building.BuildingService;

/**
 * @주제 : 
 * @작성일 : 2019. 6. 3.
 * @작성자 : 김원빈
 */
@Controller
@RequestMapping("/room")
public class RoomController {
	
	private static final Logger logger = LoggerFactory.getLogger(BuildingController.class);
	
	@Inject
	private BuildingService buildingService;
	@Inject
	private RoomService roomService;
	
	//Room 목록
	@RequestMapping(value="/roomManageList", method=RequestMethod.GET)
	public String list(Model model) {
		logger.info("Room ListPage!");
		
		List<RoomDTO> rooms = roomService.SelectAll();
		List<BuildingDTO> buildings = buildingService.SelectAll();
		
		model.addAttribute("rooms", rooms);
		model.addAttribute("buildings", buildings);

		return "/room/roomManageList";
	}
	
	//Room 등록
	@RequestMapping(value="/roomInsertForm",method=RequestMethod.GET)
	public String roomInsertForm() {
		logger.info("Room Insert Form!");
		return "/room/roomInsertForm";	
	}
	
}
