package com.gsitm.mbms.employee;

import java.util.List;
import java.util.Map;

/**
 * @주제 : 
 * @작성일 : 2019. 5. 3.
 * @작성자 : 조성윤
 */
public interface EmployeeDAO {
	
	public EmployeeDTO getEmployee(String emp_no);

	public EmployeeDTO login(Map<String, String> map);

	public List<EmployeeDTO> selectAllAdmin();
	
	public List<Map<String, Object>> getEmployeeList();

	 
}
