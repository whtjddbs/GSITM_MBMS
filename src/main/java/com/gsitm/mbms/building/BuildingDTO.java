package com.gsitm.mbms.building;

/**
 * @작성일 : 2019. 5. 23.
 * @작성자 : 김원빈
 */
public class BuildingDTO {
	int buildingNo;
	String buildName;
	String buildAddr;
	String buildPost;
	
	public BuildingDTO() {}

	public int getBuildingNo() {
		return buildingNo;
	}

	public void setBuildingNo(int buildingNo) {
		this.buildingNo = buildingNo;
	}

	public String getBuildName() {
		return buildName;
	}

	public void setBuildName(String buildName) {
		this.buildName = buildName;
	}

	public String getBuildAddr() {
		return buildAddr;
	}

	public void setBuildAddr(String buildAddr) {
		this.buildAddr = buildAddr;
	}

	public String getBuildPost() {
		return buildPost;
	}

	public void setBuildPost(String buildPost) {
		this.buildPost = buildPost;
	}

	@Override
	public String toString() {
		return "BuildingDTO [buildingNo=" + buildingNo + ", buildName=" + buildName + ", buildAddr=" + buildAddr
				+ ", buildPost=" + buildPost + "]";
	}

	
	
}
