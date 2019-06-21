package com.gsitm.mbms.equipment;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gsitm.mbms.building.BuildingDTO;

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
	
	//equipment 목록
	@RequestMapping(value="/equipmentList", method=RequestMethod.GET)
	public String list(Model model) {
		log.trace("equipment ListPage!");
		
		//List<EquipmentDTO> list = service.equipmentSelectAll();
		List<Map<String, Object>> list= service.equipmentSelectAllwithRoom();
		model.addAttribute("list",list);
		return "/equipment/equipmentList";//test
	}
}
