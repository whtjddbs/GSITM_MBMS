package com.gsitm.mbms.equipment;

import java.util.List;
import java.util.Map;

/**
 * @작성일 : 2019. 6. 20.
 * @작성자 : 김원빈
 */
public interface EquipmentDAO {

	void equipmentInsert(EquipmentDTO dto);

	List<EquipmentDTO> equipmentDistinctSelect();

	List<EquipmentDTO> equipmentSelectAll();

	List<Map<String, Object>> equipmentSelectAllwithRoom();

}
