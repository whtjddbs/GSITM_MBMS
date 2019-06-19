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

	//원빈 : 담당자 찾기 selectAll
	@Override
	public List<Map<String, Object>> getEmployeeList() {
		return sqlSession.selectList("employeeMapper.getEmployeeList");
	}

	/** 성윤: 모든 직원 정보 조회 **/
	@Override
	public List<EmployeeDTO> selectAllEmployee() {
		return sqlSession.selectList("employeeMapper.selectAllEmployee");
	}

	/** 성윤 : 부서 전체조회 (트리) **/
	@Override
	public List<Map<String, String>> selectAllDepartmentTree() {
		return sqlSession.selectList("departmentMapper.selectAllDepartmentTree");
	}
	
}
