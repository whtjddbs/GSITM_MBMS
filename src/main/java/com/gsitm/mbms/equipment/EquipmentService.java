package com.gsitm.mbms.equipment;

import java.util.List;

/**
 * @주제 : 
 * @작성일 : 2019. 6. 19.
 * @작성자 : 김원빈
 */

public interface EquipmentService {
	//비품 등록
	public void equipmentInsert(EquipmentDTO dto);

	public List<EquipmentDTO> equipmentDistinctSelect();

}
