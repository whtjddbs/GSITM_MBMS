package com.gsitm.mbms.room;

/**
 * @주제 : 
 * @작성일 : 2019. 5. 31.
 * @작성자 : 조성윤
 */
public interface RoomDAO {
	/** 회의실 번호로 정보 찾기 **/
	public RoomDTO selectOneRoomByRoomNo(int roomNo);
}
