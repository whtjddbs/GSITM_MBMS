package com.gsitm.mbms.stats;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gsitm.mbms.employee.DepartmentDTO;
import com.gsitm.mbms.employee.EmployeeDAO;

/**
 * @주제 :
 * @작성일 : 2019. 5. 16.
 * @작성자 : 송민기
 */
@Service
public class StatsServiceImpl implements StatsService {
	@Autowired
	private StatsDAO statsDAO;
	
	/**민기 : 부서 명단 뽑아오기-----------------------------*/
	@Override
	public List<DepartmentDTO> selectAllDept() {
		return statsDAO.selectAllDept();
	}

}
