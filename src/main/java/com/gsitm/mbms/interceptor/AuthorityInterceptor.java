package com.gsitm.mbms.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.gsitm.mbms.employee.EmployeeDTO;
import com.gsitm.mbms.employee.LoginService;

/**
 * @주제 :
 * @작성일 : 2019. 5. 10.
 * @작성자 : 송민기
 */
@Component
public class AuthorityInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	private LoginService loginService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		EmployeeDTO employeeDTO = (EmployeeDTO) session.getAttribute("login");
		boolean isAdminBool = loginService.isAdmin(employeeDTO.getEmpNo());

		// 운영자 아닐때
		if (isAdminBool == false) {
			response.sendRedirect("/error/errorAuthority");
			return false;
		}

		return true;
	}
}
