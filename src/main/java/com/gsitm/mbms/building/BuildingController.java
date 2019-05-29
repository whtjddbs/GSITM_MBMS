package com.gsitm.mbms.building;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


/**
 * @작성일 : 2019. 5. 23.
 * @작성자 : 김원빈
 */
@Controller
@RequestMapping("/building")
public class BuildingController {

	private static final Logger logger = LoggerFactory.getLogger(BuildingController.class);
	
	@Inject
	private BuildingService service;
	
	//**로그인 화면*//*
	@RequestMapping(value="/buildingList", method=RequestMethod.GET)
	public String list(Model model) {
		
		logger.info("Building List !!");
		
		List<BuildingDTO> list = service.SelectAll();
		System.out.println(list.size());
		
		model.addAttribute("list", list);
		
		return "building/buildingList";//test
	}
	
}
