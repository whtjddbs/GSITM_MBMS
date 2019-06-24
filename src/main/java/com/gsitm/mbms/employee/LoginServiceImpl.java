package com.gsitm.mbms.employee;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gsitm.mbms.notice.NoticeDTO;

/**
 * @주제 : 
 * @작성일 : 2019. 5. 7.
 * @작성자 : 조성윤
 */
@Service
public class LoginServiceImpl implements LoginService {
	@Autowired
	private EmployeeDAO employeeDAO;
	
	@Override
	public EmployeeDTO login(Map<String,String> map) {
		return employeeDAO.login(map);
	}
 
	@Override
	public EmployeeDTO getEmployee(String emp_no) {
		return employeeDAO.getEmployee(emp_no);
	}
	
	
	/**민기 : 회의실 관리자 명단 뽑아오기-----------------------------*/
	@Override
	public List<EmployeeDTO> selectAllAdmin(){
		return employeeDAO.selectAllAdmin();

	}
	
	/**민기 : 해당 사용자가 관리자인지 판별-----------------------------*/
	@Override
	public boolean isAdmin(String empNo) {
		//회의실 관리자 명단 뽑기
		List<EmployeeDTO> adminList = employeeDAO.selectAllAdmin();

		// 운영자인지 판별
		boolean isAdminBool = false;
		for (int i = 0; i < adminList.size(); i++) {
			if (adminList.get(i).getEmpNo().equals(empNo)) {
				isAdminBool = true;
				break;
			}
		}
		
		return isAdminBool;
	}
	 

}
