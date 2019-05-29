package com.gsitm.mbms.reserve;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gsitm.mbms.room.RoomDTO;

/**
 * @주제 : 
 * @작성일 : 2019. 5. 29.
 * @작성자 : 조성윤
 */
@Repository
public class ReserveDAOImpl implements ReserveDAO {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<RoomDTO> selectAllRoom() {
		return session.selectList("roomMapper.selectAllRoom");
	}

}
