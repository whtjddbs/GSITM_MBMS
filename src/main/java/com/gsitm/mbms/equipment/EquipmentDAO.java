package com.gsitm.mbms.equipment;

import java.util.List;

public interface EquipmentDAO {

	void equipmentInsert(EquipmentDTO dto);

	List<EquipmentDTO> equipmentDistinctSelect();

}
