package com.gsitm.mbms.stats;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gsitm.mbms.employee.DepartmentDTO;
import com.gsitm.mbms.reserve.ReserveHistoryDTO;

/**
 * @주제 : 
 * @작성일 : 2019. 5. 16.
 * @작성자 : 송민기
 */

public interface StatsService {

	/**민기 : 부서 명단 뽑아오기-----------------------------*/
	public List<DepartmentDTO> selectAllDept();
	
	//히스토리 전체출력
	public List<ReserveHistoryDTO> selectAllHistory();
	
	//히스토리 필터링 출력

	public List<ReserveHistoryDTO> selectFilterHistory(Map<String, String> filterMap);

}
