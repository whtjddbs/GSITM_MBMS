package com.gsitm.mbms.employee;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

/**
 * @주제 : 
 * @작성일 : 2019. 5. 7.
 * @작성자 : 조성윤
 */
@Repository
public class EmployeeDAOImpl implements EmployeeDAO {
	@Inject
	private SqlSession sqlSession;

	@Override
	public EmployeeDTO getEmployee(String emp_no) {
		return sqlSession.selectOne("employeeMapper.getEmployee",emp_no);
	}

	@Override
	public EmployeeDTO login(Map<String, String> map) {
		return sqlSession.selectOne("employeeMapper.login", map);
	} 
	
	/**민기 : 회의실 관리자 명단 뽑아오기-----------------------------*/
	@Override
	public List<EmployeeDTO> selectAllAdmin() {
		return sqlSession.selectList("employeeMapper.selectAllAdmin");
	}
}
