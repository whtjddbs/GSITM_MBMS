package com.gsitm.mbms.equipment;

import java.util.List;
import java.util.Map;

/**
 * @주제 : 
 * @작성일 : 2019. 6. 19.
 * @작성자 : 조성윤
 */
public interface EquipmentDAO {

	void equipmentInsert(EquipmentDTO dto);

	List<EquipmentDTO> equipmentDistinctSelect();

	List<EquipmentDTO> equipmentSelectAll();

	List<Map<String, Object>> equipmentSelectAllwithRoom();
	
	/** 성윤: 회의실번호로 회의실 내 비품목록 조회 **/
	public List<EquipmentDTO> selectOneByRoomNo(int roomNo);
}
