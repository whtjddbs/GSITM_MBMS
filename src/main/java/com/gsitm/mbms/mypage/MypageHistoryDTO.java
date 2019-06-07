package com.gsitm.mbms.mypage;

/**
 * @작성일 : 2019. 5. 28.
 * @작성자 : 이주현
 */

public class MypageHistoryDTO {

	private int reserveNo;
	private int roomNo;
	private String reserveEmpNo;
	private String startDate;
	private String endDate;
	private char approval1Yn;
	private String approval1EmpNo;
	private String approval1Date;
	private char approval2Yn;
	private String approval2EmpNo;
	private String approval2Date;
	private char paymentYn;
	private String paymentDate;
	private String reserveDate;
	private int reservePrice;
	private String purpose;
	private String category;
	private int priority;
	private int empCount;
	private char snackYn;
	
	public MypageHistoryDTO() {
		super();
	}
	
	public MypageHistoryDTO(int reserveNo, int roomNo, String reserveEmpNo, String startDate, String endDate, char approval1Yn, String approval1EmpNo, String approval1Date, char approval2Yn,  String approval2EmpNo, String approval2Date, char paymentYn, String paymentDate, String reserveDate, int reservePrice, String purpose, String category, int priority, int empCount, char snackYn) {
		this.reserveNo = reserveNo;
		this.roomNo = roomNo;
		this.reserveEmpNo = reserveEmpNo;
		this.startDate = startDate;
		this.endDate = endDate;
		this.approval1Yn = approval1Yn;
		this.approval1EmpNo = approval1EmpNo;
		this.approval1Date = approval1Date;
		this.approval2Yn = approval2Yn;
		this.approval2EmpNo = approval2EmpNo;
		this.approval2Date = approval2Date;
		this.paymentYn = paymentYn;
		this.paymentDate = paymentDate;
		this.reserveDate = reserveDate;
		this.reservePrice = reservePrice;
		this.purpose = purpose;
		this.category = category;
		this.priority = priority;
		this.empCount = empCount;
		this.snackYn = snackYn;
	
	}
	
	public int getReserveNo() {
		return reserveNo;
	}

	public void setReserveNo(int reserveNo) {
		this.reserveNo = reserveNo;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public String getReserveEmpNo() {
		return reserveEmpNo;
	}

	public void setReserveEmpNo(String reserveEmpNo) {
		this.reserveEmpNo = reserveEmpNo;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public char getApproval1Yn() {
		return approval1Yn;
	}

	public void setApproval1Yn(char approval1Yn) {
		this.approval1Yn = approval1Yn;
	}

	public String getApproval1EmpNo() {
		return approval1EmpNo;
	}

	public void setApproval1EmpNo(String approval1EmpNo) {
		this.approval1EmpNo = approval1EmpNo;
	}

	public String getApproval1Date() {
		return approval1Date;
	}

	public void setApproval1Date(String approval1Date) {
		this.approval1Date = approval1Date;
	}

	public char getApproval2Yn() {
		return approval2Yn;
	}

	public void setApproval2Yn(char approval2Yn) {
		this.approval2Yn = approval2Yn;
	}

	public String getApproval2EmpNo() {
		return approval2EmpNo;
	}

	public void setApproval2EmpNo(String approval2EmpNo) {
		this.approval2EmpNo = approval2EmpNo;
	}

	public String getApproval2Date() {
		return approval2Date;
	}

	public void setApproval2Date(String approval2Date) {
		this.approval2Date = approval2Date;
	}

	public char getPaymentYn() {
		return paymentYn;
	}

	public void setPaymentYn(char paymentYn) {
		this.paymentYn = paymentYn;
	}

	public String getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}

	public String getReserveDate() {
		return reserveDate;
	}

	public void setReserveDate(String reserveDate) {
		this.reserveDate = reserveDate;
	}

	public int getReservePrice() {
		return reservePrice;
	}

	public void setReservePrice(int reservePrice) {
		this.reservePrice = reservePrice;
	}

	public String getPurpose() {
		return purpose;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getPriority() {
		return priority;
	}

	public void setPriority(int priority) {
		this.priority = priority;
	}

	public int getEmpCount() {
		return empCount;
	}

	public void setEmpCount(int empCount) {
		this.empCount = empCount;
	}

	public char getSnackYn() {
		return snackYn;
	}

	public void setSnackYn(char snackYn) {
		this.snackYn = snackYn;
	}

	@Override
	public String toString() {
		return "MypageHistoryDTO [reserveNo=" + reserveNo + ", roomNo=" + roomNo + ", reserveEmpNo=" + reserveEmpNo
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", approval1Yn=" + approval1Yn
				+ ", approval1EmpNo=" + approval1EmpNo + ", approval1Date=" + approval1Date + ", approval2Yn="
				+ approval2Yn + ", approval2EmpNo=" + approval2EmpNo + ", approval2Date=" + approval2Date
				+ ", paymentYn=" + paymentYn + ", paymentDate=" + paymentDate + ", reserveDate=" + reserveDate
				+ ", reservePrice=" + reservePrice + ", purpose=" + purpose + ", category=" + category + ", priority="
				+ priority + ", empCount=" + empCount + ", snackYn=" + snackYn + "]";
	}
	
}





