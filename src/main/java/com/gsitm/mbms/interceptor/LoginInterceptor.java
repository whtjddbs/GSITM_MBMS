package com.gsitm.mbms.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.gsitm.mbms.employee.EmployeeDAO;
import com.gsitm.mbms.employee.EmployeeDTO;

/**
 * @주제 : 
 * @작성일 : 2019. 5. 10.
 * @작성자 : 조성윤
 */
@Component
public class LoginInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	private EmployeeDAO EmployeeDAO;
	
	@Override 
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Object login = session.getAttribute("login");
		
		//로그인 세션 없을 때
		/*if(login == null) {
			System.out.println("LoginInterceptor : "+request.getServletPath());
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if(loginCookie != null) {
				String id = loginCookie.getValue();
				EmployeeDTO employeeDTO = EmployeeDAO.getEmployee(id);
				if(employeeDTO != null) {
					session.setAttribute("employeeDTO", employeeDTO);
					return true;
				}
			}
			
			//로그인이 안되어 있는 상태 - 로그인 폼으로 돌려 보냄
			response.sendRedirect("/login");
		}*/
		
		return true;
	}
}
