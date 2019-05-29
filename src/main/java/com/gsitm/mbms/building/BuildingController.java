package com.gsitm.mbms.building;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * @작성일 : 2019. 5. 23.
 * @작성자 : 김원빈
 */
@Controller
public class BuildingController {

	private static final Logger logger = LoggerFactory.getLogger(BuildingController.class);
	
	
	//**로그인 화면*//*
	@RequestMapping(value="/buildingSelectAll", method=RequestMethod.GET)
	public String login() {
		logger.info("Building List !!");
		return "/building/buildingList";//test
	}
}
