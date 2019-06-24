package com.gsitm.mbms.room;

import java.util.List;

/**
 * @주제 : 
 * @작성일 : 2019. 5. 31.
 * @작성자 : 조성윤
 */
public interface RoomDAO {
	// 회의실 번호로 정보 찾기 
	public RoomDTO selectOneRoomByRoomNo(int roomNo);
	
	// 회의실 전체 검색
	public List<RoomDTO> selectAllRoom();
	
	//회의실 등록
	public void roomInsert(RoomDTO dto);

	public List<RoomDTO> selectAllWithEquipments();

	}


