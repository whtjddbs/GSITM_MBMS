package com.gsitm.mbms.equipment;

import java.util.List;

/**
 * @주제 : 
 * @작성일 : 2019. 6. 19.
 * @작성자 : 조성윤
 */
public interface EquipmentService {
	/** 성윤: 회의실번호로 회의실 내 비품목록 조회 **/
	public List<EquipmentDTO> selectOneByRoomNo(int roomNo);
}
