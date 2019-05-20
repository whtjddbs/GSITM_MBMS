package com.gsitm.mbms.employee;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gsitm.mbms.employee.LoginService;


/**
 * @주제 : 
 * @작성일 : 2019. 5. 3.
 * @작성자 : 조성윤
 */
@Controller
public class EmployeeController {
	
	private static final Logger logger = LoggerFactory.getLogger(EmployeeController.class);

	@Autowired
	private LoginService loginService;
	
	/**로그인 화면*/
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		logger.info("Login Page !!");
		return "login";
	}
	
	/** 로그인 */
	@RequestMapping(value="/logincheck", method=RequestMethod.POST)
	@ResponseBody
	public String loginCheck(@RequestParam Map<String,String> map
	          , HttpSession session) throws Exception {
		logger.info("Login Check !!");
		EmployeeDTO employeeDTO = loginService.login(map);
		
		if(employeeDTO == null) {
			if(loginService.getEmployee(map.get("emp_no"))==null) return "notExist"; //아이디 존재하지 않음
			else return "fail"; //비밀번호 틀림
		}
		
		session.setAttribute("login", employeeDTO); //로그인정보 저장
		
		return "success"; //로그인 성공
	}
}
