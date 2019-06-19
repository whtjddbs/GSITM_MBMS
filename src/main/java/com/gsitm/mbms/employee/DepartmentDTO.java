package com.gsitm.mbms.employee;

import com.gsitm.mbms.notice.NoticeDTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @주제 : 
 * @작성일 : 2019. 5. 7.
 * @작성자 : 조성윤
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DepartmentDTO {
	private int deptNo;		//부서번호
	private String deptName;	//부서명
	private String bossNo;		//부서장
	private int mgrDeptNo;	//상위 부서 번호
	
//	/**
//	 * 
//	 */
//	public DepartmentDTO() {
//		super();
//		
//	}
//	/**
//	 * @param dept_no
//	 * @param dept_name
//	 * @param boss_no
//	 * @param mgr_dept_no
//	 */
//	public DepartmentDTO(int dept_no, String dept_name, int boss_no, int mgr_dept_no) {
//		super();
//		this.dept_no = dept_no;
//		this.dept_name = dept_name;
//		this.boss_no = boss_no;
//		this.mgr_dept_no = mgr_dept_no;
//	}
//	/**
//	 * @return the dept_no
//	 */
//	public int getDept_no() {
//		return dept_no;
//	}
//	/**
//	 * @param dept_no the dept_no to set
//	 */
//	public void setDept_no(int dept_no) {
//		this.dept_no = dept_no;
//	}
//	/**
//	 * @return the dept_name
//	 */
//	public String getDept_name() {
//		return dept_name;
//	}
//	/**
//	 * @param dept_name the dept_name to set
//	 */
//	public void setDept_name(String dept_name) {
//		this.dept_name = dept_name;
//	}
//	/**
//	 * @return the boss_no
//	 */
//	public int getBoss_no() {
//		return boss_no;
//	}
//	/**
//	 * @param boss_no the boss_no to set
//	 */
//	public void setBoss_no(int boss_no) {
//		this.boss_no = boss_no;
//	}
//	/**
//	 * @return the mgr_dept_no
//	 */
//	public int getMgr_dept_no() {
//		return mgr_dept_no;
//	}
//	/**
//	 * @param mgr_dept_no the mgr_dept_no to set
//	 */
//	public void setMgr_dept_no(int mgr_dept_no) {
//		this.mgr_dept_no = mgr_dept_no;
//	}
	
}
