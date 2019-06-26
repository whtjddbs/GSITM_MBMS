package com.gsitm.mbms.employee;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gsitm.mbms.reserve.ReserveDAO;
import com.gsitm.mbms.reserve.ReserveHistoryDTO;
import com.gsitm.mbms.stats.StatsDAO;

/**
 * @주제 : 
 * @작성일 : 2019. 5. 7.
 * @작성자 : 조성윤
 */
@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	private EmployeeDAO employeeDAO;
	
	@Autowired
	private ReserveDAO reserveDAO;
	
	@Autowired
	private StatsDAO statsDAO;
	
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
		
		return isAdminBool; //운영자면 true 리턴
	}
	
	/**민기 : 해당 사용자가 결재자인지 판별-----------------------------*/
	//현재 부서장이거나, 예전 결재한적이 있으면 결재자로 취급
	@Override
	public boolean isApprover(String empNo) {
		
		//모든 예약 명단 뽑기 (1, 2차 결재자인지 판별 위해), 모든 부서 명단 뽑기 (부서장 판별 위해)
		List<ReserveHistoryDTO> reserveHistoryList = reserveDAO.getAllReservationList();
		List<DepartmentDTO> deptList =  statsDAO.selectAllDept();
		
		//1차 결재자였던 내역이 있는가
//		boolean is1ApproverBool = false;
//		System.out.println(reserveHistoryList);
//		for (ReserveHistoryDTO reserveHistory : reserveHistoryList) {
//			if (reserveHistory.getApproval1EmpNo().equals(empNo)) {
//				is1ApproverBool = true;
//				//System.out.println("1차결재자임!");
//				break;
//			}
//		}
//		
//		//2차 결재자였던 내역이 있는가
//		boolean is2ApproverBool = false;
//		for (ReserveHistoryDTO reserveHistory : reserveHistoryList) {
//			if (reserveHistory.getApproval2EmpNo().equals(empNo)) {
//				is2ApproverBool = true;
//				//System.out.println("2차결재자임!");
//				break;
//			}
//		}
//		
//		//현재 부서장인가
//		boolean isDeptBossBool = false;
//		for (DepartmentDTO dept : deptList) {
//			if (dept.getBossNo().equals(empNo)) {
//				isDeptBossBool = true;
//				//System.out.println("부서장임!");
//				break;
//			}
//		}
//		return is1ApproverBool | is2ApproverBool | isDeptBossBool; //한개라도 맞으면 true 리턴
		return true;
	}
	 

}
