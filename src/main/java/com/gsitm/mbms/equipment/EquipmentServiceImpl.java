package com.gsitm.mbms.equipment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @주제 : 
 * @작성일 : 2019. 6. 19.
 * @작성자 : 김원빈
 */
@Service
public class EquipmentServiceImpl implements EquipmentService {

	@Autowired
	private EquipmentDAO equipmentDAO;
	@Override
	public void equipmentInsert(EquipmentDTO dto) {
		// TODO Auto-generated method stub
		equipmentDAO.equipmentInsert(dto);
	}
	@Override
	public List<EquipmentDTO> equipmentDistinctSelect() {
		// TODO Auto-generated method stub
		return equipmentDAO.equipmentDistinctSelect();
	}

}
