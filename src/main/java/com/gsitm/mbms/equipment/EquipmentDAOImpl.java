package com.gsitm.mbms.equipment;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * @주제 : 
 * @작성일 : 2019. 6. 19.
 * @작성자 : 조성윤
 */
@Repository
public class EquipmentDAOImpl implements EquipmentDAO {

	@Autowired
	SqlSession session;
	
	@Override
	public List<EquipmentDTO> selectOneByRoomNo(int roomNo) {
		return session.selectList("equipmentMapper.selectOneByRoomNo", roomNo);
	}

}
