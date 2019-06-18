package com.gsitm.mbms.room;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @주제 : 
 * @작성일 : 2019. 5. 31.
 * @작성자 : 조성윤
 */
@Service
public class RoomServiceImpl implements RoomService {
	
	@Autowired
	private RoomDAO roomDAO;

	@Override
	public RoomDTO selectOneRoomByRoomNo(int roomNo) {
		return roomDAO.selectOneRoomByRoomNo(roomNo);
	}

	@Override
	public List<RoomDTO> selectAllRoom() {
		// TODO Auto-generated method stub
		System.out.println(roomDAO.selectAllRoom().toString());
		return roomDAO.selectAllRoom();
	}

	@Override
	public void roomInsert(RoomDTO dto) {
		// TODO Auto-generated method stub
		System.out.println(dto.toString());
		roomDAO.roomInsert(dto);
		
	}
}
