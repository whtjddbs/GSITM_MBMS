package com.gsitm.mbms.employee;

import org.springframework.stereotype.Component;

/**
 * @주제 : Employee테이블 DTO
 * @작성일 : 2019. 5. 3.
 * @작성자 : 조성윤
 */
@Component
public class EmployeeDTO {
	private String emp_no; 
	private String emp_pw;
	private String emp_name;
	private String emp_position;
	private String emp_email;
	private String cell_phone;
	private String office_phone;
	private int dept_no;
	private char permission_yn;

	/**생성자*/
	public EmployeeDTO() {
		super();
	}
	public EmployeeDTO(String emp_no, String emp_pw, String emp_name, String emp_position, String emp_email,
			String cell_phone, String office_phone, int dept_no, char permission_yn) {
		super();
		this.emp_no = emp_no;
		this.emp_pw = emp_pw;
		this.emp_name = emp_name;
		this.emp_position = emp_position;
		this.emp_email = emp_email;
		this.cell_phone = cell_phone;
		this.office_phone = office_phone;
		this.dept_no = dept_no;
		this.permission_yn = permission_yn;
	}
	/**
	 * @return the emp_no
	 */
	public String getEmp_no() {
		return emp_no;
	}
	/**
	 * @param emp_no the emp_no to set
	 */
	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}
	/**
	 * @return the emp_pw
	 */
	public String getEmp_pw() {
		return emp_pw;
	}
	/**
	 * @param emp_pw the emp_pw to set
	 */
	public void setEmp_pw(String emp_pw) {
		this.emp_pw = emp_pw;
	}
	/**
	 * @return the emp_name
	 */
	public String getEmp_name() {
		return emp_name;
	}
	/**
	 * @param emp_name the emp_name to set
	 */
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	/**
	 * @return the emp_position
	 */
	public String getEmp_position() {
		return emp_position;
	}
	/**
	 * @param emp_position the emp_position to set
	 */
	public void setEmp_position(String emp_position) {
		this.emp_position = emp_position;
	}
	/**
	 * @return the emp_email
	 */
	public String getEmp_email() {
		return emp_email;
	}
	/**
	 * @param emp_email the emp_email to set
	 */
	public void setEmp_email(String emp_email) {
		this.emp_email = emp_email;
	}
	/**
	 * @return the cell_phone
	 */
	public String getCell_phone() {
		return cell_phone;
	}
	/**
	 * @param cell_phone the cell_phone to set
	 */
	public void setCell_phone(String cell_phone) {
		this.cell_phone = cell_phone;
	}
	/**
	 * @return the office_phone
	 */
	public String getOffice_phone() {
		return office_phone;
	}
	/**
	 * @param office_phone the office_phone to set
	 */
	public void setOffice_phone(String office_phone) {
		this.office_phone = office_phone;
	}
	/**
	 * @return the dept_no
	 */
	public int getDept_no() {
		return dept_no;
	}
	/**
	 * @param dept_no the dept_no to set
	 */
	public void setDept_no(int dept_no) {
		this.dept_no = dept_no;
	}
	/**
	 * @return the permission_yn
	 */
	public char getPermission_yn() {
		return permission_yn;
	}
	/**
	 * @param permission_yn the permission_yn to set
	 */
	public void setPermission_yn(char permission_yn) {
		this.permission_yn = permission_yn;
	}
	
}