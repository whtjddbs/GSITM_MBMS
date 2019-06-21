package com.gsitm.mbms.equipment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @주제 : 
 * @작성일 : 2019. 6. 19.
 * @작성자 : 조성윤
 */
@Service
public class EquipmentServiceImpl implements EquipmentService {

	@Autowired
	EquipmentDAO equipmentDAO;
	
	@Override
	public List<EquipmentDTO> selectOneByRoomNo(int roomNo) {
		return equipmentDAO.selectOneByRoomNo(roomNo);
	}

}
