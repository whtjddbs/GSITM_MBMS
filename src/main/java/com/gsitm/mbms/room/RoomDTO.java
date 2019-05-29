package com.gsitm.mbms.room;

/**
 * @주제 : 
 * @작성일 : 2019. 5. 29.
 * @작성자 : 조성윤
 */
public class RoomDTO {
	private int roomNo;
	private int buildNo;
	private String roomName;
	private int roomSpace;
	private int roomNumEmp;
	private String mgrEmpNo;
	private String roomImg;
	private int roomPrice;
	private char networkYn;
	private int roomFloor;
	private String roomType;
	/**
	 * 
	 */
	public RoomDTO() {
		super();
		
	}
	/**
	 * @param roomNo
	 * @param buildNo
	 * @param roomName
	 * @param roomSpace
	 * @param roomNumEmp
	 * @param mgrEmpNo
	 * @param roomImg
	 * @param roomPrice
	 * @param networkYn
	 * @param roomFloor
	 * @param roomType
	 */
	public RoomDTO(int roomNo, int buildNo, String roomName, int roomSpace, int roomNumEmp, String mgrEmpNo,
			String roomImg, int roomPrice, char networkYn, int roomFloor, String roomType) {
		super();
		this.roomNo = roomNo;
		this.buildNo = buildNo;
		this.roomName = roomName;
		this.roomSpace = roomSpace;
		this.roomNumEmp = roomNumEmp;
		this.mgrEmpNo = mgrEmpNo;
		this.roomImg = roomImg;
		this.roomPrice = roomPrice;
		this.networkYn = networkYn;
		this.roomFloor = roomFloor;
		this.roomType = roomType;
	}
	/**
	 * @return the roomNo
	 */
	public int getRoomNo() {
		return roomNo;
	}
	/**
	 * @param roomNo the roomNo to set
	 */
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}
	/**
	 * @return the buildNo
	 */
	public int getBuildNo() {
		return buildNo;
	}
	/**
	 * @param buildNo the buildNo to set
	 */
	public void setBuildNo(int buildNo) {
		this.buildNo = buildNo;
	}
	/**
	 * @return the roomName
	 */
	public String getRoomName() {
		return roomName;
	}
	/**
	 * @param roomName the roomName to set
	 */
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	/**
	 * @return the roomSpace
	 */
	public int getRoomSpace() {
		return roomSpace;
	}
	/**
	 * @param roomSpace the roomSpace to set
	 */
	public void setRoomSpace(int roomSpace) {
		this.roomSpace = roomSpace;
	}
	/**
	 * @return the roomNumEmp
	 */
	public int getRoomNumEmp() {
		return roomNumEmp;
	}
	/**
	 * @param roomNumEmp the roomNumEmp to set
	 */
	public void setRoomNumEmp(int roomNumEmp) {
		this.roomNumEmp = roomNumEmp;
	}
	/**
	 * @return the mgrEmpNo
	 */
	public String getMgrEmpNo() {
		return mgrEmpNo;
	}
	/**
	 * @param mgrEmpNo the mgrEmpNo to set
	 */
	public void setMgrEmpNo(String mgrEmpNo) {
		this.mgrEmpNo = mgrEmpNo;
	}
	/**
	 * @return the roomImg
	 */
	public String getRoomImg() {
		return roomImg;
	}
	/**
	 * @param roomImg the roomImg to set
	 */
	public void setRoomImg(String roomImg) {
		this.roomImg = roomImg;
	}
	/**
	 * @return the roomPrice
	 */
	public int getRoomPrice() {
		return roomPrice;
	}
	/**
	 * @param roomPrice the roomPrice to set
	 */
	public void setRoomPrice(int roomPrice) {
		this.roomPrice = roomPrice;
	}
	/**
	 * @return the networkYn
	 */
	public char getNetworkYn() {
		return networkYn;
	}
	/**
	 * @param networkYn the networkYn to set
	 */
	public void setNetworkYn(char networkYn) {
		this.networkYn = networkYn;
	}
	/**
	 * @return the roomFloor
	 */
	public int getRoomFloor() {
		return roomFloor;
	}
	/**
	 * @param roomFloor the roomFloor to set
	 */
	public void setRoomFloor(int roomFloor) {
		this.roomFloor = roomFloor;
	}
	/**
	 * @return the roomType
	 */
	public String getRoomType() {
		return roomType;
	}
	/**
	 * @param roomType the roomType to set
	 */
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	
	@Override
	public String toString() {
		return "RoomDTO [roomNo=" + roomNo + ", buildNo=" + buildNo + ", roomName=" + roomName + ", roomSpace="
				+ roomSpace + ", roomNumEmp=" + roomNumEmp + ", mgrEmpNo=" + mgrEmpNo + ", roomImg=" + roomImg
				+ ", roomPrice=" + roomPrice + ", networkYn=" + networkYn + ", roomFloor=" + roomFloor + ", roomType="
				+ roomType + "]";
	}
	
}
