package com.gsitm.mbms.room;

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

}
