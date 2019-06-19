package com.gsitm.mbms.stats;

import java.util.List;
import java.util.Map;

import com.gsitm.mbms.employee.DepartmentDTO;

/**
 * @주제 : 
 * @작성일 : 2019. 5. 3.
 * @작성자 : 송민기
 */
public interface StatsDAO {
	
	public List<DepartmentDTO> selectAllDept();
	 
}
