package com.gsitm.mbms.building;

/**
 * @작성일 : 2019. 5. 23.
 * @작성자 : 김원빈
 */
public class BuildingDTO {
	int bulildingNo;
	String bulidName;
	String bulidAddr;
	String bulidPost;
	
	
	public BuildingDTO(int bulildingNo, String bulidName, String bulidAddr, String bulidPost) {
		super();
		this.bulildingNo = bulildingNo;
		this.bulidName = bulidName;
		this.bulidAddr = bulidAddr;
		this.bulidPost = bulidPost;
	}
	
	public int getBulildingNo() {
		return bulildingNo;
	}
	public void setBulildingNo(int bulildingNo) {
		this.bulildingNo = bulildingNo;
	}
	public String getBulidName() {
		return bulidName;
	}
	public void setBulidName(String bulidName) {
		this.bulidName = bulidName;
	}
	public String getBulidAddr() {
		return bulidAddr;
	}
	public void setBulidAddr(String bulidAddr) {
		this.bulidAddr = bulidAddr;
	}
	public String getBulidPost() {
		return bulidPost;
	}
	public void setBulidPost(String bulidPost) {
		this.bulidPost = bulidPost;
	}

	@Override
	public String toString() {
		return "BuildingDTO [bulildingNo=" + bulildingNo + ", bulidName=" + bulidName + ", bulidAddr=" + bulidAddr
				+ ", bulidPost=" + bulidPost + "]";
	}
	
	
}
