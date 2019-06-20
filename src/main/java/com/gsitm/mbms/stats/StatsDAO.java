package com.gsitm.mbms.stats;

import java.util.List;
import java.util.Map;

import com.gsitm.mbms.employee.DepartmentDTO;
import com.gsitm.mbms.reserve.ReserveHistoryDTO;

/**
 * @주제 : 
 * @작성일 : 2019. 5. 3.
 * @작성자 : 송민기
 */
public interface StatsDAO {
	
	//부서 전체출력
	public List<DepartmentDTO> selectAllDept();

	//히스토리 전체출력
	public List<ReserveHistoryDTO> selectAllHistory();

	//히스토리 필터링 출력
	public List<ReserveHistoryDTO> selectFilterHistory(Map<String, String> filterMap);
	 
}
