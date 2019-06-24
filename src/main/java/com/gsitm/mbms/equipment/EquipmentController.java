package com.gsitm.mbms.equipment;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gsitm.mbms.building.BuildingDTO;
import com.gsitm.mbms.building.BuildingService;

import lombok.extern.slf4j.Slf4j;

/**
 * @작성일 : 2019. 6. 20.
 * @작성자 : 김원빈
 */
@Controller
@RequestMapping("/equipment")
@Slf4j
public class EquipmentController {

	@Inject
	EquipmentService service;
	@Inject
	BuildingService buildingService;
	
	@PostMapping("/equipmentInsert")
	public String equipmentInsert(EquipmentDTO dto,String[] roomList) {
		System.out.println(roomList.length);
		for(int i=0;i<roomList.length;i++) {
			System.out.println(roomList[i]);
			service.equipmentInsert(new EquipmentDTO(Integer.parseInt(roomList[i]),0,dto.getEqName(),dto.getEqCount()));
		}
		return "redirect:/equipment/equipmentList";
	}
	
	//equipment 목록
	@RequestMapping(value="/equipmentList", method=RequestMethod.GET)
	public String list(Model model) {
		log.trace("equipment ListPage!");
		
		List<Map<String, Object>> list= service.equipmentSelectAllwithRoom();
		
		List<BuildingDTO> buildings = buildingService.selectAllWithRooms();
		model.addAttribute("list",list);
			
		model.addAttribute("buildings",buildings);
		System.out.println(buildings.get(3).getRooms().toString());
		return "/equipment/equipmentList";//test
	}
}
