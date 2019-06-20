package com.gsitm.mbms.equipment;

import java.util.List;

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
	
	@RequestMapping(value="/equipmentList", method=RequestMethod.POST)
	public ModelAndView list(String roomNo) {
		log.trace("Equipment List!");
		
		List<EquipmentDTO> list = service.equipmentDistinctSelect();
		ModelAndView mav = new ModelAndView();
		mav.addObject("equipmentList", list);
		mav.setViewName("jsonView");

		return mav;
	}
}
