package com.gsitm.mbms.equipment;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class EquipmentDAOImpl implements EquipmentDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void equipmentInsert(EquipmentDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.insert("equipmentMapper.equipmentInsert", dto);
	}

}
