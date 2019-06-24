package com.gsitm.mbms.room;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * @주제 : 
 * @작성일 : 2019. 5. 31.
 * @작성자 : 조성윤
 */
@Repository
public class RoomDAOImpl implements RoomDAO {
	
	@Autowired
	private SqlSession session;

	@Override
	public RoomDTO selectOneRoomByRoomNo(int roomNo) {
		return session.selectOne("roomMapper.selectOneRoomByRoomNo", roomNo);
	}

	@Override
	public List<RoomDTO> selectAllRoom() {
		// TODO Auto-generated method stub
		return session.selectList("roomMapper.selectAllRoom");
	}

	@Override
	public void roomInsert(RoomDTO dto) {
		// TODO Auto-generated method stub
		System.out.println("잠시만~");
		session.insert("roomMapper.insertRoom",dto);
		
	}
	@Override
	public List<RoomDTO> selectAllWithEquipments() {
		// TODO Auto-generated method stub
		return session.selectList("roomMapper.selectAllWithEquipments");
	}
}


