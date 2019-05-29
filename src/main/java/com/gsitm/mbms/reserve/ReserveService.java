package com.gsitm.mbms.reserve;

import java.util.List;
import java.util.Map;

import com.gsitm.mbms.room.RoomDTO;

/**
 * @주제 : 
 * @작성일 : 2019. 5. 29.
 * @작성자 : 조성윤
 */
public interface ReserveService {
	/** 전체회의실 출력 */
	public List<RoomDTO> selectAllRoom();
	
	/** 조건에 의한 회의실 검색 **/
	public List<RoomDTO> selectRoomBySearch(Map<String, String> map);
}
