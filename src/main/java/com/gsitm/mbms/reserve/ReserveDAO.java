package com.gsitm.mbms.reserve;

import java.util.List;

import com.gsitm.mbms.room.RoomDTO;

/**
 * @주제 : 
 * @작성일 : 2019. 5. 29.
 * @작성자 : 조성윤
 */
public interface ReserveDAO {
	/** 전체회의실 출력 */
	public List<RoomDTO> selectAllRoom();
}