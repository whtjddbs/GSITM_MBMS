package com.gsitm.mbms.employee;

import org.springframework.stereotype.Component;

/**
 * @주제 : Employee테이블 DTO
 * @작성일 : 2019. 5. 3.
 * @작성자 : 조성윤
 */
@Component
public class EmployeeDTO {
	private String empNo; 
	private String empPw;
	private String empName;
	private String empPosition;
	private String empEmail;
	private String cellPhone;
	private String officePhone;
	private int deptNo;
	private char permissionYn;
	/**
	 * 
	 */
	public EmployeeDTO() {
		super();
		
	}
	/**
	 * @param empNo
	 * @param empPw
	 * @param empName
	 * @param empPosition
	 * @param empEmail
	 * @param cellPhone
	 * @param officePhone
	 * @param deptNo
	 * @param permissionYn
	 */
	public EmployeeDTO(String empNo, String empPw, String empName, String empPosition, String empEmail,
			String cellPhone, String officePhone, int deptNo, char permissionYn) {
		super();
		this.empNo = empNo;
		this.empPw = empPw;
		this.empName = empName;
		this.empPosition = empPosition;
		this.empEmail = empEmail;
		this.cellPhone = cellPhone;
		this.officePhone = officePhone;
		this.deptNo = deptNo;
		this.permissionYn = permissionYn;
	}
	/**
	 * @return the empNo
	 */
	public String getEmpNo() {
		return empNo;
	}
	/**
	 * @param empNo the empNo to set
	 */
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	/**
	 * @return the empPw
	 */
	public String getEmpPw() {
		return empPw;
	}
	/**
	 * @param empPw the empPw to set
	 */
	public void setEmpPw(String empPw) {
		this.empPw = empPw;
	}
	/**
	 * @return the empName
	 */
	public String getEmpName() {
		return empName;
	}
	/**
	 * @param empName the empName to set
	 */
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	/**
	 * @return the empPosition
	 */
	public String getEmpPosition() {
		return empPosition;
	}
	/**
	 * @param empPosition the empPosition to set
	 */
	public void setEmpPosition(String empPosition) {
		this.empPosition = empPosition;
	}
	/**
	 * @return the empEmail
	 */
	public String getEmpEmail() {
		return empEmail;
	}
	/**
	 * @param empEmail the empEmail to set
	 */
	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}
	/**
	 * @return the cellPhone
	 */
	public String getCellPhone() {
		return cellPhone;
	}
	/**
	 * @param cellPhone the cellPhone to set
	 */
	public void setCellPhone(String cellPhone) {
		this.cellPhone = cellPhone;
	}
	/**
	 * @return the officePhone
	 */
	public String getOfficePhone() {
		return officePhone;
	}
	/**
	 * @param officePhone the officePhone to set
	 */
	public void setOfficePhone(String officePhone) {
		this.officePhone = officePhone;
	}
	/**
	 * @return the deptNo
	 */
	public int getDeptNo() {
		return deptNo;
	}
	/**
	 * @param deptNo the deptNo to set
	 */
	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}
	/**
	 * @return the permissionYn
	 */
	public char getPermissionYn() {
		return permissionYn;
	}
	/**
	 * @param permissionYn the permissionYn to set
	 */
	public void setPermissionYn(char permissionYn) {
		this.permissionYn = permissionYn;
	} 
	/*@Override
	public String toString() {
		return "EmployeeDTO [empNo=" + empNo + ", empPw=" + empPw + ", empName=" + empName + ", empPosition="
				+ empPosition + ", empEmail=" + empEmail + ", cellPhone=" + cellPhone + ", officePhone=" + officePhone
				+ ", deptNo=" + deptNo + ", permissionYn=" + permissionYn + "]";
	}*/
	
	

}